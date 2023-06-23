import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_backend/src/common/colors.dart';
import 'package:todo_backend/src/common/fonts_size.dart';
import '../common/task_manager.dart';
import '../common/utils.dart';
import '../models/task.dart';

class TaskItem extends StatefulWidget {
  final bool state;
  final int index;
  final void Function() onChange;
  final void Function(int) openAddEditPage;

  const TaskItem({
    Key? key,
    required this.index,
    required this.state,
    required this.onChange,
    required this.openAddEditPage,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => TaskItemState();
}

class TaskItemState extends State<TaskItem> {
  Task get task => TaskMan.tasks[widget.index];
  late StreamController<double> streamController;

  void _switchDone() {
    setState(() {
      TaskMan.switchDone(widget.index);
      widget.onChange();
    });
  }

  void _removeTask() {
    TaskMan.removeTask(widget.index);
    widget.onChange();
  }

  void _showInfo() {
    widget.openAddEditPage(widget.index);
    widget.onChange();
  }

  @override
  void initState() {
    super.initState();
    streamController = StreamController.broadcast();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      secondaryBackground: Container(
        color: AppColorsLightTheme.red,
        child: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.delete,
              color: AppColorsLightTheme.white,
            ),
          ),
        ),
      ),
      background: Container(
        color: AppColorsLightTheme.green,
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Icon(
              Icons.check,
              color: AppColorsLightTheme.white,
            ),
          ),
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          /// Delete
          setState(
            () {
              _removeTask();
              widget.onChange();
            },
          );

          return true;
        } else {
          /// Complete
          setState(
            () {
              _switchDone();
              widget.onChange();
            },
          );

          if (widget.state == true) {
            return false;
          } else {
            return true;
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 0, right: 0),
        child: ListTile(
          isThreeLine: true,
          title: Row(
            children: [
              if (task.importance == ImportanceType.high) ...[
                const Text(' !!  ',
                    style: TextStyle(
                      color: AppColorsLightTheme.red,
                      fontWeight: FontWeight.w400,
                    )),
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    task.text,
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    style: task.isDone
                        ? const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: AppColorsLightTheme.gray,
                            fontSize: AppTextSizes.body)
                        : const TextStyle(fontSize: AppTextSizes.body),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
              if (task.importance == ImportanceType.low) ...[
                const Icon(Icons.arrow_downward),
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    task.text,
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    style: task.isDone
                        ? const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontSize: AppTextSizes.body)
                        : const TextStyle(fontSize: AppTextSizes.body),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
              if (task.importance == ImportanceType.none) ...[
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    task.text,
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    style: task.isDone
                        ? const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: AppColorsLightTheme.gray,
                            fontSize: AppTextSizes.body)
                        : const TextStyle(fontSize: AppTextSizes.body),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ],
          ),
          subtitle: task.date != null
              ? Text(formatDateTime(task.date!),
                  style: TextStyle(
                      fontSize: AppTextSizes.body,
                      color: AppColorsLightTheme.gray))
              : const Text(''),
          leading: Container(
            child: Checkbox(
              side: task.importance == ImportanceType.high
                  ? MaterialStateBorderSide.resolveWith((states) =>
                      const BorderSide(
                          color: AppColorsLightTheme.red, width: 2))
                  : null,
              fillColor: task.importance == ImportanceType.high
                  ? MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.selected)) {
                        return null;
                      }
                      return Colors.red[100];
                    })
                  : null,
              value: task.isDone,
              activeColor: task.importance == ImportanceType.high
                  ? AppColorsLightTheme.red
                  : AppColorsLightTheme.green,
              onChanged: (bool? value) {
                setState(() {
                  _switchDone();
                });
              },
            ),
          ),
          trailing: IconButton(
            onPressed: _showInfo,
            icon: const Icon(
              Icons.info_outline,
            ),
          ),
        ),
      ),
    );
  }
}
