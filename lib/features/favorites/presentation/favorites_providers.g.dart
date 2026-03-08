// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(favorites)
final favoritesProvider = FavoritesProvider._();

final class FavoritesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AnimeEntry>>,
          List<AnimeEntry>,
          Stream<List<AnimeEntry>>
        >
    with $FutureModifier<List<AnimeEntry>>, $StreamProvider<List<AnimeEntry>> {
  FavoritesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesHash();

  @$internal
  @override
  $StreamProviderElement<List<AnimeEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<AnimeEntry>> create(Ref ref) {
    return favorites(ref);
  }
}

String _$favoritesHash() => r'efd9c26a18044f41e32531fdbda3a9a1cf4fce0e';
