import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/pages/movie_details_page.dart';
import '/pages/movie_home_page.dart';
import '/pages/profile_page.dart';
import '/pages/search_page.dart';
import '/pages/tv_show_home_page.dart';
import '/widgets/main_scaffold.dart';
import 'transition_page.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootNavigator');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shellNavigator');

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: const MovieHomeRouteData().location,
    routes: $appRoutes,
  );
}

@TypedStatefulShellRoute<MainShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<MoviesShellBranchData>(routes: MovieHomeRouteData.routes),
    TypedStatefulShellBranch<TvShowsShellBranchData>(routes: TvShowHomeRouteData.routes),
    TypedStatefulShellBranch<SearchShellBranchData>(routes: SearchRouteData.routes),
    TypedStatefulShellBranch<ProfileShellBranchData>(routes: ProfileRouteData.routes),
  ],
)
class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData();

  static final GlobalKey<NavigatorState> $navigatorKey = _shellNavigatorKey;

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return navigationShell;
  }

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) {
    return MainScaffold(
      navigationShell: navigationShell,
      children: children,
    );
  }
}

class MoviesShellBranchData extends StatefulShellBranchData {
  const MoviesShellBranchData();
}

class TvShowsShellBranchData extends StatefulShellBranchData {
  const TvShowsShellBranchData();
}

class SearchShellBranchData extends StatefulShellBranchData {
  const SearchShellBranchData();
}

class ProfileShellBranchData extends StatefulShellBranchData {
  const ProfileShellBranchData();
}

class MovieHomeRouteData extends GoRouteData {
  const MovieHomeRouteData();

  static const routes = [
    TypedGoRoute<MovieHomeRouteData>(
      path: '/movies',
      routes: [
        TypedGoRoute<MovieDetailsRouteData>(path: ':movieId'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MovieHomePage();
  }
}

class MovieDetailsRouteData extends GoRouteData {
  const MovieDetailsRouteData({
    required this.movieId,
  });

  final int movieId;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = _rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return SlideTransitionPage(
      pageKey: state.pageKey,
      child: MovieDetailsPage(movieId: movieId),
    );
  }
}

class TvShowHomeRouteData extends GoRouteData {
  const TvShowHomeRouteData();

  static const routes = [
    TypedGoRoute<TvShowHomeRouteData>(path: '/tv-shows'),
  ];

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return SlideTransitionPage(
      pageKey: state.pageKey,
      child: const TvShowHomePage(),
    );
  }
}

class SearchRouteData extends GoRouteData {
  const SearchRouteData();

  static const routes = [
    TypedGoRoute<SearchRouteData>(path: '/search'),
  ];

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SearchPage();
  }
}

class ProfileRouteData extends GoRouteData {
  const ProfileRouteData();

  static const routes = [
    TypedGoRoute<ProfileRouteData>(path: '/profile'),
  ];

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfilePage();
  }
}
