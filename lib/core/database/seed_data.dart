import 'package:uuid/uuid.dart';

import '../../features/library/domain/anime_entry.dart';
import '../../features/library/domain/watch_status.dart';

final List<AnimeEntry> sampleAnime = [
  AnimeEntry(
    id: const Uuid().v4(),
    title: 'Fullmetal Alchemist: Brotherhood',
    titleJapanese: '鋼の錬金術師 FULLMETAL ALCHEMIST',
    synopsis:
        'After a failed alchemical ritual leaves brothers Edward and Alphonse Elric with devastating consequences, they embark on a journey to find the Philosopher\'s Stone to restore their bodies.',
    coverImageUrl: 'https://cdn.myanimelist.net/images/anime/1208/94745l.jpg',
    totalEpisodes: 64,
    episodesWatched: 64,
    watchStatus: WatchStatus.completed,
    rating: 9.5,
    isFavorite: true,
    genres: 'Action, Adventure, Drama, Fantasy',
    malId: 5114,
    source: AnimeSource.jikan,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  AnimeEntry(
    id: const Uuid().v4(),
    title: 'Spy x Family',
    titleJapanese: 'SPY×FAMILY',
    synopsis:
        'A spy on an undercover mission gets married and adopts a child as part of his cover. His wife and daughter have secrets of their own.',
    coverImageUrl: 'https://cdn.myanimelist.net/images/anime/1441/124795l.jpg',
    totalEpisodes: 12,
    episodesWatched: 8,
    watchStatus: WatchStatus.watching,
    rating: 8.0,
    genres: 'Action, Comedy, Slice of Life',
    malId: 50265,
    source: AnimeSource.jikan,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  AnimeEntry(
    id: const Uuid().v4(),
    title: 'Vinland Saga',
    titleJapanese: 'ヴィンランド・サガ',
    synopsis:
        'Young Thorfinn grew up hearing tales of old sailors who had traversed the ocean and reached Vinland, a place of warmth and plenty.',
    totalEpisodes: 24,
    episodesWatched: 0,
    watchStatus: WatchStatus.planToWatch,
    genres: 'Action, Adventure, Drama',
    source: AnimeSource.manual,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
];
