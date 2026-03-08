// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jikan_anime_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JikanAnimeDto {

@JsonKey(name: 'mal_id') int get malId; String get title;@JsonKey(name: 'title_japanese') String? get titleJapanese; String? get synopsis; JikanAnimeImagesDto? get images; int? get episodes; List<JikanGenreDto>? get genres; double? get score; String? get status;
/// Create a copy of JikanAnimeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JikanAnimeDtoCopyWith<JikanAnimeDto> get copyWith => _$JikanAnimeDtoCopyWithImpl<JikanAnimeDto>(this as JikanAnimeDto, _$identity);

  /// Serializes this JikanAnimeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JikanAnimeDto&&(identical(other.malId, malId) || other.malId == malId)&&(identical(other.title, title) || other.title == title)&&(identical(other.titleJapanese, titleJapanese) || other.titleJapanese == titleJapanese)&&(identical(other.synopsis, synopsis) || other.synopsis == synopsis)&&(identical(other.images, images) || other.images == images)&&(identical(other.episodes, episodes) || other.episodes == episodes)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.score, score) || other.score == score)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,malId,title,titleJapanese,synopsis,images,episodes,const DeepCollectionEquality().hash(genres),score,status);

@override
String toString() {
  return 'JikanAnimeDto(malId: $malId, title: $title, titleJapanese: $titleJapanese, synopsis: $synopsis, images: $images, episodes: $episodes, genres: $genres, score: $score, status: $status)';
}


}

/// @nodoc
abstract mixin class $JikanAnimeDtoCopyWith<$Res>  {
  factory $JikanAnimeDtoCopyWith(JikanAnimeDto value, $Res Function(JikanAnimeDto) _then) = _$JikanAnimeDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'mal_id') int malId, String title,@JsonKey(name: 'title_japanese') String? titleJapanese, String? synopsis, JikanAnimeImagesDto? images, int? episodes, List<JikanGenreDto>? genres, double? score, String? status
});


$JikanAnimeImagesDtoCopyWith<$Res>? get images;

}
/// @nodoc
class _$JikanAnimeDtoCopyWithImpl<$Res>
    implements $JikanAnimeDtoCopyWith<$Res> {
  _$JikanAnimeDtoCopyWithImpl(this._self, this._then);

  final JikanAnimeDto _self;
  final $Res Function(JikanAnimeDto) _then;

/// Create a copy of JikanAnimeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? malId = null,Object? title = null,Object? titleJapanese = freezed,Object? synopsis = freezed,Object? images = freezed,Object? episodes = freezed,Object? genres = freezed,Object? score = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
malId: null == malId ? _self.malId : malId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,titleJapanese: freezed == titleJapanese ? _self.titleJapanese : titleJapanese // ignore: cast_nullable_to_non_nullable
as String?,synopsis: freezed == synopsis ? _self.synopsis : synopsis // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as JikanAnimeImagesDto?,episodes: freezed == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as int?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<JikanGenreDto>?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of JikanAnimeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JikanAnimeImagesDtoCopyWith<$Res>? get images {
    if (_self.images == null) {
    return null;
  }

  return $JikanAnimeImagesDtoCopyWith<$Res>(_self.images!, (value) {
    return _then(_self.copyWith(images: value));
  });
}
}


/// Adds pattern-matching-related methods to [JikanAnimeDto].
extension JikanAnimeDtoPatterns on JikanAnimeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JikanAnimeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JikanAnimeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JikanAnimeDto value)  $default,){
final _that = this;
switch (_that) {
case _JikanAnimeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JikanAnimeDto value)?  $default,){
final _that = this;
switch (_that) {
case _JikanAnimeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'mal_id')  int malId,  String title, @JsonKey(name: 'title_japanese')  String? titleJapanese,  String? synopsis,  JikanAnimeImagesDto? images,  int? episodes,  List<JikanGenreDto>? genres,  double? score,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JikanAnimeDto() when $default != null:
return $default(_that.malId,_that.title,_that.titleJapanese,_that.synopsis,_that.images,_that.episodes,_that.genres,_that.score,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'mal_id')  int malId,  String title, @JsonKey(name: 'title_japanese')  String? titleJapanese,  String? synopsis,  JikanAnimeImagesDto? images,  int? episodes,  List<JikanGenreDto>? genres,  double? score,  String? status)  $default,) {final _that = this;
switch (_that) {
case _JikanAnimeDto():
return $default(_that.malId,_that.title,_that.titleJapanese,_that.synopsis,_that.images,_that.episodes,_that.genres,_that.score,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'mal_id')  int malId,  String title, @JsonKey(name: 'title_japanese')  String? titleJapanese,  String? synopsis,  JikanAnimeImagesDto? images,  int? episodes,  List<JikanGenreDto>? genres,  double? score,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _JikanAnimeDto() when $default != null:
return $default(_that.malId,_that.title,_that.titleJapanese,_that.synopsis,_that.images,_that.episodes,_that.genres,_that.score,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JikanAnimeDto implements JikanAnimeDto {
  const _JikanAnimeDto({@JsonKey(name: 'mal_id') required this.malId, required this.title, @JsonKey(name: 'title_japanese') this.titleJapanese, this.synopsis, this.images, this.episodes, final  List<JikanGenreDto>? genres, this.score, this.status}): _genres = genres;
  factory _JikanAnimeDto.fromJson(Map<String, dynamic> json) => _$JikanAnimeDtoFromJson(json);

@override@JsonKey(name: 'mal_id') final  int malId;
@override final  String title;
@override@JsonKey(name: 'title_japanese') final  String? titleJapanese;
@override final  String? synopsis;
@override final  JikanAnimeImagesDto? images;
@override final  int? episodes;
 final  List<JikanGenreDto>? _genres;
@override List<JikanGenreDto>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double? score;
@override final  String? status;

/// Create a copy of JikanAnimeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JikanAnimeDtoCopyWith<_JikanAnimeDto> get copyWith => __$JikanAnimeDtoCopyWithImpl<_JikanAnimeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JikanAnimeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JikanAnimeDto&&(identical(other.malId, malId) || other.malId == malId)&&(identical(other.title, title) || other.title == title)&&(identical(other.titleJapanese, titleJapanese) || other.titleJapanese == titleJapanese)&&(identical(other.synopsis, synopsis) || other.synopsis == synopsis)&&(identical(other.images, images) || other.images == images)&&(identical(other.episodes, episodes) || other.episodes == episodes)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.score, score) || other.score == score)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,malId,title,titleJapanese,synopsis,images,episodes,const DeepCollectionEquality().hash(_genres),score,status);

@override
String toString() {
  return 'JikanAnimeDto(malId: $malId, title: $title, titleJapanese: $titleJapanese, synopsis: $synopsis, images: $images, episodes: $episodes, genres: $genres, score: $score, status: $status)';
}


}

/// @nodoc
abstract mixin class _$JikanAnimeDtoCopyWith<$Res> implements $JikanAnimeDtoCopyWith<$Res> {
  factory _$JikanAnimeDtoCopyWith(_JikanAnimeDto value, $Res Function(_JikanAnimeDto) _then) = __$JikanAnimeDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'mal_id') int malId, String title,@JsonKey(name: 'title_japanese') String? titleJapanese, String? synopsis, JikanAnimeImagesDto? images, int? episodes, List<JikanGenreDto>? genres, double? score, String? status
});


@override $JikanAnimeImagesDtoCopyWith<$Res>? get images;

}
/// @nodoc
class __$JikanAnimeDtoCopyWithImpl<$Res>
    implements _$JikanAnimeDtoCopyWith<$Res> {
  __$JikanAnimeDtoCopyWithImpl(this._self, this._then);

  final _JikanAnimeDto _self;
  final $Res Function(_JikanAnimeDto) _then;

/// Create a copy of JikanAnimeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? malId = null,Object? title = null,Object? titleJapanese = freezed,Object? synopsis = freezed,Object? images = freezed,Object? episodes = freezed,Object? genres = freezed,Object? score = freezed,Object? status = freezed,}) {
  return _then(_JikanAnimeDto(
malId: null == malId ? _self.malId : malId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,titleJapanese: freezed == titleJapanese ? _self.titleJapanese : titleJapanese // ignore: cast_nullable_to_non_nullable
as String?,synopsis: freezed == synopsis ? _self.synopsis : synopsis // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as JikanAnimeImagesDto?,episodes: freezed == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as int?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<JikanGenreDto>?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of JikanAnimeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JikanAnimeImagesDtoCopyWith<$Res>? get images {
    if (_self.images == null) {
    return null;
  }

  return $JikanAnimeImagesDtoCopyWith<$Res>(_self.images!, (value) {
    return _then(_self.copyWith(images: value));
  });
}
}


/// @nodoc
mixin _$JikanAnimeImagesDto {

 JikanImageJpgDto get jpg;
/// Create a copy of JikanAnimeImagesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JikanAnimeImagesDtoCopyWith<JikanAnimeImagesDto> get copyWith => _$JikanAnimeImagesDtoCopyWithImpl<JikanAnimeImagesDto>(this as JikanAnimeImagesDto, _$identity);

  /// Serializes this JikanAnimeImagesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JikanAnimeImagesDto&&(identical(other.jpg, jpg) || other.jpg == jpg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jpg);

@override
String toString() {
  return 'JikanAnimeImagesDto(jpg: $jpg)';
}


}

/// @nodoc
abstract mixin class $JikanAnimeImagesDtoCopyWith<$Res>  {
  factory $JikanAnimeImagesDtoCopyWith(JikanAnimeImagesDto value, $Res Function(JikanAnimeImagesDto) _then) = _$JikanAnimeImagesDtoCopyWithImpl;
@useResult
$Res call({
 JikanImageJpgDto jpg
});


$JikanImageJpgDtoCopyWith<$Res> get jpg;

}
/// @nodoc
class _$JikanAnimeImagesDtoCopyWithImpl<$Res>
    implements $JikanAnimeImagesDtoCopyWith<$Res> {
  _$JikanAnimeImagesDtoCopyWithImpl(this._self, this._then);

  final JikanAnimeImagesDto _self;
  final $Res Function(JikanAnimeImagesDto) _then;

/// Create a copy of JikanAnimeImagesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jpg = null,}) {
  return _then(_self.copyWith(
jpg: null == jpg ? _self.jpg : jpg // ignore: cast_nullable_to_non_nullable
as JikanImageJpgDto,
  ));
}
/// Create a copy of JikanAnimeImagesDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JikanImageJpgDtoCopyWith<$Res> get jpg {
  
  return $JikanImageJpgDtoCopyWith<$Res>(_self.jpg, (value) {
    return _then(_self.copyWith(jpg: value));
  });
}
}


/// Adds pattern-matching-related methods to [JikanAnimeImagesDto].
extension JikanAnimeImagesDtoPatterns on JikanAnimeImagesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JikanAnimeImagesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JikanAnimeImagesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JikanAnimeImagesDto value)  $default,){
final _that = this;
switch (_that) {
case _JikanAnimeImagesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JikanAnimeImagesDto value)?  $default,){
final _that = this;
switch (_that) {
case _JikanAnimeImagesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( JikanImageJpgDto jpg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JikanAnimeImagesDto() when $default != null:
return $default(_that.jpg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( JikanImageJpgDto jpg)  $default,) {final _that = this;
switch (_that) {
case _JikanAnimeImagesDto():
return $default(_that.jpg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( JikanImageJpgDto jpg)?  $default,) {final _that = this;
switch (_that) {
case _JikanAnimeImagesDto() when $default != null:
return $default(_that.jpg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JikanAnimeImagesDto implements JikanAnimeImagesDto {
  const _JikanAnimeImagesDto({required this.jpg});
  factory _JikanAnimeImagesDto.fromJson(Map<String, dynamic> json) => _$JikanAnimeImagesDtoFromJson(json);

@override final  JikanImageJpgDto jpg;

/// Create a copy of JikanAnimeImagesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JikanAnimeImagesDtoCopyWith<_JikanAnimeImagesDto> get copyWith => __$JikanAnimeImagesDtoCopyWithImpl<_JikanAnimeImagesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JikanAnimeImagesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JikanAnimeImagesDto&&(identical(other.jpg, jpg) || other.jpg == jpg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jpg);

@override
String toString() {
  return 'JikanAnimeImagesDto(jpg: $jpg)';
}


}

/// @nodoc
abstract mixin class _$JikanAnimeImagesDtoCopyWith<$Res> implements $JikanAnimeImagesDtoCopyWith<$Res> {
  factory _$JikanAnimeImagesDtoCopyWith(_JikanAnimeImagesDto value, $Res Function(_JikanAnimeImagesDto) _then) = __$JikanAnimeImagesDtoCopyWithImpl;
@override @useResult
$Res call({
 JikanImageJpgDto jpg
});


@override $JikanImageJpgDtoCopyWith<$Res> get jpg;

}
/// @nodoc
class __$JikanAnimeImagesDtoCopyWithImpl<$Res>
    implements _$JikanAnimeImagesDtoCopyWith<$Res> {
  __$JikanAnimeImagesDtoCopyWithImpl(this._self, this._then);

  final _JikanAnimeImagesDto _self;
  final $Res Function(_JikanAnimeImagesDto) _then;

/// Create a copy of JikanAnimeImagesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jpg = null,}) {
  return _then(_JikanAnimeImagesDto(
jpg: null == jpg ? _self.jpg : jpg // ignore: cast_nullable_to_non_nullable
as JikanImageJpgDto,
  ));
}

/// Create a copy of JikanAnimeImagesDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JikanImageJpgDtoCopyWith<$Res> get jpg {
  
  return $JikanImageJpgDtoCopyWith<$Res>(_self.jpg, (value) {
    return _then(_self.copyWith(jpg: value));
  });
}
}


/// @nodoc
mixin _$JikanImageJpgDto {

@JsonKey(name: 'large_image_url') String? get largeImageUrl;
/// Create a copy of JikanImageJpgDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JikanImageJpgDtoCopyWith<JikanImageJpgDto> get copyWith => _$JikanImageJpgDtoCopyWithImpl<JikanImageJpgDto>(this as JikanImageJpgDto, _$identity);

  /// Serializes this JikanImageJpgDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JikanImageJpgDto&&(identical(other.largeImageUrl, largeImageUrl) || other.largeImageUrl == largeImageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,largeImageUrl);

@override
String toString() {
  return 'JikanImageJpgDto(largeImageUrl: $largeImageUrl)';
}


}

/// @nodoc
abstract mixin class $JikanImageJpgDtoCopyWith<$Res>  {
  factory $JikanImageJpgDtoCopyWith(JikanImageJpgDto value, $Res Function(JikanImageJpgDto) _then) = _$JikanImageJpgDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'large_image_url') String? largeImageUrl
});




}
/// @nodoc
class _$JikanImageJpgDtoCopyWithImpl<$Res>
    implements $JikanImageJpgDtoCopyWith<$Res> {
  _$JikanImageJpgDtoCopyWithImpl(this._self, this._then);

  final JikanImageJpgDto _self;
  final $Res Function(JikanImageJpgDto) _then;

/// Create a copy of JikanImageJpgDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? largeImageUrl = freezed,}) {
  return _then(_self.copyWith(
largeImageUrl: freezed == largeImageUrl ? _self.largeImageUrl : largeImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [JikanImageJpgDto].
extension JikanImageJpgDtoPatterns on JikanImageJpgDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JikanImageJpgDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JikanImageJpgDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JikanImageJpgDto value)  $default,){
final _that = this;
switch (_that) {
case _JikanImageJpgDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JikanImageJpgDto value)?  $default,){
final _that = this;
switch (_that) {
case _JikanImageJpgDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'large_image_url')  String? largeImageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JikanImageJpgDto() when $default != null:
return $default(_that.largeImageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'large_image_url')  String? largeImageUrl)  $default,) {final _that = this;
switch (_that) {
case _JikanImageJpgDto():
return $default(_that.largeImageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'large_image_url')  String? largeImageUrl)?  $default,) {final _that = this;
switch (_that) {
case _JikanImageJpgDto() when $default != null:
return $default(_that.largeImageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JikanImageJpgDto implements JikanImageJpgDto {
  const _JikanImageJpgDto({@JsonKey(name: 'large_image_url') this.largeImageUrl});
  factory _JikanImageJpgDto.fromJson(Map<String, dynamic> json) => _$JikanImageJpgDtoFromJson(json);

@override@JsonKey(name: 'large_image_url') final  String? largeImageUrl;

/// Create a copy of JikanImageJpgDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JikanImageJpgDtoCopyWith<_JikanImageJpgDto> get copyWith => __$JikanImageJpgDtoCopyWithImpl<_JikanImageJpgDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JikanImageJpgDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JikanImageJpgDto&&(identical(other.largeImageUrl, largeImageUrl) || other.largeImageUrl == largeImageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,largeImageUrl);

@override
String toString() {
  return 'JikanImageJpgDto(largeImageUrl: $largeImageUrl)';
}


}

/// @nodoc
abstract mixin class _$JikanImageJpgDtoCopyWith<$Res> implements $JikanImageJpgDtoCopyWith<$Res> {
  factory _$JikanImageJpgDtoCopyWith(_JikanImageJpgDto value, $Res Function(_JikanImageJpgDto) _then) = __$JikanImageJpgDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'large_image_url') String? largeImageUrl
});




}
/// @nodoc
class __$JikanImageJpgDtoCopyWithImpl<$Res>
    implements _$JikanImageJpgDtoCopyWith<$Res> {
  __$JikanImageJpgDtoCopyWithImpl(this._self, this._then);

  final _JikanImageJpgDto _self;
  final $Res Function(_JikanImageJpgDto) _then;

/// Create a copy of JikanImageJpgDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? largeImageUrl = freezed,}) {
  return _then(_JikanImageJpgDto(
largeImageUrl: freezed == largeImageUrl ? _self.largeImageUrl : largeImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$JikanGenreDto {

 String get name;
/// Create a copy of JikanGenreDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JikanGenreDtoCopyWith<JikanGenreDto> get copyWith => _$JikanGenreDtoCopyWithImpl<JikanGenreDto>(this as JikanGenreDto, _$identity);

  /// Serializes this JikanGenreDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JikanGenreDto&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'JikanGenreDto(name: $name)';
}


}

/// @nodoc
abstract mixin class $JikanGenreDtoCopyWith<$Res>  {
  factory $JikanGenreDtoCopyWith(JikanGenreDto value, $Res Function(JikanGenreDto) _then) = _$JikanGenreDtoCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$JikanGenreDtoCopyWithImpl<$Res>
    implements $JikanGenreDtoCopyWith<$Res> {
  _$JikanGenreDtoCopyWithImpl(this._self, this._then);

  final JikanGenreDto _self;
  final $Res Function(JikanGenreDto) _then;

/// Create a copy of JikanGenreDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JikanGenreDto].
extension JikanGenreDtoPatterns on JikanGenreDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JikanGenreDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JikanGenreDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JikanGenreDto value)  $default,){
final _that = this;
switch (_that) {
case _JikanGenreDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JikanGenreDto value)?  $default,){
final _that = this;
switch (_that) {
case _JikanGenreDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JikanGenreDto() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _JikanGenreDto():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _JikanGenreDto() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JikanGenreDto implements JikanGenreDto {
  const _JikanGenreDto({required this.name});
  factory _JikanGenreDto.fromJson(Map<String, dynamic> json) => _$JikanGenreDtoFromJson(json);

@override final  String name;

/// Create a copy of JikanGenreDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JikanGenreDtoCopyWith<_JikanGenreDto> get copyWith => __$JikanGenreDtoCopyWithImpl<_JikanGenreDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JikanGenreDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JikanGenreDto&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'JikanGenreDto(name: $name)';
}


}

/// @nodoc
abstract mixin class _$JikanGenreDtoCopyWith<$Res> implements $JikanGenreDtoCopyWith<$Res> {
  factory _$JikanGenreDtoCopyWith(_JikanGenreDto value, $Res Function(_JikanGenreDto) _then) = __$JikanGenreDtoCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$JikanGenreDtoCopyWithImpl<$Res>
    implements _$JikanGenreDtoCopyWith<$Res> {
  __$JikanGenreDtoCopyWithImpl(this._self, this._then);

  final _JikanGenreDto _self;
  final $Res Function(_JikanGenreDto) _then;

/// Create a copy of JikanGenreDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_JikanGenreDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
