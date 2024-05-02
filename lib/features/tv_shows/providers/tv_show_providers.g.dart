// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tvShowRepoHash() => r'f8f8f1366ad7a5b30ac8ea90e8219301ba5ea8d8';

/// See also [tvShowRepo].
@ProviderFor(tvShowRepo)
final tvShowRepoProvider = AutoDisposeProvider<TvShowRepo>.internal(
  tvShowRepo,
  name: r'tvShowRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tvShowRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TvShowRepoRef = AutoDisposeProviderRef<TvShowRepo>;
String _$trendingTvShowsHash() => r'6b4e1c028c12e66403dd0d9d86bf901a0a385539';

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

/// See also [trendingTvShows].
@ProviderFor(trendingTvShows)
const trendingTvShowsProvider = TrendingTvShowsFamily();

/// See also [trendingTvShows].
class TrendingTvShowsFamily
    extends Family<AsyncValue<PaginatedResponse<TvShow>>> {
  /// See also [trendingTvShows].
  const TrendingTvShowsFamily();

  /// See also [trendingTvShows].
  TrendingTvShowsProvider call({
    TimeWindow timeWindow = TimeWindow.day,
  }) {
    return TrendingTvShowsProvider(
      timeWindow: timeWindow,
    );
  }

  @override
  TrendingTvShowsProvider getProviderOverride(
    covariant TrendingTvShowsProvider provider,
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
  String? get name => r'trendingTvShowsProvider';
}

/// See also [trendingTvShows].
class TrendingTvShowsProvider
    extends AutoDisposeFutureProvider<PaginatedResponse<TvShow>> {
  /// See also [trendingTvShows].
  TrendingTvShowsProvider({
    TimeWindow timeWindow = TimeWindow.day,
  }) : this._internal(
          (ref) => trendingTvShows(
            ref as TrendingTvShowsRef,
            timeWindow: timeWindow,
          ),
          from: trendingTvShowsProvider,
          name: r'trendingTvShowsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$trendingTvShowsHash,
          dependencies: TrendingTvShowsFamily._dependencies,
          allTransitiveDependencies:
              TrendingTvShowsFamily._allTransitiveDependencies,
          timeWindow: timeWindow,
        );

  TrendingTvShowsProvider._internal(
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
    FutureOr<PaginatedResponse<TvShow>> Function(TrendingTvShowsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TrendingTvShowsProvider._internal(
        (ref) => create(ref as TrendingTvShowsRef),
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
  AutoDisposeFutureProviderElement<PaginatedResponse<TvShow>> createElement() {
    return _TrendingTvShowsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TrendingTvShowsProvider && other.timeWindow == timeWindow;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, timeWindow.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TrendingTvShowsRef
    on AutoDisposeFutureProviderRef<PaginatedResponse<TvShow>> {
  /// The parameter `timeWindow` of this provider.
  TimeWindow get timeWindow;
}

class _TrendingTvShowsProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedResponse<TvShow>>
    with TrendingTvShowsRef {
  _TrendingTvShowsProviderElement(super.provider);

  @override
  TimeWindow get timeWindow => (origin as TrendingTvShowsProvider).timeWindow;
}

String _$airingTodayTvShowsHash() =>
    r'77f8d5232f898959343f08e9503d3e83a2a08f9b';

/// See also [airingTodayTvShows].
@ProviderFor(airingTodayTvShows)
const airingTodayTvShowsProvider = AiringTodayTvShowsFamily();

/// See also [airingTodayTvShows].
class AiringTodayTvShowsFamily
    extends Family<AsyncValue<PaginatedResponse<TvShow>>> {
  /// See also [airingTodayTvShows].
  const AiringTodayTvShowsFamily();

  /// See also [airingTodayTvShows].
  AiringTodayTvShowsProvider call({
    int page = 1,
  }) {
    return AiringTodayTvShowsProvider(
      page: page,
    );
  }

  @override
  AiringTodayTvShowsProvider getProviderOverride(
    covariant AiringTodayTvShowsProvider provider,
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
  String? get name => r'airingTodayTvShowsProvider';
}

/// See also [airingTodayTvShows].
class AiringTodayTvShowsProvider
    extends AutoDisposeFutureProvider<PaginatedResponse<TvShow>> {
  /// See also [airingTodayTvShows].
  AiringTodayTvShowsProvider({
    int page = 1,
  }) : this._internal(
          (ref) => airingTodayTvShows(
            ref as AiringTodayTvShowsRef,
            page: page,
          ),
          from: airingTodayTvShowsProvider,
          name: r'airingTodayTvShowsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$airingTodayTvShowsHash,
          dependencies: AiringTodayTvShowsFamily._dependencies,
          allTransitiveDependencies:
              AiringTodayTvShowsFamily._allTransitiveDependencies,
          page: page,
        );

  AiringTodayTvShowsProvider._internal(
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
    FutureOr<PaginatedResponse<TvShow>> Function(AiringTodayTvShowsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AiringTodayTvShowsProvider._internal(
        (ref) => create(ref as AiringTodayTvShowsRef),
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
  AutoDisposeFutureProviderElement<PaginatedResponse<TvShow>> createElement() {
    return _AiringTodayTvShowsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AiringTodayTvShowsProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AiringTodayTvShowsRef
    on AutoDisposeFutureProviderRef<PaginatedResponse<TvShow>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _AiringTodayTvShowsProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedResponse<TvShow>>
    with AiringTodayTvShowsRef {
  _AiringTodayTvShowsProviderElement(super.provider);

  @override
  int get page => (origin as AiringTodayTvShowsProvider).page;
}

String _$onTheAirTvShowsHash() => r'f4f37219c705f48ba44b5f06d7350e463d2ecaac';

/// See also [onTheAirTvShows].
@ProviderFor(onTheAirTvShows)
const onTheAirTvShowsProvider = OnTheAirTvShowsFamily();

/// See also [onTheAirTvShows].
class OnTheAirTvShowsFamily
    extends Family<AsyncValue<PaginatedResponse<TvShow>>> {
  /// See also [onTheAirTvShows].
  const OnTheAirTvShowsFamily();

  /// See also [onTheAirTvShows].
  OnTheAirTvShowsProvider call({
    int page = 1,
  }) {
    return OnTheAirTvShowsProvider(
      page: page,
    );
  }

  @override
  OnTheAirTvShowsProvider getProviderOverride(
    covariant OnTheAirTvShowsProvider provider,
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
  String? get name => r'onTheAirTvShowsProvider';
}

/// See also [onTheAirTvShows].
class OnTheAirTvShowsProvider
    extends AutoDisposeFutureProvider<PaginatedResponse<TvShow>> {
  /// See also [onTheAirTvShows].
  OnTheAirTvShowsProvider({
    int page = 1,
  }) : this._internal(
          (ref) => onTheAirTvShows(
            ref as OnTheAirTvShowsRef,
            page: page,
          ),
          from: onTheAirTvShowsProvider,
          name: r'onTheAirTvShowsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$onTheAirTvShowsHash,
          dependencies: OnTheAirTvShowsFamily._dependencies,
          allTransitiveDependencies:
              OnTheAirTvShowsFamily._allTransitiveDependencies,
          page: page,
        );

  OnTheAirTvShowsProvider._internal(
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
    FutureOr<PaginatedResponse<TvShow>> Function(OnTheAirTvShowsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OnTheAirTvShowsProvider._internal(
        (ref) => create(ref as OnTheAirTvShowsRef),
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
  AutoDisposeFutureProviderElement<PaginatedResponse<TvShow>> createElement() {
    return _OnTheAirTvShowsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OnTheAirTvShowsProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OnTheAirTvShowsRef
    on AutoDisposeFutureProviderRef<PaginatedResponse<TvShow>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _OnTheAirTvShowsProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedResponse<TvShow>>
    with OnTheAirTvShowsRef {
  _OnTheAirTvShowsProviderElement(super.provider);

  @override
  int get page => (origin as OnTheAirTvShowsProvider).page;
}

String _$popularTvShowsHash() => r'139356286e82e6c80b85b0bdf2f4877a7bb2d019';

/// See also [popularTvShows].
@ProviderFor(popularTvShows)
const popularTvShowsProvider = PopularTvShowsFamily();

/// See also [popularTvShows].
class PopularTvShowsFamily
    extends Family<AsyncValue<PaginatedResponse<TvShow>>> {
  /// See also [popularTvShows].
  const PopularTvShowsFamily();

  /// See also [popularTvShows].
  PopularTvShowsProvider call({
    int page = 1,
  }) {
    return PopularTvShowsProvider(
      page: page,
    );
  }

  @override
  PopularTvShowsProvider getProviderOverride(
    covariant PopularTvShowsProvider provider,
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
  String? get name => r'popularTvShowsProvider';
}

/// See also [popularTvShows].
class PopularTvShowsProvider
    extends AutoDisposeFutureProvider<PaginatedResponse<TvShow>> {
  /// See also [popularTvShows].
  PopularTvShowsProvider({
    int page = 1,
  }) : this._internal(
          (ref) => popularTvShows(
            ref as PopularTvShowsRef,
            page: page,
          ),
          from: popularTvShowsProvider,
          name: r'popularTvShowsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$popularTvShowsHash,
          dependencies: PopularTvShowsFamily._dependencies,
          allTransitiveDependencies:
              PopularTvShowsFamily._allTransitiveDependencies,
          page: page,
        );

  PopularTvShowsProvider._internal(
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
    FutureOr<PaginatedResponse<TvShow>> Function(PopularTvShowsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PopularTvShowsProvider._internal(
        (ref) => create(ref as PopularTvShowsRef),
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
  AutoDisposeFutureProviderElement<PaginatedResponse<TvShow>> createElement() {
    return _PopularTvShowsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PopularTvShowsProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PopularTvShowsRef
    on AutoDisposeFutureProviderRef<PaginatedResponse<TvShow>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _PopularTvShowsProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedResponse<TvShow>>
    with PopularTvShowsRef {
  _PopularTvShowsProviderElement(super.provider);

  @override
  int get page => (origin as PopularTvShowsProvider).page;
}

String _$topRatedTvShowsHash() => r'cb54510c7549bc94ea301990e98cc0fe62205674';

/// See also [topRatedTvShows].
@ProviderFor(topRatedTvShows)
const topRatedTvShowsProvider = TopRatedTvShowsFamily();

/// See also [topRatedTvShows].
class TopRatedTvShowsFamily
    extends Family<AsyncValue<PaginatedResponse<TvShow>>> {
  /// See also [topRatedTvShows].
  const TopRatedTvShowsFamily();

  /// See also [topRatedTvShows].
  TopRatedTvShowsProvider call({
    int page = 1,
  }) {
    return TopRatedTvShowsProvider(
      page: page,
    );
  }

  @override
  TopRatedTvShowsProvider getProviderOverride(
    covariant TopRatedTvShowsProvider provider,
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
  String? get name => r'topRatedTvShowsProvider';
}

/// See also [topRatedTvShows].
class TopRatedTvShowsProvider
    extends AutoDisposeFutureProvider<PaginatedResponse<TvShow>> {
  /// See also [topRatedTvShows].
  TopRatedTvShowsProvider({
    int page = 1,
  }) : this._internal(
          (ref) => topRatedTvShows(
            ref as TopRatedTvShowsRef,
            page: page,
          ),
          from: topRatedTvShowsProvider,
          name: r'topRatedTvShowsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$topRatedTvShowsHash,
          dependencies: TopRatedTvShowsFamily._dependencies,
          allTransitiveDependencies:
              TopRatedTvShowsFamily._allTransitiveDependencies,
          page: page,
        );

  TopRatedTvShowsProvider._internal(
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
    FutureOr<PaginatedResponse<TvShow>> Function(TopRatedTvShowsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TopRatedTvShowsProvider._internal(
        (ref) => create(ref as TopRatedTvShowsRef),
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
  AutoDisposeFutureProviderElement<PaginatedResponse<TvShow>> createElement() {
    return _TopRatedTvShowsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TopRatedTvShowsProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TopRatedTvShowsRef
    on AutoDisposeFutureProviderRef<PaginatedResponse<TvShow>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _TopRatedTvShowsProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedResponse<TvShow>>
    with TopRatedTvShowsRef {
  _TopRatedTvShowsProviderElement(super.provider);

  @override
  int get page => (origin as TopRatedTvShowsProvider).page;
}

String _$tvShowDetailsHash() => r'13a5c6392eaad6552fa8f5d35bbbe858d8193b18';

/// See also [tvShowDetails].
@ProviderFor(tvShowDetails)
const tvShowDetailsProvider = TvShowDetailsFamily();

/// See also [tvShowDetails].
class TvShowDetailsFamily extends Family<AsyncValue<TvShowDetails>> {
  /// See also [tvShowDetails].
  const TvShowDetailsFamily();

  /// See also [tvShowDetails].
  TvShowDetailsProvider call({
    required int tvShowId,
  }) {
    return TvShowDetailsProvider(
      tvShowId: tvShowId,
    );
  }

  @override
  TvShowDetailsProvider getProviderOverride(
    covariant TvShowDetailsProvider provider,
  ) {
    return call(
      tvShowId: provider.tvShowId,
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
  String? get name => r'tvShowDetailsProvider';
}

/// See also [tvShowDetails].
class TvShowDetailsProvider extends AutoDisposeFutureProvider<TvShowDetails> {
  /// See also [tvShowDetails].
  TvShowDetailsProvider({
    required int tvShowId,
  }) : this._internal(
          (ref) => tvShowDetails(
            ref as TvShowDetailsRef,
            tvShowId: tvShowId,
          ),
          from: tvShowDetailsProvider,
          name: r'tvShowDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tvShowDetailsHash,
          dependencies: TvShowDetailsFamily._dependencies,
          allTransitiveDependencies:
              TvShowDetailsFamily._allTransitiveDependencies,
          tvShowId: tvShowId,
        );

  TvShowDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tvShowId,
  }) : super.internal();

  final int tvShowId;

  @override
  Override overrideWith(
    FutureOr<TvShowDetails> Function(TvShowDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TvShowDetailsProvider._internal(
        (ref) => create(ref as TvShowDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tvShowId: tvShowId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TvShowDetails> createElement() {
    return _TvShowDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TvShowDetailsProvider && other.tvShowId == tvShowId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tvShowId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TvShowDetailsRef on AutoDisposeFutureProviderRef<TvShowDetails> {
  /// The parameter `tvShowId` of this provider.
  int get tvShowId;
}

class _TvShowDetailsProviderElement
    extends AutoDisposeFutureProviderElement<TvShowDetails>
    with TvShowDetailsRef {
  _TvShowDetailsProviderElement(super.provider);

  @override
  int get tvShowId => (origin as TvShowDetailsProvider).tvShowId;
}

String _$tvShowSeasonDetailsHash() =>
    r'3bd85bb344d515ee42303bc33e5e4704bb1a1ec1';

/// See also [tvShowSeasonDetails].
@ProviderFor(tvShowSeasonDetails)
const tvShowSeasonDetailsProvider = TvShowSeasonDetailsFamily();

/// See also [tvShowSeasonDetails].
class TvShowSeasonDetailsFamily
    extends Family<AsyncValue<TvShowSeasonDetails>> {
  /// See also [tvShowSeasonDetails].
  const TvShowSeasonDetailsFamily();

  /// See also [tvShowSeasonDetails].
  TvShowSeasonDetailsProvider call({
    required int tvShowId,
    required int seasonNumber,
  }) {
    return TvShowSeasonDetailsProvider(
      tvShowId: tvShowId,
      seasonNumber: seasonNumber,
    );
  }

  @override
  TvShowSeasonDetailsProvider getProviderOverride(
    covariant TvShowSeasonDetailsProvider provider,
  ) {
    return call(
      tvShowId: provider.tvShowId,
      seasonNumber: provider.seasonNumber,
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
  String? get name => r'tvShowSeasonDetailsProvider';
}

/// See also [tvShowSeasonDetails].
class TvShowSeasonDetailsProvider
    extends AutoDisposeFutureProvider<TvShowSeasonDetails> {
  /// See also [tvShowSeasonDetails].
  TvShowSeasonDetailsProvider({
    required int tvShowId,
    required int seasonNumber,
  }) : this._internal(
          (ref) => tvShowSeasonDetails(
            ref as TvShowSeasonDetailsRef,
            tvShowId: tvShowId,
            seasonNumber: seasonNumber,
          ),
          from: tvShowSeasonDetailsProvider,
          name: r'tvShowSeasonDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tvShowSeasonDetailsHash,
          dependencies: TvShowSeasonDetailsFamily._dependencies,
          allTransitiveDependencies:
              TvShowSeasonDetailsFamily._allTransitiveDependencies,
          tvShowId: tvShowId,
          seasonNumber: seasonNumber,
        );

  TvShowSeasonDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tvShowId,
    required this.seasonNumber,
  }) : super.internal();

  final int tvShowId;
  final int seasonNumber;

  @override
  Override overrideWith(
    FutureOr<TvShowSeasonDetails> Function(TvShowSeasonDetailsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TvShowSeasonDetailsProvider._internal(
        (ref) => create(ref as TvShowSeasonDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tvShowId: tvShowId,
        seasonNumber: seasonNumber,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TvShowSeasonDetails> createElement() {
    return _TvShowSeasonDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TvShowSeasonDetailsProvider &&
        other.tvShowId == tvShowId &&
        other.seasonNumber == seasonNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tvShowId.hashCode);
    hash = _SystemHash.combine(hash, seasonNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TvShowSeasonDetailsRef
    on AutoDisposeFutureProviderRef<TvShowSeasonDetails> {
  /// The parameter `tvShowId` of this provider.
  int get tvShowId;

  /// The parameter `seasonNumber` of this provider.
  int get seasonNumber;
}

class _TvShowSeasonDetailsProviderElement
    extends AutoDisposeFutureProviderElement<TvShowSeasonDetails>
    with TvShowSeasonDetailsRef {
  _TvShowSeasonDetailsProviderElement(super.provider);

  @override
  int get tvShowId => (origin as TvShowSeasonDetailsProvider).tvShowId;
  @override
  int get seasonNumber => (origin as TvShowSeasonDetailsProvider).seasonNumber;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
