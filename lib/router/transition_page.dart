import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideTransitionPage<T> extends CustomTransitionPage<T> {
  SlideTransitionPage({
    required LocalKey pageKey,
    super.transitionDuration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    Offset slideFrom = const Offset(1, 0),
    required super.child,
  }) : super(
          key: pageKey,
          reverseTransitionDuration: transitionDuration,
          transitionsBuilder: (_, animation, __, child) => SlideTransition(
            position: Tween<Offset>(
              begin: slideFrom,
              end: Offset.zero,
            ).animate(CurvedAnimation(parent: animation, curve: curve)),
            child: child,
          ),
        );
}

class FadeTransitionPage<T> extends CustomTransitionPage<T> {
  FadeTransitionPage({
    required LocalKey pageKey,
    super.transitionDuration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    required super.child,
  }) : super(
          key: pageKey,
          reverseTransitionDuration: transitionDuration,
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(CurvedAnimation(parent: animation, curve: curve)),
            child: child,
          ),
        );
}
