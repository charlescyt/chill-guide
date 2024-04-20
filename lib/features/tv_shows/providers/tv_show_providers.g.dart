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
String _$trendingTvShowsHash() => r'f1fb4b24201f75e32de4c3285bec2c7580d9faf2';

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

String _$airingTodayTvShowsHash() =>
    r'bdceee036f984133ada222fc06ab56df2908696d';

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

String _$onTheAirTvShowsHash() => r'862fc6184af1ae2dc53d8fd804f759b13623b1ae';

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

String _$popularTvShowsHash() => r'08aeff9d58fb28aef550198b2d030f6dde5183ce';

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

String _$topRatedTvShowsHash() => r'1f5cf52903b0b81627aff440da0079abcad326d8';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
