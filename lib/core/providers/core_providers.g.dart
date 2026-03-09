// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentTab)
final currentTabProvider = CurrentTabProvider._();

final class CurrentTabProvider extends $NotifierProvider<CurrentTab, int> {
  CurrentTabProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentTabProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentTabHash();

  @$internal
  @override
  CurrentTab create() => CurrentTab();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$currentTabHash() => r'b1c582b7dc46815262747676bd9242f9c9d9357b';

abstract class _$CurrentTab extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider
    extends
        $FunctionalProvider<
          SharedPreferences,
          SharedPreferences,
          SharedPreferences
        >
    with $Provider<SharedPreferences> {
  SharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return sharedPreferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$sharedPreferencesHash() => r'9824df3f7bbedb56f0348fd2ef943bc943b127aa';

@ProviderFor(database)
final databaseProvider = DatabaseProvider._();

final class DatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  DatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return database(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$databaseHash() => r'736ec0413882f2b3c90ba6c062461117c1ce1274';

@ProviderFor(dio)
final dioProvider = DioProvider._();

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'7f1da3a3c4b2989926ae73d29954fbffe9e170e3';

@ProviderFor(jikanApi)
final jikanApiProvider = JikanApiProvider._();

final class JikanApiProvider
    extends $FunctionalProvider<JikanApi, JikanApi, JikanApi>
    with $Provider<JikanApi> {
  JikanApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'jikanApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$jikanApiHash();

  @$internal
  @override
  $ProviderElement<JikanApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  JikanApi create(Ref ref) {
    return jikanApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(JikanApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<JikanApi>(value),
    );
  }
}

String _$jikanApiHash() => r'efff51bd0b13730deb3d85b37ef0703ee4ff399e';

@ProviderFor(aniListApi)
final aniListApiProvider = AniListApiProvider._();

final class AniListApiProvider
    extends $FunctionalProvider<AniListApi, AniListApi, AniListApi>
    with $Provider<AniListApi> {
  AniListApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aniListApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aniListApiHash();

  @$internal
  @override
  $ProviderElement<AniListApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AniListApi create(Ref ref) {
    return aniListApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AniListApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AniListApi>(value),
    );
  }
}

String _$aniListApiHash() => r'718842ef621aa6152b67b7b5bd8a2b8634aa3aa5';

@ProviderFor(animeRepository)
final animeRepositoryProvider = AnimeRepositoryProvider._();

final class AnimeRepositoryProvider
    extends
        $FunctionalProvider<AnimeRepository, AnimeRepository, AnimeRepository>
    with $Provider<AnimeRepository> {
  AnimeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'animeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$animeRepositoryHash();

  @$internal
  @override
  $ProviderElement<AnimeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AnimeRepository create(Ref ref) {
    return animeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AnimeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AnimeRepository>(value),
    );
  }
}

String _$animeRepositoryHash() => r'1399bd9806f331db15ec8380ef3e9c8e53510c82';

@ProviderFor(animeSearchRepository)
final animeSearchRepositoryProvider = AnimeSearchRepositoryProvider._();

final class AnimeSearchRepositoryProvider
    extends
        $FunctionalProvider<
          AnimeSearchRepository,
          AnimeSearchRepository,
          AnimeSearchRepository
        >
    with $Provider<AnimeSearchRepository> {
  AnimeSearchRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'animeSearchRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$animeSearchRepositoryHash();

  @$internal
  @override
  $ProviderElement<AnimeSearchRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AnimeSearchRepository create(Ref ref) {
    return animeSearchRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AnimeSearchRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AnimeSearchRepository>(value),
    );
  }
}

String _$animeSearchRepositoryHash() =>
    r'c799f2fa43f8221d81b012f52de70fdbe18a1715';

@ProviderFor(searchCacheDao)
final searchCacheDaoProvider = SearchCacheDaoProvider._();

final class SearchCacheDaoProvider
    extends $FunctionalProvider<SearchCacheDao, SearchCacheDao, SearchCacheDao>
    with $Provider<SearchCacheDao> {
  SearchCacheDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchCacheDaoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchCacheDaoHash();

  @$internal
  @override
  $ProviderElement<SearchCacheDao> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SearchCacheDao create(Ref ref) {
    return searchCacheDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchCacheDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchCacheDao>(value),
    );
  }
}

String _$searchCacheDaoHash() => r'4c8b7a61fd50f7b559d4ac405f229e882adf97be';

@ProviderFor(searchCacheService)
final searchCacheServiceProvider = SearchCacheServiceProvider._();

final class SearchCacheServiceProvider
    extends
        $FunctionalProvider<
          SearchCacheService,
          SearchCacheService,
          SearchCacheService
        >
    with $Provider<SearchCacheService> {
  SearchCacheServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchCacheServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchCacheServiceHash();

  @$internal
  @override
  $ProviderElement<SearchCacheService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SearchCacheService create(Ref ref) {
    return searchCacheService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchCacheService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchCacheService>(value),
    );
  }
}

String _$searchCacheServiceHash() =>
    r'00169090604d21035b855e39dcc69d5d1fdf0a11';
