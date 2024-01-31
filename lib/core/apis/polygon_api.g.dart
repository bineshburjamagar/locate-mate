// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polygon_api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPolygonsHash() => r'99a70c29993f5c103a7ea254111025a00d5b0e52';

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

/// See also [getPolygons].
@ProviderFor(getPolygons)
const getPolygonsProvider = GetPolygonsFamily();

/// See also [getPolygons].
class GetPolygonsFamily extends Family<AsyncValue<PolygonModel>> {
  /// See also [getPolygons].
  const GetPolygonsFamily();

  /// See also [getPolygons].
  GetPolygonsProvider call({
    Map<String, dynamic>? params,
  }) {
    return GetPolygonsProvider(
      params: params,
    );
  }

  @override
  GetPolygonsProvider getProviderOverride(
    covariant GetPolygonsProvider provider,
  ) {
    return call(
      params: provider.params,
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
  String? get name => r'getPolygonsProvider';
}

/// See also [getPolygons].
class GetPolygonsProvider extends AutoDisposeFutureProvider<PolygonModel> {
  /// See also [getPolygons].
  GetPolygonsProvider({
    Map<String, dynamic>? params,
  }) : this._internal(
          (ref) => getPolygons(
            ref as GetPolygonsRef,
            params: params,
          ),
          from: getPolygonsProvider,
          name: r'getPolygonsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPolygonsHash,
          dependencies: GetPolygonsFamily._dependencies,
          allTransitiveDependencies:
              GetPolygonsFamily._allTransitiveDependencies,
          params: params,
        );

  GetPolygonsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final Map<String, dynamic>? params;

  @override
  Override overrideWith(
    FutureOr<PolygonModel> Function(GetPolygonsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPolygonsProvider._internal(
        (ref) => create(ref as GetPolygonsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PolygonModel> createElement() {
    return _GetPolygonsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPolygonsProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPolygonsRef on AutoDisposeFutureProviderRef<PolygonModel> {
  /// The parameter `params` of this provider.
  Map<String, dynamic>? get params;
}

class _GetPolygonsProviderElement
    extends AutoDisposeFutureProviderElement<PolygonModel> with GetPolygonsRef {
  _GetPolygonsProviderElement(super.provider);

  @override
  Map<String, dynamic>? get params => (origin as GetPolygonsProvider).params;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
