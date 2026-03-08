// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnimeEntry {

 String get id; String get title; String? get titleJapanese; String? get synopsis; String? get coverImageUrl; int? get totalEpisodes; WatchStatus get watchStatus; double? get rating; String? get notes; bool get isFavorite; String? get genres; int? get malId; int? get anilistId; AnimeSource get source; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of AnimeEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimeEntryCopyWith<AnimeEntry> get copyWith => _$AnimeEntryCopyWithImpl<AnimeEntry>(this as AnimeEntry, _$identity);

  /// Serializes this AnimeEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimeEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.titleJapanese, titleJapanese) || other.titleJapanese == titleJapanese)&&(identical(other.synopsis, synopsis) || other.synopsis == synopsis)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.totalEpisodes, totalEpisodes) || other.totalEpisodes == totalEpisodes)&&(identical(other.watchStatus, watchStatus) || other.watchStatus == watchStatus)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.genres, genres) || other.genres == genres)&&(identical(other.malId, malId) || other.malId == malId)&&(identical(other.anilistId, anilistId) || other.anilistId == anilistId)&&(identical(other.source, source) || other.source == source)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,titleJapanese,synopsis,coverImageUrl,totalEpisodes,watchStatus,rating,notes,isFavorite,genres,malId,anilistId,source,createdAt,updatedAt);

@override
String toString() {
  return 'AnimeEntry(id: $id, title: $title, titleJapanese: $titleJapanese, synopsis: $synopsis, coverImageUrl: $coverImageUrl, totalEpisodes: $totalEpisodes, watchStatus: $watchStatus, rating: $rating, notes: $notes, isFavorite: $isFavorite, genres: $genres, malId: $malId, anilistId: $anilistId, source: $source, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AnimeEntryCopyWith<$Res>  {
  factory $AnimeEntryCopyWith(AnimeEntry value, $Res Function(AnimeEntry) _then) = _$AnimeEntryCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? titleJapanese, String? synopsis, String? coverImageUrl, int? totalEpisodes, WatchStatus watchStatus, double? rating, String? notes, bool isFavorite, String? genres, int? malId, int? anilistId, AnimeSource source, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$AnimeEntryCopyWithImpl<$Res>
    implements $AnimeEntryCopyWith<$Res> {
  _$AnimeEntryCopyWithImpl(this._self, this._then);

  final AnimeEntry _self;
  final $Res Function(AnimeEntry) _then;

/// Create a copy of AnimeEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? titleJapanese = freezed,Object? synopsis = freezed,Object? coverImageUrl = freezed,Object? totalEpisodes = freezed,Object? watchStatus = null,Object? rating = freezed,Object? notes = freezed,Object? isFavorite = null,Object? genres = freezed,Object? malId = freezed,Object? anilistId = freezed,Object? source = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,titleJapanese: freezed == titleJapanese ? _self.titleJapanese : titleJapanese // ignore: cast_nullable_to_non_nullable
as String?,synopsis: freezed == synopsis ? _self.synopsis : synopsis // ignore: cast_nullable_to_non_nullable
as String?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,totalEpisodes: freezed == totalEpisodes ? _self.totalEpisodes : totalEpisodes // ignore: cast_nullable_to_non_nullable
as int?,watchStatus: null == watchStatus ? _self.watchStatus : watchStatus // ignore: cast_nullable_to_non_nullable
as WatchStatus,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as String?,malId: freezed == malId ? _self.malId : malId // ignore: cast_nullable_to_non_nullable
as int?,anilistId: freezed == anilistId ? _self.anilistId : anilistId // ignore: cast_nullable_to_non_nullable
as int?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as AnimeSource,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AnimeEntry].
extension AnimeEntryPatterns on AnimeEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimeEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimeEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimeEntry value)  $default,){
final _that = this;
switch (_that) {
case _AnimeEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimeEntry value)?  $default,){
final _that = this;
switch (_that) {
case _AnimeEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? titleJapanese,  String? synopsis,  String? coverImageUrl,  int? totalEpisodes,  WatchStatus watchStatus,  double? rating,  String? notes,  bool isFavorite,  String? genres,  int? malId,  int? anilistId,  AnimeSource source,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimeEntry() when $default != null:
return $default(_that.id,_that.title,_that.titleJapanese,_that.synopsis,_that.coverImageUrl,_that.totalEpisodes,_that.watchStatus,_that.rating,_that.notes,_that.isFavorite,_that.genres,_that.malId,_that.anilistId,_that.source,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? titleJapanese,  String? synopsis,  String? coverImageUrl,  int? totalEpisodes,  WatchStatus watchStatus,  double? rating,  String? notes,  bool isFavorite,  String? genres,  int? malId,  int? anilistId,  AnimeSource source,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AnimeEntry():
return $default(_that.id,_that.title,_that.titleJapanese,_that.synopsis,_that.coverImageUrl,_that.totalEpisodes,_that.watchStatus,_that.rating,_that.notes,_that.isFavorite,_that.genres,_that.malId,_that.anilistId,_that.source,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? titleJapanese,  String? synopsis,  String? coverImageUrl,  int? totalEpisodes,  WatchStatus watchStatus,  double? rating,  String? notes,  bool isFavorite,  String? genres,  int? malId,  int? anilistId,  AnimeSource source,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AnimeEntry() when $default != null:
return $default(_that.id,_that.title,_that.titleJapanese,_that.synopsis,_that.coverImageUrl,_that.totalEpisodes,_that.watchStatus,_that.rating,_that.notes,_that.isFavorite,_that.genres,_that.malId,_that.anilistId,_that.source,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnimeEntry extends AnimeEntry {
  const _AnimeEntry({required this.id, required this.title, this.titleJapanese, this.synopsis, this.coverImageUrl, this.totalEpisodes, required this.watchStatus, this.rating, this.notes, this.isFavorite = false, this.genres, this.malId, this.anilistId, required this.source, required this.createdAt, required this.updatedAt}): super._();
  factory _AnimeEntry.fromJson(Map<String, dynamic> json) => _$AnimeEntryFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? titleJapanese;
@override final  String? synopsis;
@override final  String? coverImageUrl;
@override final  int? totalEpisodes;
@override final  WatchStatus watchStatus;
@override final  double? rating;
@override final  String? notes;
@override@JsonKey() final  bool isFavorite;
@override final  String? genres;
@override final  int? malId;
@override final  int? anilistId;
@override final  AnimeSource source;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of AnimeEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimeEntryCopyWith<_AnimeEntry> get copyWith => __$AnimeEntryCopyWithImpl<_AnimeEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnimeEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimeEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.titleJapanese, titleJapanese) || other.titleJapanese == titleJapanese)&&(identical(other.synopsis, synopsis) || other.synopsis == synopsis)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.totalEpisodes, totalEpisodes) || other.totalEpisodes == totalEpisodes)&&(identical(other.watchStatus, watchStatus) || other.watchStatus == watchStatus)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.genres, genres) || other.genres == genres)&&(identical(other.malId, malId) || other.malId == malId)&&(identical(other.anilistId, anilistId) || other.anilistId == anilistId)&&(identical(other.source, source) || other.source == source)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,titleJapanese,synopsis,coverImageUrl,totalEpisodes,watchStatus,rating,notes,isFavorite,genres,malId,anilistId,source,createdAt,updatedAt);

@override
String toString() {
  return 'AnimeEntry(id: $id, title: $title, titleJapanese: $titleJapanese, synopsis: $synopsis, coverImageUrl: $coverImageUrl, totalEpisodes: $totalEpisodes, watchStatus: $watchStatus, rating: $rating, notes: $notes, isFavorite: $isFavorite, genres: $genres, malId: $malId, anilistId: $anilistId, source: $source, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AnimeEntryCopyWith<$Res> implements $AnimeEntryCopyWith<$Res> {
  factory _$AnimeEntryCopyWith(_AnimeEntry value, $Res Function(_AnimeEntry) _then) = __$AnimeEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? titleJapanese, String? synopsis, String? coverImageUrl, int? totalEpisodes, WatchStatus watchStatus, double? rating, String? notes, bool isFavorite, String? genres, int? malId, int? anilistId, AnimeSource source, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$AnimeEntryCopyWithImpl<$Res>
    implements _$AnimeEntryCopyWith<$Res> {
  __$AnimeEntryCopyWithImpl(this._self, this._then);

  final _AnimeEntry _self;
  final $Res Function(_AnimeEntry) _then;

/// Create a copy of AnimeEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? titleJapanese = freezed,Object? synopsis = freezed,Object? coverImageUrl = freezed,Object? totalEpisodes = freezed,Object? watchStatus = null,Object? rating = freezed,Object? notes = freezed,Object? isFavorite = null,Object? genres = freezed,Object? malId = freezed,Object? anilistId = freezed,Object? source = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_AnimeEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,titleJapanese: freezed == titleJapanese ? _self.titleJapanese : titleJapanese // ignore: cast_nullable_to_non_nullable
as String?,synopsis: freezed == synopsis ? _self.synopsis : synopsis // ignore: cast_nullable_to_non_nullable
as String?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,totalEpisodes: freezed == totalEpisodes ? _self.totalEpisodes : totalEpisodes // ignore: cast_nullable_to_non_nullable
as int?,watchStatus: null == watchStatus ? _self.watchStatus : watchStatus // ignore: cast_nullable_to_non_nullable
as WatchStatus,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as String?,malId: freezed == malId ? _self.malId : malId // ignore: cast_nullable_to_non_nullable
as int?,anilistId: freezed == anilistId ? _self.anilistId : anilistId // ignore: cast_nullable_to_non_nullable
as int?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as AnimeSource,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
