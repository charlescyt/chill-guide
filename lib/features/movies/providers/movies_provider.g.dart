// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieRepoHash() => r'a4ac5db43e3e9642887c799432ee51cca7678ec4';

/// See also [movieRepo].
@ProviderFor(movieRepo)
final movieRepoProvider = AutoDisposeProvider<MovieRepo>.internal(
  movieRepo,
  name: r'movieRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$movieRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MovieRepoRef = AutoDisposeProviderRef<MovieRepo>;
String _$trendingMoviesHash() => r'0dd1ed03ec43f8e8e64ebe820b60330e6bda6fa1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [trendingMovies].
@ProviderFor(trendingMovies)
const trendingMoviesProvider = TrendingMoviesFamily();

/// See also [trendingMovies].
class TrendingMoviesFamily
    extends Family<AsyncValue<PaginatedResponse<Movie>>> {
  /// See also [trendingMovies].
  const TrendingMoviesFamily();

  /// See also [trendingMovies].
  TrendingMoviesProvider call({
    TimeWindow timeWindow = TimeWindow.day,
  }) {
    return TrendingMoviesProvider(
      timeWindow: timeWindow,
    );
  }

  @override
  TrendingMoviesProvider getProviderOverride(
    covariant TrendingMoviesProvider provider,
  ) {
    return call(
      timeWindow: provider.timeWindow,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'trendingMoviesProvider';
}

/// See also [trendingMovies].
class TrendingMoviesProvider
    extends AutoDisposeFutureProvider<PaginatedResponse<Movie>> {
  /// See also [trendingMovies].
  TrendingMoviesProvider({
    TimeWindow timeWindow = TimeWindow.day,
  }) : this._internal(
          (ref) => trendingMovies(
            ref as TrendingMoviesRef,
            timeWindow: timeWindow,
          ),
          from: trendingMoviesProvider,
          name: r'trendingMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$trendingMoviesHash,
          dependencies: TrendingMoviesFamily._dependencies,
          allTransitiveDependencies:
              TrendingMoviesFamily._allTransitiveDependencies,
          timeWindow: timeWindow,
        );

  TrendingMoviesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.timeWindow,
  }) : super.internal();

  final TimeWindow timeWindow;

  @override
  Override overrideWith(
    FutureOr<PaginatedResponse<Movie>> Function(TrendingMoviesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TrendingMoviesProvider._internal(
        (ref) => create(ref as TrendingMoviesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        timeWindow: timeWindow,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PaginatedResponse<Movie>> createElement() {
    return _TrendingMoviesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TrendingMoviesProvider && other.timeWindow == timeWindow;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, timeWindow.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TrendingMoviesRef
    on AutoDisposeFutureProviderRef<PaginatedResponse<Movie>> {
  /// The parameter `timeWindow` of this provider.
  TimeWindow get timeWindow;
}

class _TrendingMoviesProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedResponse<Movie>>
    with TrendingMoviesRef {
  _TrendingMoviesProviderElement(super.provider);

  @override
  TimeWindow get timeWindow => (origin as TrendingMoviesProvider).timeWindow;
}

String _$popularMoviesHash() => r'2070da7a4fbfe4163f91c069c26562a9fb3b8b84';

/// See also [popularMovies].
@ProviderFor(popularMovies)
const popularMoviesProvider = PopularMoviesFamily();

/// See also [popularMovies].
class PopularMoviesFamily extends Family<AsyncValue<PaginatedResponse<Movie>>> {
  /// See also [popularMovies].
  const PopularMoviesFamily();

  /// See also [popularMovies].
  PopularMoviesProvider call({
    int page = 1,
  }) {
    return PopularMoviesProvider(
      page: page,
    );
  }

  @override
  PopularMoviesProvider getProviderOverride(
    covariant PopularMoviesProvider provider,
  ) {
    return call(
      page: provider.page,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'popularMoviesProvider';
}

/// See also [popularMovies].
class PopularMoviesProvider
    extends AutoDisposeFutureProvider<PaginatedResponse<Movie>> {
  /// See also [popularMovies].
  PopularMoviesProvider({
    int page = 1,
  }) : this._internal(
          (ref) => popularMovies(
            ref as PopularMoviesRef,
            page: page,
          ),
          from: popularMoviesProvider,
          name: r'popularMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$popularMoviesHash,
          dependencies: PopularMoviesFamily._dependencies,
          allTransitiveDependencies:
              PopularMoviesFamily._allTransitiveDependencies,
          page: page,
        );

  PopularMoviesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int page;

  @override
  Override overrideWith(
    FutureOr<PaginatedResponse<Movie>> Function(PopularMoviesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PopularMoviesProvider._internal(
        (ref) => create(ref as PopularMoviesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PaginatedResponse<Movie>> createElement() {
    return _PopularMoviesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PopularMoviesProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PopularMoviesRef
    on AutoDisposeFutureProviderRef<PaginatedResponse<Movie>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _PopularMoviesProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedResponse<Movie>>
    with PopularMoviesRef {
  _PopularMoviesProviderElement(super.provider);

  @override
  int get page => (origin as PopularMoviesProvider).page;
}

String _$upcomingMoviesHash() => r'4558a4a820096dc277a8c42464792c220407c0e9';

/// See also [upcomingMovies].
@ProviderFor(upcomingMovies)
const upcomingMoviesProvider = UpcomingMoviesFamily();

/// See also [upcomingMovies].
class UpcomingMoviesFamily
    extends Family<AsyncValue<PaginatedResponse<Movie>>> {
  /// See also [upcomingMovies].
  const UpcomingMoviesFamily();

  /// See also [upcomingMovies].
  UpcomingMoviesProvider call({
    int page = 1,
  }) {
    return UpcomingMoviesProvider(
      page: page,
    );
  }

  @override
  UpcomingMoviesProvider getProviderOverride(
    covariant UpcomingMoviesProvider provider,
  ) {
    return call(
      page: provider.page,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'upcomingMoviesProvider';
}

/// See also [upcomingMovies].
class UpcomingMoviesProvider
    extends AutoDisposeFutureProvider<PaginatedResponse<Movie>> {
  /// See also [upcomingMovies].
  UpcomingMoviesProvider({
    int page = 1,
  }) : this._internal(
          (ref) => upcomingMovies(
            ref as UpcomingMoviesRef,
            page: page,
          ),
          from: upcomingMoviesProvider,
          name: r'upcomingMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$upcomingMoviesHash,
          dependencies: UpcomingMoviesFamily._dependencies,
          allTransitiveDependencies:
              UpcomingMoviesFamily._allTransitiveDependencies,
          page: page,
        );

  UpcomingMoviesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int page;

  @override
  Override overrideWith(
    FutureOr<PaginatedResponse<Movie>> Function(UpcomingMoviesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpcomingMoviesProvider._internal(
        (ref) => create(ref as UpcomingMoviesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PaginatedResponse<Movie>> createElement() {
    return _UpcomingMoviesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpcomingMoviesProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpcomingMoviesRef
    on AutoDisposeFutureProviderRef<PaginatedResponse<Movie>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _UpcomingMoviesProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedResponse<Movie>>
    with UpcomingMoviesRef {
  _UpcomingMoviesProviderElement(super.provider);

  @override
  int get page => (origin as UpcomingMoviesProvider).page;
}

String _$topRatedMoviesHash() => r'c7d928ed873d5b93c401b9f0d52b9b7056e119f8';

/// See also [topRatedMovies].
@ProviderFor(topRatedMovies)
const topRatedMoviesProvider = TopRatedMoviesFamily();

/// See also [topRatedMovies].
class TopRatedMoviesFamily
    extends Family<AsyncValue<PaginatedResponse<Movie>>> {
  /// See also [topRatedMovies].
  const TopRatedMoviesFamily();

  /// See also [topRatedMovies].
  TopRatedMoviesProvider call({
    int page = 1,
  }) {
    return TopRatedMoviesProvider(
      page: page,
    );
  }

  @override
  TopRatedMoviesProvider getProviderOverride(
    covariant TopRatedMoviesProvider provider,
  ) {
    return call(
      page: provider.page,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'topRatedMoviesProvider';
}

/// See also [topRatedMovies].
class TopRatedMoviesProvider
    extends AutoDisposeFutureProvider<PaginatedResponse<Movie>> {
  /// See also [topRatedMovies].
  TopRatedMoviesProvider({
    int page = 1,
  }) : this._internal(
          (ref) => topRatedMovies(
            ref as TopRatedMoviesRef,
            page: page,
          ),
          from: topRatedMoviesProvider,
          name: r'topRatedMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$topRatedMoviesHash,
          dependencies: TopRatedMoviesFamily._dependencies,
          allTransitiveDependencies:
              TopRatedMoviesFamily._allTransitiveDependencies,
          page: page,
        );

  TopRatedMoviesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int page;

  @override
  Override overrideWith(
    FutureOr<PaginatedResponse<Movie>> Function(TopRatedMoviesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TopRatedMoviesProvider._internal(
        (ref) => create(ref as TopRatedMoviesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PaginatedResponse<Movie>> createElement() {
    return _TopRatedMoviesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TopRatedMoviesProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TopRatedMoviesRef
    on AutoDisposeFutureProviderRef<PaginatedResponse<Movie>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _TopRatedMoviesProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedResponse<Movie>>
    with TopRatedMoviesRef {
  _TopRatedMoviesProviderElement(super.provider);

  @override
  int get page => (origin as TopRatedMoviesProvider).page;
}

String _$movieDetailsHash() => r'b2fb748d82c96ecfa1fd8dddeca81aed280c2103';

/// See also [movieDetails].
@ProviderFor(movieDetails)
const movieDetailsProvider = MovieDetailsFamily();

/// See also [movieDetails].
class MovieDetailsFamily extends Family<AsyncValue<MovieDetails>> {
  /// See also [movieDetails].
  const MovieDetailsFamily();

  /// See also [movieDetails].
  MovieDetailsProvider call({
    required int movieId,
  }) {
    return MovieDetailsProvider(
      movieId: movieId,
    );
  }

  @override
  MovieDetailsProvider getProviderOverride(
    covariant MovieDetailsProvider provider,
  ) {
    return call(
      movieId: provider.movieId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'movieDetailsProvider';
}

/// See also [movieDetails].
class MovieDetailsProvider extends AutoDisposeFutureProvider<MovieDetails> {
  /// See also [movieDetails].
  MovieDetailsProvider({
    required int movieId,
  }) : this._internal(
          (ref) => movieDetails(
            ref as MovieDetailsRef,
            movieId: movieId,
          ),
          from: movieDetailsProvider,
          name: r'movieDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieDetailsHash,
          dependencies: MovieDetailsFamily._dependencies,
          allTransitiveDependencies:
              MovieDetailsFamily._allTransitiveDependencies,
          movieId: movieId,
        );

  MovieDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final int movieId;

  @override
  Override overrideWith(
    FutureOr<MovieDetails> Function(MovieDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MovieDetailsProvider._internal(
        (ref) => create(ref as MovieDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MovieDetails> createElement() {
    return _MovieDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieDetailsProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MovieDetailsRef on AutoDisposeFutureProviderRef<MovieDetails> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _MovieDetailsProviderElement
    extends AutoDisposeFutureProviderElement<MovieDetails>
    with MovieDetailsRef {
  _MovieDetailsProviderElement(super.provider);

  @override
  int get movieId => (origin as MovieDetailsProvider).movieId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
