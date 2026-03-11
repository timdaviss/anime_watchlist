// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(libraryShareService)
final libraryShareServiceProvider = LibraryShareServiceProvider._();

final class LibraryShareServiceProvider
    extends
        $FunctionalProvider<
          LibraryShareService,
          LibraryShareService,
          LibraryShareService
        >
    with $Provider<LibraryShareService> {
  LibraryShareServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'libraryShareServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$libraryShareServiceHash();

  @$internal
  @override
  $ProviderElement<LibraryShareService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LibraryShareService create(Ref ref) {
    return libraryShareService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LibraryShareService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LibraryShareService>(value),
    );
  }
}

String _$libraryShareServiceHash() =>
    r'b4d0e074953d7885b59cb68dcbee9f8f8be50142';
