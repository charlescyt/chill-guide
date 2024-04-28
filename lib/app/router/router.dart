import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/movies/pages/movie_details_page.dart';
import '../../features/movies/pages/movie_home_page.dart';
import '../../features/movies/pages/popular_movies_page.dart';
import '../../features/movies/pages/top_rated_movies_page.dart';
import '../../features/movies/pages/upcoming_movies_page.dart';
import '../../features/profile/pages/profile_page.dart';
import '../../features/search/pages/search_page.dart';
import '../../features/tv_shows/pages/on_the_air_tv_shows_page.dart';
import '../../features/tv_shows/pages/popular_tv_shows_page.dart';
import '../../features/tv_shows/pages/top_rated_tv_shows_page.dart';
import '../../features/tv_shows/pages/tv_show_details_page.dart';
import '../../features/tv_shows/pages/tv_show_home_page.dart';
import '../../features/tv_shows/pages/tv_show_season_details_page.dart';
import '../widgets/main_scaffold.dart';
import 'transition_page.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootNavigator');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shellNavigator');

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: const TvShowHomeRouteData().location,
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
        TypedGoRoute<PopularMoviesRouteData>(path: 'popular'),
        TypedGoRoute<UpcomingMoviesRouteData>(path: 'upcoming'),
        TypedGoRoute<TopRatedMoviesRouteData>(path: 'top-rated'),
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

class PopularMoviesRouteData extends GoRouteData {
  const PopularMoviesRouteData();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PopularMoviesPage();
  }
}

class UpcomingMoviesRouteData extends GoRouteData {
  const UpcomingMoviesRouteData();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UpcomingMoviesPage();
  }
}

class TopRatedMoviesRouteData extends GoRouteData {
  const TopRatedMoviesRouteData();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TopRatedMoviesPage();
  }
}

class TvShowHomeRouteData extends GoRouteData {
  const TvShowHomeRouteData();

  static const routes = [
    TypedGoRoute<TvShowHomeRouteData>(
      path: '/tv-shows',
      routes: [
        TypedGoRoute<OnTheAirTvShowsRouteData>(path: 'on-the-air'),
        TypedGoRoute<PopularTvShowsRouteData>(path: 'popular'),
        TypedGoRoute<TopRatedTvShowsRouteData>(path: 'top-rated'),
        TypedGoRoute<TvShowDetailsRouteData>(
          path: ':tvShowId',
          routes: [TypedGoRoute<TvShowSeasonDetailsRouteData>(path: 'season/:seasonNumber')],
        ),
      ],
    ),
  ];

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return SlideTransitionPage(
      pageKey: state.pageKey,
      child: const TvShowHomePage(),
    );
  }
}

class TvShowDetailsRouteData extends GoRouteData {
  const TvShowDetailsRouteData({
    required this.tvShowId,
  });

  final int tvShowId;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = _rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return SlideTransitionPage(
      pageKey: state.pageKey,
      child: TvShowDetailsPage(tvShowId: tvShowId),
    );
  }
}

class TvShowSeasonDetailsRouteData extends GoRouteData {
  const TvShowSeasonDetailsRouteData({
    required this.tvShowId,
    required this.seasonNumber,
  });

  final int tvShowId;
  final int seasonNumber;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = _rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return SlideTransitionPage(
      pageKey: state.pageKey,
      child: TvShowSeasonDetailsPage(tvShowId: tvShowId, seasonNumber: seasonNumber),
    );
  }
}

class OnTheAirTvShowsRouteData extends GoRouteData {
  const OnTheAirTvShowsRouteData();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OnTheAirTvShowsPage();
  }
}

class PopularTvShowsRouteData extends GoRouteData {
  const PopularTvShowsRouteData();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PopularTvShowsPage();
  }
}

class TopRatedTvShowsRouteData extends GoRouteData {
  const TopRatedTvShowsRouteData();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TopRatedTvShowsPage();
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
