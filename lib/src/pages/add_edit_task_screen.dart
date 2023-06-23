import 'package:flutter/material.dart';
import 'package:todo_backend/src/common/colors.dart';
import 'package:todo_backend/src/common/fonts_size.dart';

import '../common/navigator_manager.dart';
import '../common/task_manager.dart';
import '../common/utils.dart';
import '../models/task.dart';

class AddEditTaskScreen extends StatefulWidget {
  final int? idx;

  const AddEditTaskScreen({super.key, this.idx});

  @override
  State<AddEditTaskScreen> createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  DateTime? selectedDate;
  bool showDate = false;
  late ImportanceType important;
  late Text _importanceText;
  late Task task;
  late int index;
  final TextEditingController descriptionController = TextEditingController();

  void _onDateChange(DateTime? newDate) {
    task.date = newDate;
  }

  void _onImportanceChange(ImportanceType newImportant) {
    task.importance = newImportant;
  }

  void _onTextChange(String newText) {
    task.text = newText;
  }

  @override
  void initState() {
    super.initState();
    task = widget.idx != null ? TaskMan.tasks[widget.idx!] : Task(text: '');
    descriptionController.text = task.text;
    important = task.importance;
    selectedDate = task.date;
    showDate = task.date == null ? false : true;
    _importanceText = Text(['Нет', 'Низкий', '!! Высокий'][important.index],
        style: TextStyle(
            color: important.index == 2 ? AppColorsLightTheme.red : null));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      helpText: "",
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _onDateChange(selectedDate);
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
            leading: IconButton(
              icon: const Icon(Icons.close, color: Colors.black),
              onPressed: () {
                NavMan.pop();
              },
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  if (widget.idx != null) {
                    // Modify existing task
                    TaskMan.changeTask(widget.idx!, task);
                  } else {
                    // Add new task
                    TaskMan.addTask(task);
                  }
                  NavMan.pop();
                },
                child: const Text(
                  "СОХРАНИТЬ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColorsLightTheme.blue),
                  textScaleFactor: 1.2,
                ),
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Card(
                      elevation: 6,
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, top: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColorsLightTheme.backSecondary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.top,
                          maxLines: null,
                          minLines: 5,
                          controller: descriptionController,
                          decoration: InputDecoration(
                            hintText: 'Что надо делать...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: _onTextChange,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    PopupMenuButton<ImportanceType>(
                      onSelected: (ImportanceType value) {
                        setState(() {
                          _importanceText = Text(
                              ['Нет', 'Низкий', '!! Высокий'][important.index],
                              style: TextStyle(
                                  color: important.index == 2
                                      ? AppColorsLightTheme.red
                                      : null));
                          _onImportanceChange(value);
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem<ImportanceType>(
                            value: ImportanceType.none,
                            child: const Text('Нет'),
                            onTap: () async {
                              // Set importance type
                              important = ImportanceType.none;
                            },
                          ),
                          PopupMenuItem<ImportanceType>(
                            value: ImportanceType.low,
                            child: const Text('Низкий'),
                            onTap: () async {
                              // Set importance type
                              important = ImportanceType.low;
                            },
                          ),
                          PopupMenuItem<ImportanceType>(
                            value: ImportanceType.high,
                            child: Text(
                              '!! Высокий',
                              style: TextStyle(
                                color: Color(hexStringToHexInt('#FF3B30')),
                              ),
                            ),
                            onTap: () async {
                              // Set importance type
                              important = ImportanceType.high;
                            },
                          ),
                        ];
                      },
                      child: ListTile(
                        title: const Text(
                          'Важность',
                          style: TextStyle(
                            fontSize: AppTextSizes.button,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: _importanceText,
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
                        title: const Text(
                          'Сделать до',
                          style: TextStyle(
                            fontSize: AppTextSizes.button,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: selectedDate != null
                            ? Text(
                                formatDateTime(selectedDate!),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColorsDarkTheme.blue,
                                ),
                              )
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
                            _onDateChange(selectedDate);
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: FloatingActionButton.extended(
                        label: Text(
                          'Удалить',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: AppTextSizes.button,
                            color: descriptionController.text.isNotEmpty
                                ? AppColorsLightTheme.red
                                : AppColorsLightTheme.gray,
                          ),
                        ),
                        backgroundColor: Colors.white.withOpacity(0),
                        elevation: 0.0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        icon: Icon(
                          Icons.delete,
                          size: 24.0,
                          color: descriptionController.text.isNotEmpty
                              ? AppColorsLightTheme.red
                              : AppColorsLightTheme.gray,
                        ),
                        onPressed: descriptionController.text.isNotEmpty
                            ? () async {
                                if (descriptionController.text.isNotEmpty) {
                                  // Remove task
                                  TaskMan.removeTask(widget.idx!);
                                  NavMan.pop();
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
