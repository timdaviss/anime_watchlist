// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnimeSearchResult {

 int get sourceId; AnimeSource get source; String get title; String? get titleJapanese; String? get synopsis; String? get coverImageUrl; int? get totalEpisodes; String? get genres; double? get communityScore; String? get airingStatus;
/// Create a copy of AnimeSearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimeSearchResultCopyWith<AnimeSearchResult> get copyWith => _$AnimeSearchResultCopyWithImpl<AnimeSearchResult>(this as AnimeSearchResult, _$identity);

  /// Serializes this AnimeSearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimeSearchResult&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.source, source) || other.source == source)&&(identical(other.title, title) || other.title == title)&&(identical(other.titleJapanese, titleJapanese) || other.titleJapanese == titleJapanese)&&(identical(other.synopsis, synopsis) || other.synopsis == synopsis)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.totalEpisodes, totalEpisodes) || other.totalEpisodes == totalEpisodes)&&(identical(other.genres, genres) || other.genres == genres)&&(identical(other.communityScore, communityScore) || other.communityScore == communityScore)&&(identical(other.airingStatus, airingStatus) || other.airingStatus == airingStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,source,title,titleJapanese,synopsis,coverImageUrl,totalEpisodes,genres,communityScore,airingStatus);

@override
String toString() {
  return 'AnimeSearchResult(sourceId: $sourceId, source: $source, title: $title, titleJapanese: $titleJapanese, synopsis: $synopsis, coverImageUrl: $coverImageUrl, totalEpisodes: $totalEpisodes, genres: $genres, communityScore: $communityScore, airingStatus: $airingStatus)';
}


}

/// @nodoc
abstract mixin class $AnimeSearchResultCopyWith<$Res>  {
  factory $AnimeSearchResultCopyWith(AnimeSearchResult value, $Res Function(AnimeSearchResult) _then) = _$AnimeSearchResultCopyWithImpl;
@useResult
$Res call({
 int sourceId, AnimeSource source, String title, String? titleJapanese, String? synopsis, String? coverImageUrl, int? totalEpisodes, String? genres, double? communityScore, String? airingStatus
});




}
/// @nodoc
class _$AnimeSearchResultCopyWithImpl<$Res>
    implements $AnimeSearchResultCopyWith<$Res> {
  _$AnimeSearchResultCopyWithImpl(this._self, this._then);

  final AnimeSearchResult _self;
  final $Res Function(AnimeSearchResult) _then;

/// Create a copy of AnimeSearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceId = null,Object? source = null,Object? title = null,Object? titleJapanese = freezed,Object? synopsis = freezed,Object? coverImageUrl = freezed,Object? totalEpisodes = freezed,Object? genres = freezed,Object? communityScore = freezed,Object? airingStatus = freezed,}) {
  return _then(_self.copyWith(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as int,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as AnimeSource,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,titleJapanese: freezed == titleJapanese ? _self.titleJapanese : titleJapanese // ignore: cast_nullable_to_non_nullable
as String?,synopsis: freezed == synopsis ? _self.synopsis : synopsis // ignore: cast_nullable_to_non_nullable
as String?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,totalEpisodes: freezed == totalEpisodes ? _self.totalEpisodes : totalEpisodes // ignore: cast_nullable_to_non_nullable
as int?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as String?,communityScore: freezed == communityScore ? _self.communityScore : communityScore // ignore: cast_nullable_to_non_nullable
as double?,airingStatus: freezed == airingStatus ? _self.airingStatus : airingStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnimeSearchResult].
extension AnimeSearchResultPatterns on AnimeSearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimeSearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimeSearchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimeSearchResult value)  $default,){
final _that = this;
switch (_that) {
case _AnimeSearchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimeSearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _AnimeSearchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sourceId,  AnimeSource source,  String title,  String? titleJapanese,  String? synopsis,  String? coverImageUrl,  int? totalEpisodes,  String? genres,  double? communityScore,  String? airingStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimeSearchResult() when $default != null:
return $default(_that.sourceId,_that.source,_that.title,_that.titleJapanese,_that.synopsis,_that.coverImageUrl,_that.totalEpisodes,_that.genres,_that.communityScore,_that.airingStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sourceId,  AnimeSource source,  String title,  String? titleJapanese,  String? synopsis,  String? coverImageUrl,  int? totalEpisodes,  String? genres,  double? communityScore,  String? airingStatus)  $default,) {final _that = this;
switch (_that) {
case _AnimeSearchResult():
return $default(_that.sourceId,_that.source,_that.title,_that.titleJapanese,_that.synopsis,_that.coverImageUrl,_that.totalEpisodes,_that.genres,_that.communityScore,_that.airingStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sourceId,  AnimeSource source,  String title,  String? titleJapanese,  String? synopsis,  String? coverImageUrl,  int? totalEpisodes,  String? genres,  double? communityScore,  String? airingStatus)?  $default,) {final _that = this;
switch (_that) {
case _AnimeSearchResult() when $default != null:
return $default(_that.sourceId,_that.source,_that.title,_that.titleJapanese,_that.synopsis,_that.coverImageUrl,_that.totalEpisodes,_that.genres,_that.communityScore,_that.airingStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnimeSearchResult implements AnimeSearchResult {
  const _AnimeSearchResult({required this.sourceId, required this.source, required this.title, this.titleJapanese, this.synopsis, this.coverImageUrl, this.totalEpisodes, this.genres, this.communityScore, this.airingStatus});
  factory _AnimeSearchResult.fromJson(Map<String, dynamic> json) => _$AnimeSearchResultFromJson(json);

@override final  int sourceId;
@override final  AnimeSource source;
@override final  String title;
@override final  String? titleJapanese;
@override final  String? synopsis;
@override final  String? coverImageUrl;
@override final  int? totalEpisodes;
@override final  String? genres;
@override final  double? communityScore;
@override final  String? airingStatus;

/// Create a copy of AnimeSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimeSearchResultCopyWith<_AnimeSearchResult> get copyWith => __$AnimeSearchResultCopyWithImpl<_AnimeSearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnimeSearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimeSearchResult&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.source, source) || other.source == source)&&(identical(other.title, title) || other.title == title)&&(identical(other.titleJapanese, titleJapanese) || other.titleJapanese == titleJapanese)&&(identical(other.synopsis, synopsis) || other.synopsis == synopsis)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.totalEpisodes, totalEpisodes) || other.totalEpisodes == totalEpisodes)&&(identical(other.genres, genres) || other.genres == genres)&&(identical(other.communityScore, communityScore) || other.communityScore == communityScore)&&(identical(other.airingStatus, airingStatus) || other.airingStatus == airingStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,source,title,titleJapanese,synopsis,coverImageUrl,totalEpisodes,genres,communityScore,airingStatus);

@override
String toString() {
  return 'AnimeSearchResult(sourceId: $sourceId, source: $source, title: $title, titleJapanese: $titleJapanese, synopsis: $synopsis, coverImageUrl: $coverImageUrl, totalEpisodes: $totalEpisodes, genres: $genres, communityScore: $communityScore, airingStatus: $airingStatus)';
}


}

/// @nodoc
abstract mixin class _$AnimeSearchResultCopyWith<$Res> implements $AnimeSearchResultCopyWith<$Res> {
  factory _$AnimeSearchResultCopyWith(_AnimeSearchResult value, $Res Function(_AnimeSearchResult) _then) = __$AnimeSearchResultCopyWithImpl;
@override @useResult
$Res call({
 int sourceId, AnimeSource source, String title, String? titleJapanese, String? synopsis, String? coverImageUrl, int? totalEpisodes, String? genres, double? communityScore, String? airingStatus
});




}
/// @nodoc
class __$AnimeSearchResultCopyWithImpl<$Res>
    implements _$AnimeSearchResultCopyWith<$Res> {
  __$AnimeSearchResultCopyWithImpl(this._self, this._then);

  final _AnimeSearchResult _self;
  final $Res Function(_AnimeSearchResult) _then;

/// Create a copy of AnimeSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceId = null,Object? source = null,Object? title = null,Object? titleJapanese = freezed,Object? synopsis = freezed,Object? coverImageUrl = freezed,Object? totalEpisodes = freezed,Object? genres = freezed,Object? communityScore = freezed,Object? airingStatus = freezed,}) {
  return _then(_AnimeSearchResult(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as int,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as AnimeSource,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,titleJapanese: freezed == titleJapanese ? _self.titleJapanese : titleJapanese // ignore: cast_nullable_to_non_nullable
as String?,synopsis: freezed == synopsis ? _self.synopsis : synopsis // ignore: cast_nullable_to_non_nullable
as String?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,totalEpisodes: freezed == totalEpisodes ? _self.totalEpisodes : totalEpisodes // ignore: cast_nullable_to_non_nullable
as int?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as String?,communityScore: freezed == communityScore ? _self.communityScore : communityScore // ignore: cast_nullable_to_non_nullable
as double?,airingStatus: freezed == airingStatus ? _self.airingStatus : airingStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
