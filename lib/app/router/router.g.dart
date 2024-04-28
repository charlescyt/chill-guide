// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainShellRouteData,
    ];

RouteBase get $mainShellRouteData => StatefulShellRouteData.$route(
      navigatorContainerBuilder: MainShellRouteData.$navigatorContainerBuilder,
      factory: $MainShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/movies',
              factory: $MovieHomeRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'popular',
                  parentNavigatorKey:
                      PopularMoviesRouteData.$parentNavigatorKey,
                  factory: $PopularMoviesRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'upcoming',
                  parentNavigatorKey:
                      UpcomingMoviesRouteData.$parentNavigatorKey,
                  factory: $UpcomingMoviesRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'top-rated',
                  parentNavigatorKey:
                      TopRatedMoviesRouteData.$parentNavigatorKey,
                  factory: $TopRatedMoviesRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: ':movieId',
                  parentNavigatorKey: MovieDetailsRouteData.$parentNavigatorKey,
                  factory: $MovieDetailsRouteDataExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/tv-shows',
              factory: $TvShowHomeRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'on-the-air',
                  parentNavigatorKey:
                      OnTheAirTvShowsRouteData.$parentNavigatorKey,
                  factory: $OnTheAirTvShowsRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'popular',
                  parentNavigatorKey:
                      PopularTvShowsRouteData.$parentNavigatorKey,
                  factory: $PopularTvShowsRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'top-rated',
                  parentNavigatorKey:
                      TopRatedTvShowsRouteData.$parentNavigatorKey,
                  factory: $TopRatedTvShowsRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: ':tvShowId',
                  parentNavigatorKey:
                      TvShowDetailsRouteData.$parentNavigatorKey,
                  factory: $TvShowDetailsRouteDataExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'season/:seasonNumber',
                      parentNavigatorKey:
                          TvShowSeasonDetailsRouteData.$parentNavigatorKey,
                      factory:
                          $TvShowSeasonDetailsRouteDataExtension._fromState,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/search',
              factory: $SearchRouteDataExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/profile',
              factory: $ProfileRouteDataExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $MainShellRouteDataExtension on MainShellRouteData {
  static MainShellRouteData _fromState(GoRouterState state) =>
      const MainShellRouteData();
}

extension $MovieHomeRouteDataExtension on MovieHomeRouteData {
  static MovieHomeRouteData _fromState(GoRouterState state) =>
      const MovieHomeRouteData();

  String get location => GoRouteData.$location(
        '/movies',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PopularMoviesRouteDataExtension on PopularMoviesRouteData {
  static PopularMoviesRouteData _fromState(GoRouterState state) =>
      const PopularMoviesRouteData();

  String get location => GoRouteData.$location(
        '/movies/popular',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $UpcomingMoviesRouteDataExtension on UpcomingMoviesRouteData {
  static UpcomingMoviesRouteData _fromState(GoRouterState state) =>
      const UpcomingMoviesRouteData();

  String get location => GoRouteData.$location(
        '/movies/upcoming',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TopRatedMoviesRouteDataExtension on TopRatedMoviesRouteData {
  static TopRatedMoviesRouteData _fromState(GoRouterState state) =>
      const TopRatedMoviesRouteData();

  String get location => GoRouteData.$location(
        '/movies/top-rated',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MovieDetailsRouteDataExtension on MovieDetailsRouteData {
  static MovieDetailsRouteData _fromState(GoRouterState state) =>
      MovieDetailsRouteData(
        movieId: int.parse(state.pathParameters['movieId']!),
      );

  String get location => GoRouteData.$location(
        '/movies/${Uri.encodeComponent(movieId.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TvShowHomeRouteDataExtension on TvShowHomeRouteData {
  static TvShowHomeRouteData _fromState(GoRouterState state) =>
      const TvShowHomeRouteData();

  String get location => GoRouteData.$location(
        '/tv-shows',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $OnTheAirTvShowsRouteDataExtension on OnTheAirTvShowsRouteData {
  static OnTheAirTvShowsRouteData _fromState(GoRouterState state) =>
      const OnTheAirTvShowsRouteData();

  String get location => GoRouteData.$location(
        '/tv-shows/on-the-air',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PopularTvShowsRouteDataExtension on PopularTvShowsRouteData {
  static PopularTvShowsRouteData _fromState(GoRouterState state) =>
      const PopularTvShowsRouteData();

  String get location => GoRouteData.$location(
        '/tv-shows/popular',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TopRatedTvShowsRouteDataExtension on TopRatedTvShowsRouteData {
  static TopRatedTvShowsRouteData _fromState(GoRouterState state) =>
      const TopRatedTvShowsRouteData();

  String get location => GoRouteData.$location(
        '/tv-shows/top-rated',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TvShowDetailsRouteDataExtension on TvShowDetailsRouteData {
  static TvShowDetailsRouteData _fromState(GoRouterState state) =>
      TvShowDetailsRouteData(
        tvShowId: int.parse(state.pathParameters['tvShowId']!),
      );

  String get location => GoRouteData.$location(
        '/tv-shows/${Uri.encodeComponent(tvShowId.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TvShowSeasonDetailsRouteDataExtension
    on TvShowSeasonDetailsRouteData {
  static TvShowSeasonDetailsRouteData _fromState(GoRouterState state) =>
      TvShowSeasonDetailsRouteData(
        tvShowId: int.parse(state.pathParameters['tvShowId']!),
        seasonNumber: int.parse(state.pathParameters['seasonNumber']!),
      );

  String get location => GoRouteData.$location(
        '/tv-shows/${Uri.encodeComponent(tvShowId.toString())}/season/${Uri.encodeComponent(seasonNumber.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SearchRouteDataExtension on SearchRouteData {
  static SearchRouteData _fromState(GoRouterState state) =>
      const SearchRouteData();

  String get location => GoRouteData.$location(
        '/search',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileRouteDataExtension on ProfileRouteData {
  static ProfileRouteData _fromState(GoRouterState state) =>
      const ProfileRouteData();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'0c9ddf61a9792ef192881c2bffcd2c4301816e54';

/// See also [router].
@ProviderFor(router)
final routerProvider = AutoDisposeProvider<GoRouter>.internal(
  router,
  name: r'routerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouterRef = AutoDisposeProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
