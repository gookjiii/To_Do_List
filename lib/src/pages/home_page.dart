import 'package:flutter/material.dart';
import '../common/colors.dart';
import '../common/fonts_size.dart';
import '../common/logger.dart';
import '../common/navigator_manager.dart';
import '../common/task_manager.dart';
import '../widgets/app_bar_delegate.dart';
import '../widgets/task_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  bool showCompleted = false;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  Future<void> _openAddEditPage([int? taskIndex]) async {
    await NavMan.openAddEditPage(taskIndex);
    _onChange();
  }

  void _onChange() => setState(() {});

  @override
  Widget build(BuildContext context) {
    late List<int> tasks;

    if (showCompleted) {
      tasks = TaskMan.tasks
          .asMap()
          .entries
          .where((e) => showCompleted || !e.value.isDone)
          .map((e) => e.key)
          .toList();
    } else {
      tasks = TaskMan.tasks
          .asMap()
          .entries
          .where((e) => !e.value.isDone)
          .map((e) => e.key)
          .toList();
    }

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: AppBarDelegate(
                scrollPosition: _scrollPosition,
                showCompleted: showCompleted,
                onPressed: () {
                  setState(() {
                    showCompleted = !showCompleted;
                    Logger.state(
                        'Change visibility: ${showCompleted ? 'on' : 'off'}');
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
                      return TaskItem(
                        index: tasks[index],
                        state: showCompleted,
                        onChange: _onChange,
                        openAddEditPage: _openAddEditPage,
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 70, bottom: 24, top: 14),
                        child: InkWell(
                          onTap: _openAddEditPage,
                          child: const Text(
                            'Новое',
                            style: TextStyle(
                                fontSize: AppTextSizes.body,
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
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 10),
        child: FloatingActionButton(
          onPressed: _openAddEditPage,
          elevation: 0,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
