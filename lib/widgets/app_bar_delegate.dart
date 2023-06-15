import 'dart:math';

import 'package:flutter/material.dart';

import '../database/dbmanager.dart';

class AppBarDelegate extends SliverPersistentHeaderDelegate {
  final double scrollPosition;
  final bool showCompleted;
  final TodoDatabase database;
  final VoidCallback onPressed;

  AppBarDelegate({
    required this.scrollPosition,
    required this.database,
    required this.showCompleted,
    required this.onPressed,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return StreamBuilder<int>(
      stream: database.completedStream,
      builder: (context, snapshot) {
        final completedTask = snapshot.data ?? 0;
        return Stack(
          children: [
            Container(
              color: Colors.brown[100],
              padding: EdgeInsets.only(left: max(75 - scrollPosition, 10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 0),
                    title: const Text(
                      'Мои дела',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                    ),
                    subtitle: scrollPosition != 0
                        ? null
                        : Text(
                            'Выполнено - $completedTask',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 15,
              child: IconButton(
                onPressed: onPressed,
                icon: showCompleted
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  double get maxExtent => 160.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(AppBarDelegate oldDelegate) {
    return true;
  }
}
