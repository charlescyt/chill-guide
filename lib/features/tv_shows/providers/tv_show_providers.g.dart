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
String _$trendingTvShowsHash() => r'a80b4991c5002cf0c2b3ba866b99da577c3f4b77';

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
class TrendingTvShowsFamily extends Family<AsyncValue<List<TvShow>>> {
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
class TrendingTvShowsProvider extends AutoDisposeFutureProvider<List<TvShow>> {
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
    FutureOr<List<TvShow>> Function(TrendingTvShowsRef provider) create,
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
  AutoDisposeFutureProviderElement<List<TvShow>> createElement() {
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

mixin TrendingTvShowsRef on AutoDisposeFutureProviderRef<List<TvShow>> {
  /// The parameter `timeWindow` of this provider.
  TimeWindow get timeWindow;
}

class _TrendingTvShowsProviderElement
    extends AutoDisposeFutureProviderElement<List<TvShow>>
    with TrendingTvShowsRef {
  _TrendingTvShowsProviderElement(super.provider);

  @override
  TimeWindow get timeWindow => (origin as TrendingTvShowsProvider).timeWindow;
}

String _$airingTodayTvShowsResponseHash() =>
    r'b2895937a69558bfde23a6c5a0d5f6542b02b4fd';

/// See also [airingTodayTvShowsResponse].
@ProviderFor(airingTodayTvShowsResponse)
const airingTodayTvShowsResponseProvider = AiringTodayTvShowsResponseFamily();

/// See also [airingTodayTvShowsResponse].
class AiringTodayTvShowsResponseFamily
    extends Family<AsyncValue<PaginatedResponse<TvShow>>> {
  /// See also [airingTodayTvShowsResponse].
  const AiringTodayTvShowsResponseFamily();

  /// See also [airingTodayTvShowsResponse].
  AiringTodayTvShowsResponseProvider call({
    int page = 1,
  }) {
    return AiringTodayTvShowsResponseProvider(
      page: page,
    );
  }

  @override
  AiringTodayTvShowsResponseProvider getProviderOverride(
    covariant AiringTodayTvShowsResponseProvider provider,
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
  String? get name => r'airingTodayTvShowsResponseProvider';
}

/// See also [airingTodayTvShowsResponse].
class AiringTodayTvShowsResponseProvider
    extends AutoDisposeFutureProvider<PaginatedResponse<TvShow>> {
  /// See also [airingTodayTvShowsResponse].
  AiringTodayTvShowsResponseProvider({
    int page = 1,
  }) : this._internal(
          (ref) => airingTodayTvShowsResponse(
            ref as AiringTodayTvShowsResponseRef,
            page: page,
          ),
          from: airingTodayTvShowsResponseProvider,
          name: r'airingTodayTvShowsResponseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$airingTodayTvShowsResponseHash,
          dependencies: AiringTodayTvShowsResponseFamily._dependencies,
          allTransitiveDependencies:
              AiringTodayTvShowsResponseFamily._allTransitiveDependencies,
          page: page,
        );

  AiringTodayTvShowsResponseProvider._internal(
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
    FutureOr<PaginatedResponse<TvShow>> Function(
            AiringTodayTvShowsResponseRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AiringTodayTvShowsResponseProvider._internal(
        (ref) => create(ref as AiringTodayTvShowsResponseRef),
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
    return _AiringTodayTvShowsResponseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AiringTodayTvShowsResponseProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AiringTodayTvShowsResponseRef
    on AutoDisposeFutureProviderRef<PaginatedResponse<TvShow>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _AiringTodayTvShowsResponseProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedResponse<TvShow>>
    with AiringTodayTvShowsResponseRef {
  _AiringTodayTvShowsResponseProviderElement(super.provider);

  @override
  int get page => (origin as AiringTodayTvShowsResponseProvider).page;
}

String _$airingTodayTvShowsHash() =>
    r'fb450dd2f9d44f50d24bb8274044b9ab3ebf9e53';

/// See also [airingTodayTvShows].
@ProviderFor(airingTodayTvShows)
const airingTodayTvShowsProvider = AiringTodayTvShowsFamily();

/// See also [airingTodayTvShows].
class AiringTodayTvShowsFamily extends Family<AsyncValue<List<TvShow>>> {
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
    extends AutoDisposeFutureProvider<List<TvShow>> {
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
    FutureOr<List<TvShow>> Function(AiringTodayTvShowsRef provider) create,
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
  AutoDisposeFutureProviderElement<List<TvShow>> createElement() {
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

mixin AiringTodayTvShowsRef on AutoDisposeFutureProviderRef<List<TvShow>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _AiringTodayTvShowsProviderElement
    extends AutoDisposeFutureProviderElement<List<TvShow>>
    with AiringTodayTvShowsRef {
  _AiringTodayTvShowsProviderElement(super.provider);

  @override
  int get page => (origin as AiringTodayTvShowsProvider).page;
}

String _$onTheAirTvShowsResponseHash() =>
    r'4d406e31d5a5f4d3e0c370b31eb39c84a7fa9b1e';

/// See also [onTheAirTvShowsResponse].
@ProviderFor(onTheAirTvShowsResponse)
const onTheAirTvShowsResponseProvider = OnTheAirTvShowsResponseFamily();

/// See also [onTheAirTvShowsResponse].
class OnTheAirTvShowsResponseFamily
    extends Family<AsyncValue<PaginatedResponse<TvShow>>> {
  /// See also [onTheAirTvShowsResponse].
  const OnTheAirTvShowsResponseFamily();

  /// See also [onTheAirTvShowsResponse].
  OnTheAirTvShowsResponseProvider call({
    int page = 1,
  }) {
    return OnTheAirTvShowsResponseProvider(
      page: page,
    );
  }

  @override
  OnTheAirTvShowsResponseProvider getProviderOverride(
    covariant OnTheAirTvShowsResponseProvider provider,
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
  String? get name => r'onTheAirTvShowsResponseProvider';
}

/// See also [onTheAirTvShowsResponse].
class OnTheAirTvShowsResponseProvider
    extends AutoDisposeFutureProvider<PaginatedResponse<TvShow>> {
  /// See also [onTheAirTvShowsResponse].
  OnTheAirTvShowsResponseProvider({
    int page = 1,
  }) : this._internal(
          (ref) => onTheAirTvShowsResponse(
            ref as OnTheAirTvShowsResponseRef,
            page: page,
          ),
          from: onTheAirTvShowsResponseProvider,
          name: r'onTheAirTvShowsResponseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$onTheAirTvShowsResponseHash,
          dependencies: OnTheAirTvShowsResponseFamily._dependencies,
          allTransitiveDependencies:
              OnTheAirTvShowsResponseFamily._allTransitiveDependencies,
          page: page,
        );

  OnTheAirTvShowsResponseProvider._internal(
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
    FutureOr<PaginatedResponse<TvShow>> Function(
            OnTheAirTvShowsResponseRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OnTheAirTvShowsResponseProvider._internal(
        (ref) => create(ref as OnTheAirTvShowsResponseRef),
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
    return _OnTheAirTvShowsResponseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OnTheAirTvShowsResponseProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OnTheAirTvShowsResponseRef
    on AutoDisposeFutureProviderRef<PaginatedResponse<TvShow>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _OnTheAirTvShowsResponseProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedResponse<TvShow>>
    with OnTheAirTvShowsResponseRef {
  _OnTheAirTvShowsResponseProviderElement(super.provider);

  @override
  int get page => (origin as OnTheAirTvShowsResponseProvider).page;
}

String _$onTheAirTvShowsHash() => r'6e7ac0fabcbdb9b959950a8462967daf804a6a18';

/// See also [onTheAirTvShows].
@ProviderFor(onTheAirTvShows)
const onTheAirTvShowsProvider = OnTheAirTvShowsFamily();

/// See also [onTheAirTvShows].
class OnTheAirTvShowsFamily extends Family<AsyncValue<List<TvShow>>> {
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
class OnTheAirTvShowsProvider extends AutoDisposeFutureProvider<List<TvShow>> {
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
    FutureOr<List<TvShow>> Function(OnTheAirTvShowsRef provider) create,
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
  AutoDisposeFutureProviderElement<List<TvShow>> createElement() {
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

mixin OnTheAirTvShowsRef on AutoDisposeFutureProviderRef<List<TvShow>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _OnTheAirTvShowsProviderElement
    extends AutoDisposeFutureProviderElement<List<TvShow>>
    with OnTheAirTvShowsRef {
  _OnTheAirTvShowsProviderElement(super.provider);

  @override
  int get page => (origin as OnTheAirTvShowsProvider).page;
}

String _$popularTvShowsResponseHash() =>
    r'eddb66a38ea36ed65a98ca39ed6bd820a8d632df';

/// See also [popularTvShowsResponse].
@ProviderFor(popularTvShowsResponse)
const popularTvShowsResponseProvider = PopularTvShowsResponseFamily();

/// See also [popularTvShowsResponse].
class PopularTvShowsResponseFamily
    extends Family<AsyncValue<PaginatedResponse<TvShow>>> {
  /// See also [popularTvShowsResponse].
  const PopularTvShowsResponseFamily();

  /// See also [popularTvShowsResponse].
  PopularTvShowsResponseProvider call({
    int page = 1,
  }) {
    return PopularTvShowsResponseProvider(
      page: page,
    );
  }

  @override
  PopularTvShowsResponseProvider getProviderOverride(
    covariant PopularTvShowsResponseProvider provider,
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
  String? get name => r'popularTvShowsResponseProvider';
}

/// See also [popularTvShowsResponse].
class PopularTvShowsResponseProvider
    extends AutoDisposeFutureProvider<PaginatedResponse<TvShow>> {
  /// See also [popularTvShowsResponse].
  PopularTvShowsResponseProvider({
    int page = 1,
  }) : this._internal(
          (ref) => popularTvShowsResponse(
            ref as PopularTvShowsResponseRef,
            page: page,
          ),
          from: popularTvShowsResponseProvider,
          name: r'popularTvShowsResponseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$popularTvShowsResponseHash,
          dependencies: PopularTvShowsResponseFamily._dependencies,
          allTransitiveDependencies:
              PopularTvShowsResponseFamily._allTransitiveDependencies,
          page: page,
        );

  PopularTvShowsResponseProvider._internal(
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
    FutureOr<PaginatedResponse<TvShow>> Function(
            PopularTvShowsResponseRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PopularTvShowsResponseProvider._internal(
        (ref) => create(ref as PopularTvShowsResponseRef),
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
    return _PopularTvShowsResponseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PopularTvShowsResponseProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PopularTvShowsResponseRef
    on AutoDisposeFutureProviderRef<PaginatedResponse<TvShow>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _PopularTvShowsResponseProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedResponse<TvShow>>
    with PopularTvShowsResponseRef {
  _PopularTvShowsResponseProviderElement(super.provider);

  @override
  int get page => (origin as PopularTvShowsResponseProvider).page;
}

String _$popularTvShowsHash() => r'2b60e26a1324f824b1a96d918fbd00f6f02be791';

/// See also [popularTvShows].
@ProviderFor(popularTvShows)
const popularTvShowsProvider = PopularTvShowsFamily();

/// See also [popularTvShows].
class PopularTvShowsFamily extends Family<AsyncValue<List<TvShow>>> {
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
class PopularTvShowsProvider extends AutoDisposeFutureProvider<List<TvShow>> {
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
    FutureOr<List<TvShow>> Function(PopularTvShowsRef provider) create,
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
  AutoDisposeFutureProviderElement<List<TvShow>> createElement() {
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

mixin PopularTvShowsRef on AutoDisposeFutureProviderRef<List<TvShow>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _PopularTvShowsProviderElement
    extends AutoDisposeFutureProviderElement<List<TvShow>>
    with PopularTvShowsRef {
  _PopularTvShowsProviderElement(super.provider);

  @override
  int get page => (origin as PopularTvShowsProvider).page;
}

String _$topRatedTvShowsResponseHash() =>
    r'353599ea6cb4e6696e9d9b5cd76f528dae97df2d';

/// See also [topRatedTvShowsResponse].
@ProviderFor(topRatedTvShowsResponse)
const topRatedTvShowsResponseProvider = TopRatedTvShowsResponseFamily();

/// See also [topRatedTvShowsResponse].
class TopRatedTvShowsResponseFamily
    extends Family<AsyncValue<PaginatedResponse<TvShow>>> {
  /// See also [topRatedTvShowsResponse].
  const TopRatedTvShowsResponseFamily();

  /// See also [topRatedTvShowsResponse].
  TopRatedTvShowsResponseProvider call({
    int page = 1,
  }) {
    return TopRatedTvShowsResponseProvider(
      page: page,
    );
  }

  @override
  TopRatedTvShowsResponseProvider getProviderOverride(
    covariant TopRatedTvShowsResponseProvider provider,
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
  String? get name => r'topRatedTvShowsResponseProvider';
}

/// See also [topRatedTvShowsResponse].
class TopRatedTvShowsResponseProvider
    extends AutoDisposeFutureProvider<PaginatedResponse<TvShow>> {
  /// See also [topRatedTvShowsResponse].
  TopRatedTvShowsResponseProvider({
    int page = 1,
  }) : this._internal(
          (ref) => topRatedTvShowsResponse(
            ref as TopRatedTvShowsResponseRef,
            page: page,
          ),
          from: topRatedTvShowsResponseProvider,
          name: r'topRatedTvShowsResponseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$topRatedTvShowsResponseHash,
          dependencies: TopRatedTvShowsResponseFamily._dependencies,
          allTransitiveDependencies:
              TopRatedTvShowsResponseFamily._allTransitiveDependencies,
          page: page,
        );

  TopRatedTvShowsResponseProvider._internal(
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
    FutureOr<PaginatedResponse<TvShow>> Function(
            TopRatedTvShowsResponseRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TopRatedTvShowsResponseProvider._internal(
        (ref) => create(ref as TopRatedTvShowsResponseRef),
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
    return _TopRatedTvShowsResponseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TopRatedTvShowsResponseProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TopRatedTvShowsResponseRef
    on AutoDisposeFutureProviderRef<PaginatedResponse<TvShow>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _TopRatedTvShowsResponseProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedResponse<TvShow>>
    with TopRatedTvShowsResponseRef {
  _TopRatedTvShowsResponseProviderElement(super.provider);

  @override
  int get page => (origin as TopRatedTvShowsResponseProvider).page;
}

String _$topRatedTvShowsHash() => r'e944fb552adbf951e18d4a562783b39c7ff52040';

/// See also [topRatedTvShows].
@ProviderFor(topRatedTvShows)
const topRatedTvShowsProvider = TopRatedTvShowsFamily();

/// See also [topRatedTvShows].
class TopRatedTvShowsFamily extends Family<AsyncValue<List<TvShow>>> {
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
class TopRatedTvShowsProvider extends AutoDisposeFutureProvider<List<TvShow>> {
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
    FutureOr<List<TvShow>> Function(TopRatedTvShowsRef provider) create,
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
  AutoDisposeFutureProviderElement<List<TvShow>> createElement() {
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

mixin TopRatedTvShowsRef on AutoDisposeFutureProviderRef<List<TvShow>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _TopRatedTvShowsProviderElement
    extends AutoDisposeFutureProviderElement<List<TvShow>>
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
