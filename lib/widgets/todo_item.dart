// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:to_do_app/database/dbmanager.dart';
import 'package:to_do_app/database/todo_entity.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/screens/add_edit_task_screen.dart';

import '../common/utils.dart';

class TodoItem extends StatefulWidget {
  final TodoEntity todo;
  final bool state;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.state,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  final database = TodoDatabase();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.todo.id.toString()),
      secondaryBackground: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
      background: Container(
        color: Colors.green,
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          /// Delete
          setState(
            () {
              database.removeTask(widget.todo);
            },
          );

          return true;
        } else {
          /// Complete
          setState(
            () {
              database.modifyTask(widget.todo, completed: true);
            },
          );

          if (widget.state == true)
            return false;
          else
            return true;
        }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 0, right: 0),
        child: ListTile(
          title: Row(
            children: [
              if (widget.todo.important == ImportanceType.high) ...[
                const Text(' !!  ',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    widget.todo.description,
                    maxLines: 3,
                    style: widget.todo.completed
                        ? const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey)
                        : null,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
              if (widget.todo.important == ImportanceType.low) ...[
                const Icon(Icons.arrow_downward),
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    widget.todo.description,
                    maxLines: 3,
                    style: widget.todo.completed
                        ? const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey)
                        : null,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
              if (widget.todo.important == ImportanceType.no) ...[
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    widget.todo.description,
                    maxLines: 3,
                    style: widget.todo.completed
                        ? const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey)
                        : null,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ],
          ),
          subtitle: widget.todo.deadline != null
              ? Text(formatDateTime(widget.todo.deadline!),
                  style: TextStyle(
                      fontSize: 15, color: Color(hexStringToHexInt('#248dfc'))))
              : const Text(''),
          leading: Checkbox(
            value: widget.todo.completed,
            activeColor: widget.todo.important == ImportanceType.high
                ? Colors.red
                : Colors.green,
            onChanged: (bool? value) {
              setState(() {
                database.modifyTask(widget.todo, completed: value);
              });
            },
          ),
          trailing: IconButton(
            onPressed: () async {
              final _ = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return AddEditTaskScreen(todo: widget.todo);
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.info_outline,
            ),
          ),
        ),
      ),
    );
  }
}
