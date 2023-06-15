import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/screens/add_edit_task_screen.dart';
import 'package:to_do_app/widgets/app_bar_delegate.dart';

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
              color: Colors.brown[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
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
                    return FloatingActionButton.extended(
                      onPressed: () async {
                        Navigator.popAndPushNamed(
                            context, AddEditTaskScreen.id);
                      },
                      backgroundColor: Colors.brown[100],
                      elevation: 0.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      label: const Text(
                        'Новое',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Card(
          //     child: Container(
          //       margin: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
          //       child: FloatingActionButton.extended(
          //         onPressed: () async {
          //           Navigator.popAndPushNamed(context, AddEditTaskScreen.id);
          //         },
          //         backgroundColor: Colors.white.withOpacity(1),
          //         elevation: 0.0,
          //         shape: const RoundedRectangleBorder(
          //           borderRadius: BorderRadius.all(Radius.circular(0)),
          //         ),
          //         label: const Text(
          //           'Новое',
          //           style: TextStyle(color: Colors.grey, fontSize: 16),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SliverList(
          //     delegate:
          //         SliverChildBuilderDelegate((BuildContext context, int index) {
          //   return TodoItem(todo: tasks[index], state: _showCompleteTasks);
          // }, childCount: tasks.length)),
          // SliverList(
          //   delegate: SliverChildListDelegate(
          //     [
          //       Container(
          //         margin: const EdgeInsets.only(
          //             left: 0, right: 0, top: 0, bottom: 30),
          //         child: FloatingActionButton.extended(
          //             onPressed: () async {
          //               Navigator.popAndPushNamed(
          //                   context, AddEditTaskScreen.id);
          //             },
          //             backgroundColor: Colors.white.withOpacity(1),
          //             elevation: 0.0,
          //             shape: const RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.all(Radius.circular(0))),
          //             label: const Text('Новое',
          //                 style: TextStyle(color: Colors.grey, fontSize: 16))),
          //       ),
          //     ],
          //   ),
          // ),
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
