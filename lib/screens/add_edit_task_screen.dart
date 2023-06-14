import 'package:flutter/material.dart';
import 'package:to_do_app/screens/todo_list_page.dart';

import '../common/utils.dart';
import '../database/dbmanager.dart';
import '../database/todo_entity.dart';

class AddEditTaskScreen extends StatefulWidget {
  static const id = "add_edit_task_screen";

  final TodoEntity todo;
  final bool newTask;

  const AddEditTaskScreen(
      {super.key, required this.todo, this.newTask = false});

  @override
  AddEditTaskScreenState createState() => AddEditTaskScreenState();
}

class AddEditTaskScreenState extends State<AddEditTaskScreen> {
  Widget _importantType = const Text('Нет');
  DateTime? selectedDate;
  bool showDate = false;

  late TextEditingController titleTextController;
  late TextEditingController descriptionTextController;
  final database = TodoDatabase();

  void _saveTask() {
    widget.todo.id = titleTextController.text.hashCode + selectedDate.hashCode;
    widget.todo.description = descriptionTextController.text;
    widget.todo.deadline = selectedDate;
  }

  @override
  void initState() {
    titleTextController = TextEditingController(text: widget.todo.description);
    descriptionTextController = TextEditingController(
      text: widget.todo.description,
    );
    selectedDate = widget.todo.deadline;
    _importantType = widget.todo.important == ImportanceType.high
        ? Text('!! Высокий',
            style: TextStyle(color: Color(hexStringToHexInt('#FF3B30'))))
        : widget.todo.important == ImportanceType.low
            ? const Text('Низкий')
            : const Text('Нет');
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      helpText: "",
      locale: const Locale("ru", "RU"),
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            backgroundColor: Color(hexStringToHexInt('#F7F6F2')),
            leading: IconButton(
              icon: const Icon(Icons.close, color: Colors.black),
              onPressed: () {
                Navigator.popAndPushNamed(context, TodoListPage.id);
              },
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () async {
                    _saveTask();
                    if (widget.newTask) {
                      database.addTask(widget.todo);
                    } else {
                      database.modifyTask(widget.todo);
                    }
                    Navigator.popAndPushNamed(context, TodoListPage.id);
                  },
                  child: const Text("СОХРАНИТЬ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textScaleFactor: 1.2)),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, top: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.top,
                        maxLines: null,
                        minLines: 5,
                        controller: descriptionTextController,
                        decoration: InputDecoration(
                          hintText: 'Что надо делать...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    PopupMenuButton<Widget>(
                      onSelected: (Widget value) {
                        setState(() {
                          _importantType = value;
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem<Widget>(
                              value: const Text('Нет'),
                              child: const Text('Нет'),
                              onTap: () async {
                                widget.todo.important = ImportanceType.no;
                              }),
                          PopupMenuItem<Widget>(
                              value: const Text('Низкий'),
                              child: const Text('Низкий'),
                              onTap: () async {
                                widget.todo.important = ImportanceType.low;
                              }),
                          PopupMenuItem<Widget>(
                              value: Text('!! Высокий',
                                  style: TextStyle(
                                      color:
                                          Color(hexStringToHexInt('#FF3B30')))),
                              child: Text('!! Высокий',
                                  style: TextStyle(
                                      color:
                                          Color(hexStringToHexInt('#FF3B30')))),
                              onTap: () async {
                                widget.todo.important = ImportanceType.high;
                              }),
                        ];
                      },
                      child: ListTile(
                        title: const Text('Важность',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        subtitle: _importantType,
                        trailing: null,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Divider(
                      color: Colors.black,
                      height: 0.25,
                      thickness: 0.4,
                      indent: 15,
                      endIndent: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      child: SwitchListTile(
                        title: const Text('Сделать до',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        subtitle: selectedDate != null
                            ? Text(formatDateTime(selectedDate!),
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(hexStringToHexInt('#248dfc'))))
                            : const Text(''),
                        value: showDate,
                        onChanged: (value) {
                          setState(() {
                            showDate = value;
                            if (!value) {
                              selectedDate = null;
                            } else {
                              _selectDate(context);
                            }
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: FloatingActionButton.extended(
                        label: Text('Удалять',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: descriptionTextController.text.isNotEmpty
                                    ? Color(hexStringToHexInt('#FF3B30'))
                                    : Colors.grey)),
                        backgroundColor: Colors.white.withOpacity(1),
                        elevation: 0.0,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                        icon: Icon(
                          Icons.delete,
                          size: 24.0,
                          color: descriptionTextController.text.isNotEmpty
                              ? Color(hexStringToHexInt('#FF3B30'))
                              : Colors.grey,
                        ),
                        onPressed: descriptionTextController.text.isNotEmpty
                            ? () async {
                                if (descriptionTextController.text.isNotEmpty) {
                                  database.removeTask(widget.todo);
                                  Navigator.popAndPushNamed(
                                      context, TodoListPage.id);
                                  setState(() {});
                                }
                              }
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
