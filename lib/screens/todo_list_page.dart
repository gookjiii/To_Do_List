import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/screens/add_edit_task_screen.dart';
import 'package:to_do_app/widgets/app_bar_delegate.dart';
import 'package:to_do_app/src/app.dart';

import '../common/colors.dart';
import '../common/fonts_size.dart';
import '../database/dbmanager.dart';
import '../database/todo_entity.dart';
import '../widgets/todo_item.dart';

class TodoListPage extends StatefulWidget {
  static const id = 'toDoPageHome';

  final SharedPreferences prefs;

  const TodoListPage({Key? key, required this.prefs}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  final database = TodoDatabase();
  late bool _showCompleteTasks;
  late List<TodoEntity> tasks;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _showCompleteTasks = widget.prefs.getBool('show_completed_tasks') ?? true;
    tasks = _showCompleteTasks ? database.tasks : database.uncompletedTasks;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: AppBarDelegate(
              scrollPosition: _scrollPosition,
              showCompleted: _showCompleteTasks,
              database: database,
              onPressed: () {
                setState(() {
                  _showCompleteTasks = !_showCompleteTasks;
                  if (_showCompleteTasks) {
                    tasks = database.tasks;
                  } else {
                    tasks = database.uncompletedTasks;
                  }
                });
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tasks.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < tasks.length) {
                    return TodoItem(
                        todo: tasks[index], state: _showCompleteTasks);
                  } else {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 70, bottom: 14, top: 14),
                      child: InkWell(
                        onTap: () async {
                          Navigator.popAndPushNamed(
                              context, AddEditTaskScreen.id);
                        },
                        child: const Text(
                          'Новое',
                          style: TextStyle(
                              fontSize: AppTextSizes.button,
                              height: AppHeights.body,
                              color: AppColorsLightTheme.tertiary),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.popAndPushNamed(context, AddEditTaskScreen.id);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
