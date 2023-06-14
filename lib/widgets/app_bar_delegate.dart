import 'dart:math';

import 'package:flutter/material.dart';

import '../common/utils.dart';

class AppBarDelegate extends SliverPersistentHeaderDelegate {
  final double scrollPosition;
  final bool showCompleted;
  final int completedTask;
  final VoidCallback onPressed;

  AppBarDelegate({
    required this.scrollPosition,
    required this.completedTask,
    required this.showCompleted,
    required this.onPressed,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Container(
          color: Color(hexStringToHexInt('#F7F6F2')),
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
                        style: TextStyle(
                          color: Color(hexStringToHexInt('#D1D1D6')),
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
            color: Colors.blue,
          ),
        ),
      ],
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
