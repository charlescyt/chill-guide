import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'my_navigation_bar.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    Key? key,
    required this.navigationShell,
    required this.children,
  }) : super(key: key ?? const Key('MainScaffold'));

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: AnimatedBranchContainer(
        currentIndex: navigationShell.currentIndex,
        children: children,
      ),
      bottomNavigationBar: MyNavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onTap: _onTap,
        items: const [
          MyNavigationItem(icon: Icon(Icons.movie_outlined), selectedIcon: Icon(Icons.movie)),
          MyNavigationItem(icon: Icon(Icons.tv_outlined), selectedIcon: Icon(Icons.tv)),
          MyNavigationItem(icon: Icon(Icons.search_outlined), selectedIcon: Icon(Icons.search)),
          MyNavigationItem(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person)),
        ],
      ),
    );
  }

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class AnimatedBranchContainer extends StatelessWidget {
  const AnimatedBranchContainer({
    super.key,
    required this.currentIndex,
    required this.children,
  });

  final int currentIndex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: children.mapIndexed(
        (int index, Widget navigator) {
          return AnimatedScale(
            scale: index == currentIndex ? 1 : 1.5,
            duration: const Duration(milliseconds: 300),
            child: AnimatedOpacity(
              opacity: index == currentIndex ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: _branchNavigatorWrapper(index, navigator),
            ),
          );
        },
      ).toList(),
    );
  }

  Widget _branchNavigatorWrapper(int index, Widget navigator) {
    return IgnorePointer(
      ignoring: index != currentIndex,
      child: TickerMode(
        enabled: index == currentIndex,
        child: navigator,
      ),
    );
  }
}
