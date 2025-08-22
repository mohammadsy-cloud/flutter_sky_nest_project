// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_airport_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RateAirportRequest {

 int get airportId; int get stars; String get comment;
/// Create a copy of RateAirportRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateAirportRequestCopyWith<RateAirportRequest> get copyWith => _$RateAirportRequestCopyWithImpl<RateAirportRequest>(this as RateAirportRequest, _$identity);

  /// Serializes this RateAirportRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateAirportRequest&&(identical(other.airportId, airportId) || other.airportId == airportId)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,airportId,stars,comment);

@override
String toString() {
  return 'RateAirportRequest(airportId: $airportId, stars: $stars, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $RateAirportRequestCopyWith<$Res>  {
  factory $RateAirportRequestCopyWith(RateAirportRequest value, $Res Function(RateAirportRequest) _then) = _$RateAirportRequestCopyWithImpl;
@useResult
$Res call({
 int airportId, int stars, String comment
});




}
/// @nodoc
class _$RateAirportRequestCopyWithImpl<$Res>
    implements $RateAirportRequestCopyWith<$Res> {
  _$RateAirportRequestCopyWithImpl(this._self, this._then);

  final RateAirportRequest _self;
  final $Res Function(RateAirportRequest) _then;

/// Create a copy of RateAirportRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? airportId = null,Object? stars = null,Object? comment = null,}) {
  return _then(_self.copyWith(
airportId: null == airportId ? _self.airportId : airportId // ignore: cast_nullable_to_non_nullable
as int,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RateAirportRequest implements RateAirportRequest {
   _RateAirportRequest({required this.airportId, required this.stars, required this.comment});
  factory _RateAirportRequest.fromJson(Map<String, dynamic> json) => _$RateAirportRequestFromJson(json);

@override final  int airportId;
@override final  int stars;
@override final  String comment;

/// Create a copy of RateAirportRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RateAirportRequestCopyWith<_RateAirportRequest> get copyWith => __$RateAirportRequestCopyWithImpl<_RateAirportRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RateAirportRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RateAirportRequest&&(identical(other.airportId, airportId) || other.airportId == airportId)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,airportId,stars,comment);

@override
String toString() {
  return 'RateAirportRequest(airportId: $airportId, stars: $stars, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$RateAirportRequestCopyWith<$Res> implements $RateAirportRequestCopyWith<$Res> {
  factory _$RateAirportRequestCopyWith(_RateAirportRequest value, $Res Function(_RateAirportRequest) _then) = __$RateAirportRequestCopyWithImpl;
@override @useResult
$Res call({
 int airportId, int stars, String comment
});




}
/// @nodoc
class __$RateAirportRequestCopyWithImpl<$Res>
    implements _$RateAirportRequestCopyWith<$Res> {
  __$RateAirportRequestCopyWithImpl(this._self, this._then);

  final _RateAirportRequest _self;
  final $Res Function(_RateAirportRequest) _then;

/// Create a copy of RateAirportRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? airportId = null,Object? stars = null,Object? comment = null,}) {
  return _then(_RateAirportRequest(
airportId: null == airportId ? _self.airportId : airportId // ignore: cast_nullable_to_non_nullable
as int,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
