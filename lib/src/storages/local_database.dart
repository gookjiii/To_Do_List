import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../models/task.dart';
import './database.dart';

final class LocalDatabase implements Storage {
  static const dbName = 'tasks.db';

  static final LocalDatabase _instance = LocalDatabase._();

  LocalDatabase._();

  factory LocalDatabase() => _instance;

  late final Database _db;
  final _store = StoreRef<String, Map<String, Object?>>.main();

  late int _revision;

  @override
  int get revision => _revision;

  final Finder _tasksFinder = Finder(
    filter: Filter.not(Filter.byKey('revision')),
  );

  Future<void> setRevision(int revision) async {
    _revision = revision;
    await _store.record('revision').update(_db, {'revision': revision});
  }

  Future<void> incRevision() async {
    await setRevision(_revision + 1);
  }

  Future<void> init() async {
    final appDir = await getApplicationDocumentsDirectory();
    await appDir.create(recursive: true);

    _db = await databaseFactoryIo.openDatabase('${appDir.path}/$dbName');

    final data = await _store.record('revision').get(_db);

    if (data == null) {
      _revision = 0;
      await _store.record('revision').add(_db, {'revision': 0});
    } else {
      _revision = data['revision'] as int;
    }
  }

  @override
  Future<List<Task>> getTasks() async {
    final data = await _store.find(_db, finder: _tasksFinder);
    return data.map((item) => Task.fromJson(item.value)).toList();
  }

  @override
  Future<void> setTasks(List<Task> tasks) async {
    await _store.delete(_db);

    for (final task in tasks) {
      await _store.record(task.id).add(_db, task.toJson());
    }

    _revision++;
    await _store.record('revision').add(_db, {'revision': _revision});
  }

  @override
  Future<Task> getTask(String id) async {
    final data = await _store.record(id).get(_db);

    if (data == null) throw Exception('Not found');

    return Task.fromJson(data);
  }

  @override
  Future<void> addTask(Task task) async {
    await _store.record(task.id).add(_db, task.toJson());
    await incRevision();
  }

  @override
  Future<void> updateTask(Task task) async {
    await _store.record(task.id).update(_db, task.toJson());
    await incRevision();
  }

  @override
  Future<void> deleteTask(String id) async {
    await _store.record(id).delete(_db);
    await incRevision();
  }
}
