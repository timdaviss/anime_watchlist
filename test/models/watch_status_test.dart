import 'package:anime_watchlist/features/library/domain/watch_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('displayName maps each status correctly', () {
    expect(WatchStatus.watching.displayName, 'Watching');
    expect(WatchStatus.completed.displayName, 'Completed');
    expect(WatchStatus.planToWatch.displayName, 'Plan to Watch');
    expect(WatchStatus.onHold.displayName, 'On Hold');
    expect(WatchStatus.dropped.displayName, 'Dropped');
  });

  test('WatchStatus enum names match Drift textEnum serialization', () {
    expect(WatchStatus.watching.name, 'watching');
    expect(WatchStatus.completed.name, 'completed');
    expect(WatchStatus.planToWatch.name, 'planToWatch');
    expect(WatchStatus.onHold.name, 'onHold');
    expect(WatchStatus.dropped.name, 'dropped');
    expect(WatchStatus.values.length, 5);
  });

  test('AnimeSource enum names match Drift textEnum serialization', () {
    expect(AnimeSource.jikan.name, 'jikan');
    expect(AnimeSource.anilist.name, 'anilist');
    expect(AnimeSource.manual.name, 'manual');
    expect(AnimeSource.values.length, 3);
  });

  test('AnimeSource displayName maps each source correctly', () {
    expect(AnimeSource.jikan.displayName, 'MAL');
    expect(AnimeSource.anilist.displayName, 'AniList');
    expect(AnimeSource.manual.displayName, 'Manual');
  });
}
