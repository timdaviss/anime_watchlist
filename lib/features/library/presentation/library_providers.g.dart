// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedStatus)
final selectedStatusProvider = SelectedStatusProvider._();

final class SelectedStatusProvider
    extends $NotifierProvider<SelectedStatus, WatchStatus?> {
  SelectedStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedStatusHash();

  @$internal
  @override
  SelectedStatus create() => SelectedStatus();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WatchStatus? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WatchStatus?>(value),
    );
  }
}

String _$selectedStatusHash() => r'6ee9b7e83b4415bbf16e7897fde4503fcd508cf6';

abstract class _$SelectedStatus extends $Notifier<WatchStatus?> {
  WatchStatus? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<WatchStatus?, WatchStatus?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WatchStatus?, WatchStatus?>,
              WatchStatus?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedSort)
final selectedSortProvider = SelectedSortProvider._();

final class SelectedSortProvider
    extends $NotifierProvider<SelectedSort, SortOption> {
  SelectedSortProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedSortProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedSortHash();

  @$internal
  @override
  SelectedSort create() => SelectedSort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SortOption value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SortOption>(value),
    );
  }
}

String _$selectedSortHash() => r'0f58d3cc487cef1911b206a4ab69939066313611';

abstract class _$SelectedSort extends $Notifier<SortOption> {
  SortOption build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SortOption, SortOption>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SortOption, SortOption>,
              SortOption,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(LibrarySearchQuery)
final librarySearchQueryProvider = LibrarySearchQueryProvider._();

final class LibrarySearchQueryProvider
    extends $NotifierProvider<LibrarySearchQuery, String> {
  LibrarySearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'librarySearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$librarySearchQueryHash();

  @$internal
  @override
  LibrarySearchQuery create() => LibrarySearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$librarySearchQueryHash() =>
    r'578178065e259b6b4779e602ee686320326c3b6c';

abstract class _$LibrarySearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(animeList)
final animeListProvider = AnimeListProvider._();

final class AnimeListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AnimeEntry>>,
          List<AnimeEntry>,
          Stream<List<AnimeEntry>>
        >
    with $FutureModifier<List<AnimeEntry>>, $StreamProvider<List<AnimeEntry>> {
  AnimeListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'animeListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$animeListHash();

  @$internal
  @override
  $StreamProviderElement<List<AnimeEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<AnimeEntry>> create(Ref ref) {
    return animeList(ref);
  }
}

String _$animeListHash() => r'957e0d64bc486688c8ab8cdd8cf079923b54c214';

@ProviderFor(animeDetail)
final animeDetailProvider = AnimeDetailFamily._();

final class AnimeDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<AnimeEntry?>,
          AnimeEntry?,
          Stream<AnimeEntry?>
        >
    with $FutureModifier<AnimeEntry?>, $StreamProvider<AnimeEntry?> {
  AnimeDetailProvider._({
    required AnimeDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'animeDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$animeDetailHash();

  @override
  String toString() {
    return r'animeDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<AnimeEntry?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<AnimeEntry?> create(Ref ref) {
    final argument = this.argument as String;
    return animeDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AnimeDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$animeDetailHash() => r'a25698a9e2c4f6476704dd9ae6ccdd4511e6084d';

final class AnimeDetailFamily extends $Family
    with $FunctionalFamilyOverride<Stream<AnimeEntry?>, String> {
  AnimeDetailFamily._()
    : super(
        retry: null,
        name: r'animeDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AnimeDetailProvider call(String id) =>
      AnimeDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'animeDetailProvider';
}
