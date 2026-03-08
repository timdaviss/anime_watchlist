// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AnimeEntriesTable extends AnimeEntries
    with TableInfo<$AnimeEntriesTable, AnimeEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnimeEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleJapaneseMeta = const VerificationMeta(
    'titleJapanese',
  );
  @override
  late final GeneratedColumn<String> titleJapanese = GeneratedColumn<String>(
    'title_japanese',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _synopsisMeta = const VerificationMeta(
    'synopsis',
  );
  @override
  late final GeneratedColumn<String> synopsis = GeneratedColumn<String>(
    'synopsis',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverImageUrlMeta = const VerificationMeta(
    'coverImageUrl',
  );
  @override
  late final GeneratedColumn<String> coverImageUrl = GeneratedColumn<String>(
    'cover_image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalEpisodesMeta = const VerificationMeta(
    'totalEpisodes',
  );
  @override
  late final GeneratedColumn<int> totalEpisodes = GeneratedColumn<int>(
    'total_episodes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<WatchStatus, String> watchStatus =
      GeneratedColumn<String>(
        'watch_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<WatchStatus>($AnimeEntriesTable.$converterwatchStatus);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints:
        'CHECK (rating IS NULL OR (rating >= 1.0 AND rating <= 10.0))',
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _genresMeta = const VerificationMeta('genres');
  @override
  late final GeneratedColumn<String> genres = GeneratedColumn<String>(
    'genres',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _malIdMeta = const VerificationMeta('malId');
  @override
  late final GeneratedColumn<int> malId = GeneratedColumn<int>(
    'mal_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _anilistIdMeta = const VerificationMeta(
    'anilistId',
  );
  @override
  late final GeneratedColumn<int> anilistId = GeneratedColumn<int>(
    'anilist_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<AnimeSource, String> source =
      GeneratedColumn<String>(
        'source',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<AnimeSource>($AnimeEntriesTable.$convertersource);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    titleJapanese,
    synopsis,
    coverImageUrl,
    totalEpisodes,
    watchStatus,
    rating,
    notes,
    isFavorite,
    genres,
    malId,
    anilistId,
    source,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'anime_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<AnimeEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('title_japanese')) {
      context.handle(
        _titleJapaneseMeta,
        titleJapanese.isAcceptableOrUnknown(
          data['title_japanese']!,
          _titleJapaneseMeta,
        ),
      );
    }
    if (data.containsKey('synopsis')) {
      context.handle(
        _synopsisMeta,
        synopsis.isAcceptableOrUnknown(data['synopsis']!, _synopsisMeta),
      );
    }
    if (data.containsKey('cover_image_url')) {
      context.handle(
        _coverImageUrlMeta,
        coverImageUrl.isAcceptableOrUnknown(
          data['cover_image_url']!,
          _coverImageUrlMeta,
        ),
      );
    }
    if (data.containsKey('total_episodes')) {
      context.handle(
        _totalEpisodesMeta,
        totalEpisodes.isAcceptableOrUnknown(
          data['total_episodes']!,
          _totalEpisodesMeta,
        ),
      );
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('genres')) {
      context.handle(
        _genresMeta,
        genres.isAcceptableOrUnknown(data['genres']!, _genresMeta),
      );
    }
    if (data.containsKey('mal_id')) {
      context.handle(
        _malIdMeta,
        malId.isAcceptableOrUnknown(data['mal_id']!, _malIdMeta),
      );
    }
    if (data.containsKey('anilist_id')) {
      context.handle(
        _anilistIdMeta,
        anilistId.isAcceptableOrUnknown(data['anilist_id']!, _anilistIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AnimeEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnimeEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      titleJapanese: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_japanese'],
      ),
      synopsis: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}synopsis'],
      ),
      coverImageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_image_url'],
      ),
      totalEpisodes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_episodes'],
      ),
      watchStatus: $AnimeEntriesTable.$converterwatchStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}watch_status'],
        )!,
      ),
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      genres: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}genres'],
      ),
      malId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mal_id'],
      ),
      anilistId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}anilist_id'],
      ),
      source: $AnimeEntriesTable.$convertersource.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}source'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AnimeEntriesTable createAlias(String alias) {
    return $AnimeEntriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<WatchStatus, String, String> $converterwatchStatus =
      const EnumNameConverter<WatchStatus>(WatchStatus.values);
  static JsonTypeConverter2<AnimeSource, String, String> $convertersource =
      const EnumNameConverter<AnimeSource>(AnimeSource.values);
}

class AnimeEntry extends DataClass implements Insertable<AnimeEntry> {
  final String id;
  final String title;
  final String? titleJapanese;
  final String? synopsis;
  final String? coverImageUrl;
  final int? totalEpisodes;
  final WatchStatus watchStatus;
  final double? rating;
  final String? notes;
  final bool isFavorite;
  final String? genres;
  final int? malId;
  final int? anilistId;
  final AnimeSource source;
  final DateTime createdAt;
  final DateTime updatedAt;
  const AnimeEntry({
    required this.id,
    required this.title,
    this.titleJapanese,
    this.synopsis,
    this.coverImageUrl,
    this.totalEpisodes,
    required this.watchStatus,
    this.rating,
    this.notes,
    required this.isFavorite,
    this.genres,
    this.malId,
    this.anilistId,
    required this.source,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || titleJapanese != null) {
      map['title_japanese'] = Variable<String>(titleJapanese);
    }
    if (!nullToAbsent || synopsis != null) {
      map['synopsis'] = Variable<String>(synopsis);
    }
    if (!nullToAbsent || coverImageUrl != null) {
      map['cover_image_url'] = Variable<String>(coverImageUrl);
    }
    if (!nullToAbsent || totalEpisodes != null) {
      map['total_episodes'] = Variable<int>(totalEpisodes);
    }
    {
      map['watch_status'] = Variable<String>(
        $AnimeEntriesTable.$converterwatchStatus.toSql(watchStatus),
      );
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<double>(rating);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_favorite'] = Variable<bool>(isFavorite);
    if (!nullToAbsent || genres != null) {
      map['genres'] = Variable<String>(genres);
    }
    if (!nullToAbsent || malId != null) {
      map['mal_id'] = Variable<int>(malId);
    }
    if (!nullToAbsent || anilistId != null) {
      map['anilist_id'] = Variable<int>(anilistId);
    }
    {
      map['source'] = Variable<String>(
        $AnimeEntriesTable.$convertersource.toSql(source),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AnimeEntriesCompanion toCompanion(bool nullToAbsent) {
    return AnimeEntriesCompanion(
      id: Value(id),
      title: Value(title),
      titleJapanese: titleJapanese == null && nullToAbsent
          ? const Value.absent()
          : Value(titleJapanese),
      synopsis: synopsis == null && nullToAbsent
          ? const Value.absent()
          : Value(synopsis),
      coverImageUrl: coverImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(coverImageUrl),
      totalEpisodes: totalEpisodes == null && nullToAbsent
          ? const Value.absent()
          : Value(totalEpisodes),
      watchStatus: Value(watchStatus),
      rating: rating == null && nullToAbsent
          ? const Value.absent()
          : Value(rating),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      isFavorite: Value(isFavorite),
      genres: genres == null && nullToAbsent
          ? const Value.absent()
          : Value(genres),
      malId: malId == null && nullToAbsent
          ? const Value.absent()
          : Value(malId),
      anilistId: anilistId == null && nullToAbsent
          ? const Value.absent()
          : Value(anilistId),
      source: Value(source),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory AnimeEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnimeEntry(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      titleJapanese: serializer.fromJson<String?>(json['titleJapanese']),
      synopsis: serializer.fromJson<String?>(json['synopsis']),
      coverImageUrl: serializer.fromJson<String?>(json['coverImageUrl']),
      totalEpisodes: serializer.fromJson<int?>(json['totalEpisodes']),
      watchStatus: $AnimeEntriesTable.$converterwatchStatus.fromJson(
        serializer.fromJson<String>(json['watchStatus']),
      ),
      rating: serializer.fromJson<double?>(json['rating']),
      notes: serializer.fromJson<String?>(json['notes']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      genres: serializer.fromJson<String?>(json['genres']),
      malId: serializer.fromJson<int?>(json['malId']),
      anilistId: serializer.fromJson<int?>(json['anilistId']),
      source: $AnimeEntriesTable.$convertersource.fromJson(
        serializer.fromJson<String>(json['source']),
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'titleJapanese': serializer.toJson<String?>(titleJapanese),
      'synopsis': serializer.toJson<String?>(synopsis),
      'coverImageUrl': serializer.toJson<String?>(coverImageUrl),
      'totalEpisodes': serializer.toJson<int?>(totalEpisodes),
      'watchStatus': serializer.toJson<String>(
        $AnimeEntriesTable.$converterwatchStatus.toJson(watchStatus),
      ),
      'rating': serializer.toJson<double?>(rating),
      'notes': serializer.toJson<String?>(notes),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'genres': serializer.toJson<String?>(genres),
      'malId': serializer.toJson<int?>(malId),
      'anilistId': serializer.toJson<int?>(anilistId),
      'source': serializer.toJson<String>(
        $AnimeEntriesTable.$convertersource.toJson(source),
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AnimeEntry copyWith({
    String? id,
    String? title,
    Value<String?> titleJapanese = const Value.absent(),
    Value<String?> synopsis = const Value.absent(),
    Value<String?> coverImageUrl = const Value.absent(),
    Value<int?> totalEpisodes = const Value.absent(),
    WatchStatus? watchStatus,
    Value<double?> rating = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    bool? isFavorite,
    Value<String?> genres = const Value.absent(),
    Value<int?> malId = const Value.absent(),
    Value<int?> anilistId = const Value.absent(),
    AnimeSource? source,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => AnimeEntry(
    id: id ?? this.id,
    title: title ?? this.title,
    titleJapanese: titleJapanese.present
        ? titleJapanese.value
        : this.titleJapanese,
    synopsis: synopsis.present ? synopsis.value : this.synopsis,
    coverImageUrl: coverImageUrl.present
        ? coverImageUrl.value
        : this.coverImageUrl,
    totalEpisodes: totalEpisodes.present
        ? totalEpisodes.value
        : this.totalEpisodes,
    watchStatus: watchStatus ?? this.watchStatus,
    rating: rating.present ? rating.value : this.rating,
    notes: notes.present ? notes.value : this.notes,
    isFavorite: isFavorite ?? this.isFavorite,
    genres: genres.present ? genres.value : this.genres,
    malId: malId.present ? malId.value : this.malId,
    anilistId: anilistId.present ? anilistId.value : this.anilistId,
    source: source ?? this.source,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AnimeEntry copyWithCompanion(AnimeEntriesCompanion data) {
    return AnimeEntry(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      titleJapanese: data.titleJapanese.present
          ? data.titleJapanese.value
          : this.titleJapanese,
      synopsis: data.synopsis.present ? data.synopsis.value : this.synopsis,
      coverImageUrl: data.coverImageUrl.present
          ? data.coverImageUrl.value
          : this.coverImageUrl,
      totalEpisodes: data.totalEpisodes.present
          ? data.totalEpisodes.value
          : this.totalEpisodes,
      watchStatus: data.watchStatus.present
          ? data.watchStatus.value
          : this.watchStatus,
      rating: data.rating.present ? data.rating.value : this.rating,
      notes: data.notes.present ? data.notes.value : this.notes,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      genres: data.genres.present ? data.genres.value : this.genres,
      malId: data.malId.present ? data.malId.value : this.malId,
      anilistId: data.anilistId.present ? data.anilistId.value : this.anilistId,
      source: data.source.present ? data.source.value : this.source,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnimeEntry(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('titleJapanese: $titleJapanese, ')
          ..write('synopsis: $synopsis, ')
          ..write('coverImageUrl: $coverImageUrl, ')
          ..write('totalEpisodes: $totalEpisodes, ')
          ..write('watchStatus: $watchStatus, ')
          ..write('rating: $rating, ')
          ..write('notes: $notes, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('genres: $genres, ')
          ..write('malId: $malId, ')
          ..write('anilistId: $anilistId, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    titleJapanese,
    synopsis,
    coverImageUrl,
    totalEpisodes,
    watchStatus,
    rating,
    notes,
    isFavorite,
    genres,
    malId,
    anilistId,
    source,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnimeEntry &&
          other.id == this.id &&
          other.title == this.title &&
          other.titleJapanese == this.titleJapanese &&
          other.synopsis == this.synopsis &&
          other.coverImageUrl == this.coverImageUrl &&
          other.totalEpisodes == this.totalEpisodes &&
          other.watchStatus == this.watchStatus &&
          other.rating == this.rating &&
          other.notes == this.notes &&
          other.isFavorite == this.isFavorite &&
          other.genres == this.genres &&
          other.malId == this.malId &&
          other.anilistId == this.anilistId &&
          other.source == this.source &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AnimeEntriesCompanion extends UpdateCompanion<AnimeEntry> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> titleJapanese;
  final Value<String?> synopsis;
  final Value<String?> coverImageUrl;
  final Value<int?> totalEpisodes;
  final Value<WatchStatus> watchStatus;
  final Value<double?> rating;
  final Value<String?> notes;
  final Value<bool> isFavorite;
  final Value<String?> genres;
  final Value<int?> malId;
  final Value<int?> anilistId;
  final Value<AnimeSource> source;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AnimeEntriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.titleJapanese = const Value.absent(),
    this.synopsis = const Value.absent(),
    this.coverImageUrl = const Value.absent(),
    this.totalEpisodes = const Value.absent(),
    this.watchStatus = const Value.absent(),
    this.rating = const Value.absent(),
    this.notes = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.genres = const Value.absent(),
    this.malId = const Value.absent(),
    this.anilistId = const Value.absent(),
    this.source = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnimeEntriesCompanion.insert({
    required String id,
    required String title,
    this.titleJapanese = const Value.absent(),
    this.synopsis = const Value.absent(),
    this.coverImageUrl = const Value.absent(),
    this.totalEpisodes = const Value.absent(),
    required WatchStatus watchStatus,
    this.rating = const Value.absent(),
    this.notes = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.genres = const Value.absent(),
    this.malId = const Value.absent(),
    this.anilistId = const Value.absent(),
    required AnimeSource source,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       watchStatus = Value(watchStatus),
       source = Value(source),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<AnimeEntry> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? titleJapanese,
    Expression<String>? synopsis,
    Expression<String>? coverImageUrl,
    Expression<int>? totalEpisodes,
    Expression<String>? watchStatus,
    Expression<double>? rating,
    Expression<String>? notes,
    Expression<bool>? isFavorite,
    Expression<String>? genres,
    Expression<int>? malId,
    Expression<int>? anilistId,
    Expression<String>? source,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (titleJapanese != null) 'title_japanese': titleJapanese,
      if (synopsis != null) 'synopsis': synopsis,
      if (coverImageUrl != null) 'cover_image_url': coverImageUrl,
      if (totalEpisodes != null) 'total_episodes': totalEpisodes,
      if (watchStatus != null) 'watch_status': watchStatus,
      if (rating != null) 'rating': rating,
      if (notes != null) 'notes': notes,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (genres != null) 'genres': genres,
      if (malId != null) 'mal_id': malId,
      if (anilistId != null) 'anilist_id': anilistId,
      if (source != null) 'source': source,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnimeEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? titleJapanese,
    Value<String?>? synopsis,
    Value<String?>? coverImageUrl,
    Value<int?>? totalEpisodes,
    Value<WatchStatus>? watchStatus,
    Value<double?>? rating,
    Value<String?>? notes,
    Value<bool>? isFavorite,
    Value<String?>? genres,
    Value<int?>? malId,
    Value<int?>? anilistId,
    Value<AnimeSource>? source,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AnimeEntriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      titleJapanese: titleJapanese ?? this.titleJapanese,
      synopsis: synopsis ?? this.synopsis,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      totalEpisodes: totalEpisodes ?? this.totalEpisodes,
      watchStatus: watchStatus ?? this.watchStatus,
      rating: rating ?? this.rating,
      notes: notes ?? this.notes,
      isFavorite: isFavorite ?? this.isFavorite,
      genres: genres ?? this.genres,
      malId: malId ?? this.malId,
      anilistId: anilistId ?? this.anilistId,
      source: source ?? this.source,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (titleJapanese.present) {
      map['title_japanese'] = Variable<String>(titleJapanese.value);
    }
    if (synopsis.present) {
      map['synopsis'] = Variable<String>(synopsis.value);
    }
    if (coverImageUrl.present) {
      map['cover_image_url'] = Variable<String>(coverImageUrl.value);
    }
    if (totalEpisodes.present) {
      map['total_episodes'] = Variable<int>(totalEpisodes.value);
    }
    if (watchStatus.present) {
      map['watch_status'] = Variable<String>(
        $AnimeEntriesTable.$converterwatchStatus.toSql(watchStatus.value),
      );
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (genres.present) {
      map['genres'] = Variable<String>(genres.value);
    }
    if (malId.present) {
      map['mal_id'] = Variable<int>(malId.value);
    }
    if (anilistId.present) {
      map['anilist_id'] = Variable<int>(anilistId.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(
        $AnimeEntriesTable.$convertersource.toSql(source.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnimeEntriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('titleJapanese: $titleJapanese, ')
          ..write('synopsis: $synopsis, ')
          ..write('coverImageUrl: $coverImageUrl, ')
          ..write('totalEpisodes: $totalEpisodes, ')
          ..write('watchStatus: $watchStatus, ')
          ..write('rating: $rating, ')
          ..write('notes: $notes, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('genres: $genres, ')
          ..write('malId: $malId, ')
          ..write('anilistId: $anilistId, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AnimeEntriesTable animeEntries = $AnimeEntriesTable(this);
  late final AnimeEntriesDao animeEntriesDao = AnimeEntriesDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [animeEntries];
}

typedef $$AnimeEntriesTableCreateCompanionBuilder =
    AnimeEntriesCompanion Function({
      required String id,
      required String title,
      Value<String?> titleJapanese,
      Value<String?> synopsis,
      Value<String?> coverImageUrl,
      Value<int?> totalEpisodes,
      required WatchStatus watchStatus,
      Value<double?> rating,
      Value<String?> notes,
      Value<bool> isFavorite,
      Value<String?> genres,
      Value<int?> malId,
      Value<int?> anilistId,
      required AnimeSource source,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$AnimeEntriesTableUpdateCompanionBuilder =
    AnimeEntriesCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String?> titleJapanese,
      Value<String?> synopsis,
      Value<String?> coverImageUrl,
      Value<int?> totalEpisodes,
      Value<WatchStatus> watchStatus,
      Value<double?> rating,
      Value<String?> notes,
      Value<bool> isFavorite,
      Value<String?> genres,
      Value<int?> malId,
      Value<int?> anilistId,
      Value<AnimeSource> source,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$AnimeEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $AnimeEntriesTable> {
  $$AnimeEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titleJapanese => $composableBuilder(
    column: $table.titleJapanese,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get synopsis => $composableBuilder(
    column: $table.synopsis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverImageUrl => $composableBuilder(
    column: $table.coverImageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalEpisodes => $composableBuilder(
    column: $table.totalEpisodes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<WatchStatus, WatchStatus, String>
  get watchStatus => $composableBuilder(
    column: $table.watchStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get genres => $composableBuilder(
    column: $table.genres,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get malId => $composableBuilder(
    column: $table.malId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get anilistId => $composableBuilder(
    column: $table.anilistId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AnimeSource, AnimeSource, String> get source =>
      $composableBuilder(
        column: $table.source,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AnimeEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $AnimeEntriesTable> {
  $$AnimeEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titleJapanese => $composableBuilder(
    column: $table.titleJapanese,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get synopsis => $composableBuilder(
    column: $table.synopsis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverImageUrl => $composableBuilder(
    column: $table.coverImageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalEpisodes => $composableBuilder(
    column: $table.totalEpisodes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get watchStatus => $composableBuilder(
    column: $table.watchStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get genres => $composableBuilder(
    column: $table.genres,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get malId => $composableBuilder(
    column: $table.malId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get anilistId => $composableBuilder(
    column: $table.anilistId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AnimeEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnimeEntriesTable> {
  $$AnimeEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get titleJapanese => $composableBuilder(
    column: $table.titleJapanese,
    builder: (column) => column,
  );

  GeneratedColumn<String> get synopsis =>
      $composableBuilder(column: $table.synopsis, builder: (column) => column);

  GeneratedColumn<String> get coverImageUrl => $composableBuilder(
    column: $table.coverImageUrl,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalEpisodes => $composableBuilder(
    column: $table.totalEpisodes,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<WatchStatus, String> get watchStatus =>
      $composableBuilder(
        column: $table.watchStatus,
        builder: (column) => column,
      );

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<String> get genres =>
      $composableBuilder(column: $table.genres, builder: (column) => column);

  GeneratedColumn<int> get malId =>
      $composableBuilder(column: $table.malId, builder: (column) => column);

  GeneratedColumn<int> get anilistId =>
      $composableBuilder(column: $table.anilistId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AnimeSource, String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AnimeEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AnimeEntriesTable,
          AnimeEntry,
          $$AnimeEntriesTableFilterComposer,
          $$AnimeEntriesTableOrderingComposer,
          $$AnimeEntriesTableAnnotationComposer,
          $$AnimeEntriesTableCreateCompanionBuilder,
          $$AnimeEntriesTableUpdateCompanionBuilder,
          (
            AnimeEntry,
            BaseReferences<_$AppDatabase, $AnimeEntriesTable, AnimeEntry>,
          ),
          AnimeEntry,
          PrefetchHooks Function()
        > {
  $$AnimeEntriesTableTableManager(_$AppDatabase db, $AnimeEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnimeEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnimeEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnimeEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> titleJapanese = const Value.absent(),
                Value<String?> synopsis = const Value.absent(),
                Value<String?> coverImageUrl = const Value.absent(),
                Value<int?> totalEpisodes = const Value.absent(),
                Value<WatchStatus> watchStatus = const Value.absent(),
                Value<double?> rating = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<String?> genres = const Value.absent(),
                Value<int?> malId = const Value.absent(),
                Value<int?> anilistId = const Value.absent(),
                Value<AnimeSource> source = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnimeEntriesCompanion(
                id: id,
                title: title,
                titleJapanese: titleJapanese,
                synopsis: synopsis,
                coverImageUrl: coverImageUrl,
                totalEpisodes: totalEpisodes,
                watchStatus: watchStatus,
                rating: rating,
                notes: notes,
                isFavorite: isFavorite,
                genres: genres,
                malId: malId,
                anilistId: anilistId,
                source: source,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> titleJapanese = const Value.absent(),
                Value<String?> synopsis = const Value.absent(),
                Value<String?> coverImageUrl = const Value.absent(),
                Value<int?> totalEpisodes = const Value.absent(),
                required WatchStatus watchStatus,
                Value<double?> rating = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<String?> genres = const Value.absent(),
                Value<int?> malId = const Value.absent(),
                Value<int?> anilistId = const Value.absent(),
                required AnimeSource source,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => AnimeEntriesCompanion.insert(
                id: id,
                title: title,
                titleJapanese: titleJapanese,
                synopsis: synopsis,
                coverImageUrl: coverImageUrl,
                totalEpisodes: totalEpisodes,
                watchStatus: watchStatus,
                rating: rating,
                notes: notes,
                isFavorite: isFavorite,
                genres: genres,
                malId: malId,
                anilistId: anilistId,
                source: source,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AnimeEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AnimeEntriesTable,
      AnimeEntry,
      $$AnimeEntriesTableFilterComposer,
      $$AnimeEntriesTableOrderingComposer,
      $$AnimeEntriesTableAnnotationComposer,
      $$AnimeEntriesTableCreateCompanionBuilder,
      $$AnimeEntriesTableUpdateCompanionBuilder,
      (
        AnimeEntry,
        BaseReferences<_$AppDatabase, $AnimeEntriesTable, AnimeEntry>,
      ),
      AnimeEntry,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AnimeEntriesTableTableManager get animeEntries =>
      $$AnimeEntriesTableTableManager(_db, _db.animeEntries);
}

mixin _$AnimeEntriesDaoMixin on DatabaseAccessor<AppDatabase> {
  $AnimeEntriesTable get animeEntries => attachedDatabase.animeEntries;
  AnimeEntriesDaoManager get managers => AnimeEntriesDaoManager(this);
}

class AnimeEntriesDaoManager {
  final _$AnimeEntriesDaoMixin _db;
  AnimeEntriesDaoManager(this._db);
  $$AnimeEntriesTableTableManager get animeEntries =>
      $$AnimeEntriesTableTableManager(_db.attachedDatabase, _db.animeEntries);
}
