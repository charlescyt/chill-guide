import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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
      body: AnimatedBranchContainer(
        currentIndex: navigationShell.currentIndex,
        children: children,
      ),
      bottomNavigationBar: SalomonBottomBar(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
        items: [
          SalomonBottomBarItem(
            title: const Text('Movies'),
            icon: const Icon(Icons.movie_outlined),
            activeIcon: const Icon(Icons.movie),
          ),
          SalomonBottomBarItem(
            title: const Text('Tv Shows'),
            icon: const Icon(Icons.tv_outlined),
            activeIcon: const Icon(Icons.tv),
          ),
          SalomonBottomBarItem(
            title: const Text('Search'),
            icon: const Icon(Icons.search_outlined),
            activeIcon: const Icon(Icons.search),
          ),
          SalomonBottomBarItem(
            title: const Text('Profile'),
            icon: const Icon(Icons.person_outline),
            activeIcon: const Icon(Icons.person),
          ),
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
