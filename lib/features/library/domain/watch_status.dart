enum WatchStatus {
  watching,
  completed,
  planToWatch,
  onHold,
  dropped;

  String get displayName => switch (this) {
    watching => 'Watching',
    completed => 'Completed',
    planToWatch => 'Plan to Watch',
    onHold => 'On Hold',
    dropped => 'Dropped',
  };
}

enum SortOption {
  updatedAt,
  title,
  rating,
  createdAt,
  status;

  String get displayName => switch (this) {
    updatedAt => 'Recently Updated',
    title => 'Title',
    rating => 'Rating',
    createdAt => 'Date Added',
    status => 'Status',
  };
}

enum AnimeSource {
  jikan,
  anilist,
  manual;

  String get displayName => switch (this) {
    jikan => 'MAL',
    anilist => 'AniList',
    manual => 'Manual',
  };
}
