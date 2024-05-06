// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$personRepoHash() => r'3598c446b7ae782e463f0c72eb9bf6796043fa6c';

/// See also [personRepo].
@ProviderFor(personRepo)
final personRepoProvider = AutoDisposeProvider<PersonRepo>.internal(
  personRepo,
  name: r'personRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$personRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PersonRepoRef = AutoDisposeProviderRef<PersonRepo>;
String _$personDetailsHash() => r'66a62845a8db86b5f86c540714408da2f3d25837';

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

/// See also [personDetails].
@ProviderFor(personDetails)
const personDetailsProvider = PersonDetailsFamily();

/// See also [personDetails].
class PersonDetailsFamily extends Family<AsyncValue<PersonDetails>> {
  /// See also [personDetails].
  const PersonDetailsFamily();

  /// See also [personDetails].
  PersonDetailsProvider call({
    required int personId,
  }) {
    return PersonDetailsProvider(
      personId: personId,
    );
  }

  @override
  PersonDetailsProvider getProviderOverride(
    covariant PersonDetailsProvider provider,
  ) {
    return call(
      personId: provider.personId,
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
  String? get name => r'personDetailsProvider';
}

/// See also [personDetails].
class PersonDetailsProvider extends AutoDisposeFutureProvider<PersonDetails> {
  /// See also [personDetails].
  PersonDetailsProvider({
    required int personId,
  }) : this._internal(
          (ref) => personDetails(
            ref as PersonDetailsRef,
            personId: personId,
          ),
          from: personDetailsProvider,
          name: r'personDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$personDetailsHash,
          dependencies: PersonDetailsFamily._dependencies,
          allTransitiveDependencies:
              PersonDetailsFamily._allTransitiveDependencies,
          personId: personId,
        );

  PersonDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.personId,
  }) : super.internal();

  final int personId;

  @override
  Override overrideWith(
    FutureOr<PersonDetails> Function(PersonDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PersonDetailsProvider._internal(
        (ref) => create(ref as PersonDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        personId: personId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PersonDetails> createElement() {
    return _PersonDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PersonDetailsProvider && other.personId == personId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, personId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PersonDetailsRef on AutoDisposeFutureProviderRef<PersonDetails> {
  /// The parameter `personId` of this provider.
  int get personId;
}

class _PersonDetailsProviderElement
    extends AutoDisposeFutureProviderElement<PersonDetails>
    with PersonDetailsRef {
  _PersonDetailsProviderElement(super.provider);

  @override
  int get personId => (origin as PersonDetailsProvider).personId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
