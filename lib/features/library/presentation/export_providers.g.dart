// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'export_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(libraryExportService)
final libraryExportServiceProvider = LibraryExportServiceProvider._();

final class LibraryExportServiceProvider
    extends
        $FunctionalProvider<
          LibraryExportService,
          LibraryExportService,
          LibraryExportService
        >
    with $Provider<LibraryExportService> {
  LibraryExportServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'libraryExportServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$libraryExportServiceHash();

  @$internal
  @override
  $ProviderElement<LibraryExportService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LibraryExportService create(Ref ref) {
    return libraryExportService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LibraryExportService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LibraryExportService>(value),
    );
  }
}

String _$libraryExportServiceHash() =>
    r'0e6a17a1079400fcfaf34cb84f4ee05e72f937cf';
