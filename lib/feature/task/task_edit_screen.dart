// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uuid/uuid.dart';
import '../../common/services/remote_config_service.dart';
import '../app/models/priority.dart';
import '../app/models/task.dart';
import '../app/navigator/app_navigator.dart';
import '../main_page/bloc/tasklist_bloc.dart';

class TaskEditScreen extends StatefulWidget {
  final Task? task;
  final bool isNew;

  const TaskEditScreen({Key? key, this.task, required this.isNew})
      : super(key: key);

  @override
  State<TaskEditScreen> createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return _TaskPage(widget.task, widget.isNew);
  }
}

class _TaskPage extends StatefulWidget {
  _TaskPage(this.task, this.isNew);

  bool isNew;
  Task? task;

  @override
  State<_TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<_TaskPage> {
  late TextEditingController textController =
      TextEditingController(text: task.text);
  var scrollOverflow = false;
  late Task task;

  @override
  void initState() {
    super.initState();
    if (widget.task == null) {
      task = Task(
          id: const Uuid().v1(),
          text: '',
          done: false,
          importance: Priority.basic);
    } else {
      task = widget.task!;
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2122));
    setState(() {
      task = task.copyWith(deadline: pickedDate?.microsecondsSinceEpoch);
    });
    return pickedDate;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        GetIt.I.get<AppNavigator>().navigationDelegate.openList();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: scrollOverflow ? 4 : 0,
          leading: IconButton(
            onPressed: GetIt.I.get<AppNavigator>().navigationDelegate.openList,
            icon: const Icon(Icons.close),
          ),
          actions: [
            TextButton(
              onPressed: () {
                task = task.copyWith(text: textController.text);
                BlocProvider.of<TaskListBloc>(context).add(widget.isNew
                    ? CreateTaskEvent(textController.text,
                        deadline: task.deadline, importance: task.importance)
                    : EditTaskEvent(task: task));
                GetIt.I.get<AppNavigator>().navigationDelegate.openList();
              },
              child: Text(
                AppLocalizations.of(context)!.save,
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: NotificationListener<ScrollUpdateNotification>(
            onNotification: (n) {
              if (n.metrics.pixels > 40) {
                setState(() {
                  scrollOverflow = true;
                });
              } else {
                setState(() {
                  scrollOverflow = false;
                });
              }
              return true;
            },
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const SizedBox(
                  height: 8,
                ),
                Builder(builder: (context) {
                  final border = OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  );
                  return Material(
                    elevation: 2.2,
                    shadowColor: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: textController,
                      textInputAction: TextInputAction.go,
                      maxLines: null,
                      minLines: 4,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.needToDo,
                        fillColor: Theme.of(context).backgroundColor,
                        filled: true,
                        border: border,
                        disabledBorder: border,
                        enabledBorder: border,
                        focusedBorder: border,
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 28,
                ),
                Text(AppLocalizations.of(context)!.importance),
                Row(
                  children: [
                    DropdownButtonHideUnderline(
                      child: SizedBox(
                        height: 30,
                        width: 150,
                        child: DropdownButton<Priority>(
                          style: TextStyle(color: Theme.of(context).hintColor),
                          borderRadius: BorderRadius.circular(2),
                          iconDisabledColor: Colors.transparent,
                          iconEnabledColor: Colors.transparent,
                          value: task.importance,
                          items: [
                            DropdownMenuItem(
                              value: Priority.basic,
                              child: Text(
                                AppLocalizations.of(context)!.no,
                              ),
                            ),
                            DropdownMenuItem(
                              value: Priority.low,
                              child: Text(
                                AppLocalizations.of(context)!.low,
                              ),
                            ),
                            DropdownMenuItem(
                              value: Priority.important,
                              child: Text(
                                AppLocalizations.of(context)!.high,
                                style: TextStyle(
                                    color: GetIt.I
                                        .get<RemoteConfigService>()
                                        .getColor),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              final newTask = task.copyWith(importance: value);
                              setState(() {
                                task = newTask;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppLocalizations.of(context)!.doneUntil),
                          if (task.deadline != null)
                            Text(
                              DateFormat('d MMMM y',
                                      AppLocalizations.of(context)?.localeName)
                                  .format(DateTime.fromMicrosecondsSinceEpoch(
                                      task.deadline!)),
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            )
                          else
                            const SizedBox(
                              height: 20,
                            ),
                        ],
                      ),
                    ),
                    Switch(
                        value: task.deadline != null,
                        activeColor: Theme.of(context).primaryColor,
                        onChanged: (value) {
                          if (value) {
                            _selectDate(context);
                          } else {
                            setState(
                              () {
                                value = !value;
                                task = task.copyWith(deadline: null);
                              },
                            );
                          }
                        }),
                  ],
                ),
                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(
                  height: 15,
                ),
                widget.isNew
                    ? Container(
                        width: 112,
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 4,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Theme.of(context).disabledColor,
                            ),
                            const SizedBox(
                              width: 17,
                            ),
                            Text(
                              AppLocalizations.of(context)!.delete,
                              style: TextStyle(
                                  color: Theme.of(context).disabledColor),
                            ),
                          ],
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          BlocProvider.of<TaskListBloc>(context)
                              .add(DeleteTaskEvent(task: task));
                          GetIt.I
                              .get<AppNavigator>()
                              .navigationDelegate
                              .openList();
                        },
                        child: Container(
                          width: 112,
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 4,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: Theme.of(context).errorColor,
                              ),
                              const SizedBox(
                                width: 17,
                              ),
                              Text(
                                AppLocalizations.of(context)!.delete,
                                style: TextStyle(
                                    color: Theme.of(context).errorColor),
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
