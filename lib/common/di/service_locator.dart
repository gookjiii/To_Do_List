import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '../../feature/app/navigator/app_navigator.dart';
import '../../feature/app/repositories/task_connect_repository.dart';
import '../../feature/app/repositories/task_local_repository.dart';
import '../../feature/app/repositories/task_network_repository.dart';
import '../../feature/app/task_api/local_storage_api.dart';
import '../../feature/app/task_api/network_task_backend.dart';
import '../../feature/main_page/bloc/tasklist_bloc.dart';
import '../services/remote_config_service.dart';

class ServiceLocator {
  late TaskListBloc bloc;
  late RemoteConfigService remoteConfig;
  late AppNavigator appNavigator;
  final getIt = GetIt.instance;

  ServiceLocator() {
    remoteConfig = RemoteConfigService();
    final networkTaskBackend = NetworkTaskBackend();
    final localStorageApi = LocalStorageApi();
    final taskNetworkRepository = TaskNetworkRepository(networkTaskBackend);
    final taskLocalRepository = TaskLocalRepository(localStorageApi);
    final taskConnectRepository = TaskConnectRepository(
        taskLocalRepository: taskLocalRepository,
        taskNetworkRepository: taskNetworkRepository);
    bloc = TaskListBloc(taskRepository: taskConnectRepository)
      ..add(const GetListEvent());

    appNavigator = AppNavigator(
      task: null,
      //Task.initial(),
      tasksStream: bloc.state.when(
        loaded: (list) => BehaviorSubject.seeded(list),
        loading: () => BehaviorSubject.seeded([]),
        error: (_) => BehaviorSubject.seeded([]),
      ),
    );
    register();
  }

  void register() {
    getIt.registerSingleton<RemoteConfigService>(remoteConfig);
    getIt.registerSingleton<AppNavigator>(appNavigator);
    getIt.registerSingleton<TaskListBloc>(bloc);
  }
}
