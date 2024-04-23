import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({
    super.key,
    required this.items,
    required this.onTap,
    required this.selectedIndex,
    this.margin = const EdgeInsets.all(32),
    this.borderRadius = const BorderRadius.all(Radius.circular(32)),
    this.duration = const Duration(milliseconds: 300),
  });

  final List<MyNavigationItem> items;
  final ValueChanged<int>? onTap;
  final int selectedIndex;
  final EdgeInsetsGeometry margin;
  final BorderRadiusGeometry borderRadius;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final viewPadding = MediaQuery.viewPaddingOf(context);

    return Padding(
      padding: EdgeInsets.only(bottom: viewPadding.bottom),
      child: IntrinsicHeight(
        child: Center(
          child: ClipRRect(
            borderRadius: borderRadius,
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Material(
                clipBehavior: Clip.antiAlias,
                color: theme.colorScheme.primary.withOpacity(0.1),
                borderRadius: borderRadius,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int index = 0; index < items.length; index++)
                        Flexible(
                          child: _MyNavigationBarButton(
                            item: items[index],
                            duration: duration,
                            isSelected: index == selectedIndex,
                            onTap: () => onTap?.call(index),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
class MyNavigationItem {
  const MyNavigationItem({
    required this.icon,
    required this.selectedIcon,
  });

  final Widget icon;
  final Widget selectedIcon;
}

class _MyNavigationBarButton extends StatelessWidget {
  const _MyNavigationBarButton({
    required this.item,
    required this.isSelected,
    required this.onTap,
    this.duration = const Duration(milliseconds: 300),
  });

  final MyNavigationItem item;
  final bool isSelected;
  final VoidCallback? onTap;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox.square(
            dimension: 48,
            child: Material(
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              shape: const CircleBorder(),
              child: InkWell(
                onTap: onTap,
                child: AnimatedSwitcher(
                  duration: duration,
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeInOut,
                  transitionBuilder: (child, animation) => ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                  child: isSelected
                      ? IconTheme(
                          data: theme.iconTheme.copyWith(color: theme.colorScheme.primary),
                          child: item.selectedIcon,
                        )
                      : item.icon,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: AnimatedContainer(
            duration: duration,
            height: 2,
            width: isSelected ? 36 : 0,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ],
    );
  }
}
