// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anilist_anime_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AniListAnimeDto {

 int get id; AniListTitleDto get title; String? get description; AniListCoverImageDto? get coverImage; int? get episodes; List<String>? get genres; int? get averageScore; String? get status;
/// Create a copy of AniListAnimeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AniListAnimeDtoCopyWith<AniListAnimeDto> get copyWith => _$AniListAnimeDtoCopyWithImpl<AniListAnimeDto>(this as AniListAnimeDto, _$identity);

  /// Serializes this AniListAnimeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AniListAnimeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&(identical(other.episodes, episodes) || other.episodes == episodes)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.averageScore, averageScore) || other.averageScore == averageScore)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,coverImage,episodes,const DeepCollectionEquality().hash(genres),averageScore,status);

@override
String toString() {
  return 'AniListAnimeDto(id: $id, title: $title, description: $description, coverImage: $coverImage, episodes: $episodes, genres: $genres, averageScore: $averageScore, status: $status)';
}


}

/// @nodoc
abstract mixin class $AniListAnimeDtoCopyWith<$Res>  {
  factory $AniListAnimeDtoCopyWith(AniListAnimeDto value, $Res Function(AniListAnimeDto) _then) = _$AniListAnimeDtoCopyWithImpl;
@useResult
$Res call({
 int id, AniListTitleDto title, String? description, AniListCoverImageDto? coverImage, int? episodes, List<String>? genres, int? averageScore, String? status
});


$AniListTitleDtoCopyWith<$Res> get title;$AniListCoverImageDtoCopyWith<$Res>? get coverImage;

}
/// @nodoc
class _$AniListAnimeDtoCopyWithImpl<$Res>
    implements $AniListAnimeDtoCopyWith<$Res> {
  _$AniListAnimeDtoCopyWithImpl(this._self, this._then);

  final AniListAnimeDto _self;
  final $Res Function(AniListAnimeDto) _then;

/// Create a copy of AniListAnimeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? coverImage = freezed,Object? episodes = freezed,Object? genres = freezed,Object? averageScore = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as AniListTitleDto,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as AniListCoverImageDto?,episodes: freezed == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as int?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,averageScore: freezed == averageScore ? _self.averageScore : averageScore // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AniListAnimeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AniListTitleDtoCopyWith<$Res> get title {
  
  return $AniListTitleDtoCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of AniListAnimeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AniListCoverImageDtoCopyWith<$Res>? get coverImage {
    if (_self.coverImage == null) {
    return null;
  }

  return $AniListCoverImageDtoCopyWith<$Res>(_self.coverImage!, (value) {
    return _then(_self.copyWith(coverImage: value));
  });
}
}


/// Adds pattern-matching-related methods to [AniListAnimeDto].
extension AniListAnimeDtoPatterns on AniListAnimeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AniListAnimeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AniListAnimeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AniListAnimeDto value)  $default,){
final _that = this;
switch (_that) {
case _AniListAnimeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AniListAnimeDto value)?  $default,){
final _that = this;
switch (_that) {
case _AniListAnimeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  AniListTitleDto title,  String? description,  AniListCoverImageDto? coverImage,  int? episodes,  List<String>? genres,  int? averageScore,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AniListAnimeDto() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.coverImage,_that.episodes,_that.genres,_that.averageScore,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  AniListTitleDto title,  String? description,  AniListCoverImageDto? coverImage,  int? episodes,  List<String>? genres,  int? averageScore,  String? status)  $default,) {final _that = this;
switch (_that) {
case _AniListAnimeDto():
return $default(_that.id,_that.title,_that.description,_that.coverImage,_that.episodes,_that.genres,_that.averageScore,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  AniListTitleDto title,  String? description,  AniListCoverImageDto? coverImage,  int? episodes,  List<String>? genres,  int? averageScore,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _AniListAnimeDto() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.coverImage,_that.episodes,_that.genres,_that.averageScore,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AniListAnimeDto implements AniListAnimeDto {
  const _AniListAnimeDto({required this.id, required this.title, this.description, this.coverImage, this.episodes, final  List<String>? genres, this.averageScore, this.status}): _genres = genres;
  factory _AniListAnimeDto.fromJson(Map<String, dynamic> json) => _$AniListAnimeDtoFromJson(json);

@override final  int id;
@override final  AniListTitleDto title;
@override final  String? description;
@override final  AniListCoverImageDto? coverImage;
@override final  int? episodes;
 final  List<String>? _genres;
@override List<String>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? averageScore;
@override final  String? status;

/// Create a copy of AniListAnimeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AniListAnimeDtoCopyWith<_AniListAnimeDto> get copyWith => __$AniListAnimeDtoCopyWithImpl<_AniListAnimeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AniListAnimeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AniListAnimeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&(identical(other.episodes, episodes) || other.episodes == episodes)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.averageScore, averageScore) || other.averageScore == averageScore)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,coverImage,episodes,const DeepCollectionEquality().hash(_genres),averageScore,status);

@override
String toString() {
  return 'AniListAnimeDto(id: $id, title: $title, description: $description, coverImage: $coverImage, episodes: $episodes, genres: $genres, averageScore: $averageScore, status: $status)';
}


}

/// @nodoc
abstract mixin class _$AniListAnimeDtoCopyWith<$Res> implements $AniListAnimeDtoCopyWith<$Res> {
  factory _$AniListAnimeDtoCopyWith(_AniListAnimeDto value, $Res Function(_AniListAnimeDto) _then) = __$AniListAnimeDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, AniListTitleDto title, String? description, AniListCoverImageDto? coverImage, int? episodes, List<String>? genres, int? averageScore, String? status
});


@override $AniListTitleDtoCopyWith<$Res> get title;@override $AniListCoverImageDtoCopyWith<$Res>? get coverImage;

}
/// @nodoc
class __$AniListAnimeDtoCopyWithImpl<$Res>
    implements _$AniListAnimeDtoCopyWith<$Res> {
  __$AniListAnimeDtoCopyWithImpl(this._self, this._then);

  final _AniListAnimeDto _self;
  final $Res Function(_AniListAnimeDto) _then;

/// Create a copy of AniListAnimeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? coverImage = freezed,Object? episodes = freezed,Object? genres = freezed,Object? averageScore = freezed,Object? status = freezed,}) {
  return _then(_AniListAnimeDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as AniListTitleDto,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as AniListCoverImageDto?,episodes: freezed == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as int?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,averageScore: freezed == averageScore ? _self.averageScore : averageScore // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AniListAnimeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AniListTitleDtoCopyWith<$Res> get title {
  
  return $AniListTitleDtoCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of AniListAnimeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AniListCoverImageDtoCopyWith<$Res>? get coverImage {
    if (_self.coverImage == null) {
    return null;
  }

  return $AniListCoverImageDtoCopyWith<$Res>(_self.coverImage!, (value) {
    return _then(_self.copyWith(coverImage: value));
  });
}
}


/// @nodoc
mixin _$AniListTitleDto {

 String? get romaji; String? get english; String? get native;
/// Create a copy of AniListTitleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AniListTitleDtoCopyWith<AniListTitleDto> get copyWith => _$AniListTitleDtoCopyWithImpl<AniListTitleDto>(this as AniListTitleDto, _$identity);

  /// Serializes this AniListTitleDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AniListTitleDto&&(identical(other.romaji, romaji) || other.romaji == romaji)&&(identical(other.english, english) || other.english == english)&&(identical(other.native, native) || other.native == native));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,romaji,english,native);

@override
String toString() {
  return 'AniListTitleDto(romaji: $romaji, english: $english, native: $native)';
}


}

/// @nodoc
abstract mixin class $AniListTitleDtoCopyWith<$Res>  {
  factory $AniListTitleDtoCopyWith(AniListTitleDto value, $Res Function(AniListTitleDto) _then) = _$AniListTitleDtoCopyWithImpl;
@useResult
$Res call({
 String? romaji, String? english, String? native
});




}
/// @nodoc
class _$AniListTitleDtoCopyWithImpl<$Res>
    implements $AniListTitleDtoCopyWith<$Res> {
  _$AniListTitleDtoCopyWithImpl(this._self, this._then);

  final AniListTitleDto _self;
  final $Res Function(AniListTitleDto) _then;

/// Create a copy of AniListTitleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? romaji = freezed,Object? english = freezed,Object? native = freezed,}) {
  return _then(_self.copyWith(
romaji: freezed == romaji ? _self.romaji : romaji // ignore: cast_nullable_to_non_nullable
as String?,english: freezed == english ? _self.english : english // ignore: cast_nullable_to_non_nullable
as String?,native: freezed == native ? _self.native : native // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AniListTitleDto].
extension AniListTitleDtoPatterns on AniListTitleDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AniListTitleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AniListTitleDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AniListTitleDto value)  $default,){
final _that = this;
switch (_that) {
case _AniListTitleDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AniListTitleDto value)?  $default,){
final _that = this;
switch (_that) {
case _AniListTitleDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? romaji,  String? english,  String? native)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AniListTitleDto() when $default != null:
return $default(_that.romaji,_that.english,_that.native);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? romaji,  String? english,  String? native)  $default,) {final _that = this;
switch (_that) {
case _AniListTitleDto():
return $default(_that.romaji,_that.english,_that.native);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? romaji,  String? english,  String? native)?  $default,) {final _that = this;
switch (_that) {
case _AniListTitleDto() when $default != null:
return $default(_that.romaji,_that.english,_that.native);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AniListTitleDto implements AniListTitleDto {
  const _AniListTitleDto({this.romaji, this.english, this.native});
  factory _AniListTitleDto.fromJson(Map<String, dynamic> json) => _$AniListTitleDtoFromJson(json);

@override final  String? romaji;
@override final  String? english;
@override final  String? native;

/// Create a copy of AniListTitleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AniListTitleDtoCopyWith<_AniListTitleDto> get copyWith => __$AniListTitleDtoCopyWithImpl<_AniListTitleDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AniListTitleDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AniListTitleDto&&(identical(other.romaji, romaji) || other.romaji == romaji)&&(identical(other.english, english) || other.english == english)&&(identical(other.native, native) || other.native == native));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,romaji,english,native);

@override
String toString() {
  return 'AniListTitleDto(romaji: $romaji, english: $english, native: $native)';
}


}

/// @nodoc
abstract mixin class _$AniListTitleDtoCopyWith<$Res> implements $AniListTitleDtoCopyWith<$Res> {
  factory _$AniListTitleDtoCopyWith(_AniListTitleDto value, $Res Function(_AniListTitleDto) _then) = __$AniListTitleDtoCopyWithImpl;
@override @useResult
$Res call({
 String? romaji, String? english, String? native
});




}
/// @nodoc
class __$AniListTitleDtoCopyWithImpl<$Res>
    implements _$AniListTitleDtoCopyWith<$Res> {
  __$AniListTitleDtoCopyWithImpl(this._self, this._then);

  final _AniListTitleDto _self;
  final $Res Function(_AniListTitleDto) _then;

/// Create a copy of AniListTitleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? romaji = freezed,Object? english = freezed,Object? native = freezed,}) {
  return _then(_AniListTitleDto(
romaji: freezed == romaji ? _self.romaji : romaji // ignore: cast_nullable_to_non_nullable
as String?,english: freezed == english ? _self.english : english // ignore: cast_nullable_to_non_nullable
as String?,native: freezed == native ? _self.native : native // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AniListCoverImageDto {

 String? get large;
/// Create a copy of AniListCoverImageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AniListCoverImageDtoCopyWith<AniListCoverImageDto> get copyWith => _$AniListCoverImageDtoCopyWithImpl<AniListCoverImageDto>(this as AniListCoverImageDto, _$identity);

  /// Serializes this AniListCoverImageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AniListCoverImageDto&&(identical(other.large, large) || other.large == large));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,large);

@override
String toString() {
  return 'AniListCoverImageDto(large: $large)';
}


}

/// @nodoc
abstract mixin class $AniListCoverImageDtoCopyWith<$Res>  {
  factory $AniListCoverImageDtoCopyWith(AniListCoverImageDto value, $Res Function(AniListCoverImageDto) _then) = _$AniListCoverImageDtoCopyWithImpl;
@useResult
$Res call({
 String? large
});




}
/// @nodoc
class _$AniListCoverImageDtoCopyWithImpl<$Res>
    implements $AniListCoverImageDtoCopyWith<$Res> {
  _$AniListCoverImageDtoCopyWithImpl(this._self, this._then);

  final AniListCoverImageDto _self;
  final $Res Function(AniListCoverImageDto) _then;

/// Create a copy of AniListCoverImageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? large = freezed,}) {
  return _then(_self.copyWith(
large: freezed == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AniListCoverImageDto].
extension AniListCoverImageDtoPatterns on AniListCoverImageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AniListCoverImageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AniListCoverImageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AniListCoverImageDto value)  $default,){
final _that = this;
switch (_that) {
case _AniListCoverImageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AniListCoverImageDto value)?  $default,){
final _that = this;
switch (_that) {
case _AniListCoverImageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? large)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AniListCoverImageDto() when $default != null:
return $default(_that.large);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? large)  $default,) {final _that = this;
switch (_that) {
case _AniListCoverImageDto():
return $default(_that.large);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? large)?  $default,) {final _that = this;
switch (_that) {
case _AniListCoverImageDto() when $default != null:
return $default(_that.large);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AniListCoverImageDto implements AniListCoverImageDto {
  const _AniListCoverImageDto({this.large});
  factory _AniListCoverImageDto.fromJson(Map<String, dynamic> json) => _$AniListCoverImageDtoFromJson(json);

@override final  String? large;

/// Create a copy of AniListCoverImageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AniListCoverImageDtoCopyWith<_AniListCoverImageDto> get copyWith => __$AniListCoverImageDtoCopyWithImpl<_AniListCoverImageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AniListCoverImageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AniListCoverImageDto&&(identical(other.large, large) || other.large == large));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,large);

@override
String toString() {
  return 'AniListCoverImageDto(large: $large)';
}


}

/// @nodoc
abstract mixin class _$AniListCoverImageDtoCopyWith<$Res> implements $AniListCoverImageDtoCopyWith<$Res> {
  factory _$AniListCoverImageDtoCopyWith(_AniListCoverImageDto value, $Res Function(_AniListCoverImageDto) _then) = __$AniListCoverImageDtoCopyWithImpl;
@override @useResult
$Res call({
 String? large
});




}
/// @nodoc
class __$AniListCoverImageDtoCopyWithImpl<$Res>
    implements _$AniListCoverImageDtoCopyWith<$Res> {
  __$AniListCoverImageDtoCopyWithImpl(this._self, this._then);

  final _AniListCoverImageDto _self;
  final $Res Function(_AniListCoverImageDto) _then;

/// Create a copy of AniListCoverImageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? large = freezed,}) {
  return _then(_AniListCoverImageDto(
large: freezed == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
