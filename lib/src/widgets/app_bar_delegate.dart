import 'dart:math';

import 'package:flutter/material.dart';

import '../common/colors.dart';
import '../common/fonts_size.dart';
import '../common/task_manager.dart';

class AppBarDelegate extends SliverPersistentHeaderDelegate {
  final double scrollPosition;
  final bool showCompleted;
  final VoidCallback onPressed;

  AppBarDelegate({
    required this.scrollPosition,
    required this.showCompleted,
    required this.onPressed,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: max(75 - scrollPosition, 10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.only(),
                  title: Text(
                    'Мои дела',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        height: AppHeights.largeTitle,
                        color: AppColorsLightTheme.primary,
                        fontSize: max(AppTextSizes.largeTitle - scrollPosition,
                            AppTextSizes.button)),
                  ),
                  subtitle: scrollPosition != 0
                      ? null
                      : ValueListenableBuilder<int>(
                          valueListenable: TaskMan.doneCount,
                          builder: (context, value, _) => Text(
                              'Выполнено - $value',
                              style: const TextStyle(
                                  fontSize: AppTextSizes.body,
                                  height: AppHeights.body,
                                  color: AppColorsLightTheme.tertiary)),
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
      ),
    );
  }

  @override
  double get maxExtent => 160.0;

  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(AppBarDelegate oldDelegate) {
    return true;
  }
}
