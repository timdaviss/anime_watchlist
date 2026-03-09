// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchNotifier)
final searchProvider = SearchNotifierProvider._();

final class SearchNotifierProvider
    extends $AsyncNotifierProvider<SearchNotifier, List<AnimeSearchResult>> {
  SearchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchNotifierHash();

  @$internal
  @override
  SearchNotifier create() => SearchNotifier();
}

String _$searchNotifierHash() => r'df53ff2f869889b889ca3982d8c69fc176645076';

abstract class _$SearchNotifier
    extends $AsyncNotifier<List<AnimeSearchResult>> {
  FutureOr<List<AnimeSearchResult>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<AnimeSearchResult>>,
              List<AnimeSearchResult>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<AnimeSearchResult>>,
                List<AnimeSearchResult>
              >,
              AsyncValue<List<AnimeSearchResult>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(libraryRevision)
final libraryRevisionProvider = LibraryRevisionProvider._();

final class LibraryRevisionProvider
    extends $FunctionalProvider<AsyncValue<int>, int, Stream<int>>
    with $FutureModifier<int>, $StreamProvider<int> {
  LibraryRevisionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'libraryRevisionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$libraryRevisionHash();

  @$internal
  @override
  $StreamProviderElement<int> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<int> create(Ref ref) {
    return libraryRevision(ref);
  }
}

String _$libraryRevisionHash() => r'd19197a11197e5346d1da7529ec1f1ce3667867d';

@ProviderFor(animeSearchDetail)
final animeSearchDetailProvider = AnimeSearchDetailFamily._();

final class AnimeSearchDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<AnimeSearchResult?>,
          AnimeSearchResult?,
          FutureOr<AnimeSearchResult?>
        >
    with
        $FutureModifier<AnimeSearchResult?>,
        $FutureProvider<AnimeSearchResult?> {
  AnimeSearchDetailProvider._({
    required AnimeSearchDetailFamily super.from,
    required (int, AnimeSource) super.argument,
  }) : super(
         retry: null,
         name: r'animeSearchDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$animeSearchDetailHash();

  @override
  String toString() {
    return r'animeSearchDetailProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<AnimeSearchResult?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AnimeSearchResult?> create(Ref ref) {
    final argument = this.argument as (int, AnimeSource);
    return animeSearchDetail(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is AnimeSearchDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$animeSearchDetailHash() => r'0e9e414d0bf6f4b30284d7ea342906ee69b4ec1a';

final class AnimeSearchDetailFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<AnimeSearchResult?>,
          (int, AnimeSource)
        > {
  AnimeSearchDetailFamily._()
    : super(
        retry: null,
        name: r'animeSearchDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AnimeSearchDetailProvider call(int sourceId, AnimeSource source) =>
      AnimeSearchDetailProvider._(argument: (sourceId, source), from: this);

  @override
  String toString() => r'animeSearchDetailProvider';
}

@ProviderFor(isInLibrary)
final isInLibraryProvider = IsInLibraryFamily._();

final class IsInLibraryProvider
    extends
        $FunctionalProvider<
          AsyncValue<({String entryId, WatchStatus status})?>,
          ({String entryId, WatchStatus status})?,
          FutureOr<({String entryId, WatchStatus status})?>
        >
    with
        $FutureModifier<({String entryId, WatchStatus status})?>,
        $FutureProvider<({String entryId, WatchStatus status})?> {
  IsInLibraryProvider._({
    required IsInLibraryFamily super.from,
    required (int, AnimeSource) super.argument,
  }) : super(
         retry: null,
         name: r'isInLibraryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isInLibraryHash();

  @override
  String toString() {
    return r'isInLibraryProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<({String entryId, WatchStatus status})?>
  $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<({String entryId, WatchStatus status})?> create(Ref ref) {
    final argument = this.argument as (int, AnimeSource);
    return isInLibrary(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is IsInLibraryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isInLibraryHash() => r'4eaf076aabbd4a38e06bdbf1da194e32fc50c34e';

final class IsInLibraryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<({String entryId, WatchStatus status})?>,
          (int, AnimeSource)
        > {
  IsInLibraryFamily._()
    : super(
        retry: null,
        name: r'isInLibraryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsInLibraryProvider call(int sourceId, AnimeSource source) =>
      IsInLibraryProvider._(argument: (sourceId, source), from: this);

  @override
  String toString() => r'isInLibraryProvider';
}
