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
String _$trendingMoviesHash() => r'b4ae2469b5eadb0827ad141d2fff51eac2798723';

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
class TrendingMoviesFamily extends Family<AsyncValue<List<Movie>>> {
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
class TrendingMoviesProvider extends AutoDisposeFutureProvider<List<Movie>> {
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
    FutureOr<List<Movie>> Function(TrendingMoviesRef provider) create,
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
  AutoDisposeFutureProviderElement<List<Movie>> createElement() {
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

mixin TrendingMoviesRef on AutoDisposeFutureProviderRef<List<Movie>> {
  /// The parameter `timeWindow` of this provider.
  TimeWindow get timeWindow;
}

class _TrendingMoviesProviderElement
    extends AutoDisposeFutureProviderElement<List<Movie>>
    with TrendingMoviesRef {
  _TrendingMoviesProviderElement(super.provider);

  @override
  TimeWindow get timeWindow => (origin as TrendingMoviesProvider).timeWindow;
}

String _$popularMoviesHash() => r'9d498474b5e8dff7d5ab929dc845921f637e3df0';

/// See also [popularMovies].
@ProviderFor(popularMovies)
const popularMoviesProvider = PopularMoviesFamily();

/// See also [popularMovies].
class PopularMoviesFamily extends Family<AsyncValue<List<Movie>>> {
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
class PopularMoviesProvider extends AutoDisposeFutureProvider<List<Movie>> {
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
    FutureOr<List<Movie>> Function(PopularMoviesRef provider) create,
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
  AutoDisposeFutureProviderElement<List<Movie>> createElement() {
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

mixin PopularMoviesRef on AutoDisposeFutureProviderRef<List<Movie>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _PopularMoviesProviderElement
    extends AutoDisposeFutureProviderElement<List<Movie>>
    with PopularMoviesRef {
  _PopularMoviesProviderElement(super.provider);

  @override
  int get page => (origin as PopularMoviesProvider).page;
}

String _$upcomingMoviesHash() => r'8489d84d407ea2975e4a04133edbc6a221e3e58b';

/// See also [upcomingMovies].
@ProviderFor(upcomingMovies)
const upcomingMoviesProvider = UpcomingMoviesFamily();

/// See also [upcomingMovies].
class UpcomingMoviesFamily extends Family<AsyncValue<List<Movie>>> {
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
class UpcomingMoviesProvider extends AutoDisposeFutureProvider<List<Movie>> {
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
    FutureOr<List<Movie>> Function(UpcomingMoviesRef provider) create,
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
  AutoDisposeFutureProviderElement<List<Movie>> createElement() {
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

mixin UpcomingMoviesRef on AutoDisposeFutureProviderRef<List<Movie>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _UpcomingMoviesProviderElement
    extends AutoDisposeFutureProviderElement<List<Movie>>
    with UpcomingMoviesRef {
  _UpcomingMoviesProviderElement(super.provider);

  @override
  int get page => (origin as UpcomingMoviesProvider).page;
}

String _$topRatedMoviesHash() => r'3a9b2e408f4cc1f2c82c6d6b52d713e1133e0511';

/// See also [topRatedMovies].
@ProviderFor(topRatedMovies)
const topRatedMoviesProvider = TopRatedMoviesFamily();

/// See also [topRatedMovies].
class TopRatedMoviesFamily extends Family<AsyncValue<List<Movie>>> {
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
class TopRatedMoviesProvider extends AutoDisposeFutureProvider<List<Movie>> {
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
    FutureOr<List<Movie>> Function(TopRatedMoviesRef provider) create,
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
  AutoDisposeFutureProviderElement<List<Movie>> createElement() {
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

mixin TopRatedMoviesRef on AutoDisposeFutureProviderRef<List<Movie>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _TopRatedMoviesProviderElement
    extends AutoDisposeFutureProviderElement<List<Movie>>
    with TopRatedMoviesRef {
  _TopRatedMoviesProviderElement(super.provider);

  @override
  int get page => (origin as TopRatedMoviesProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
