// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_flights_by_date_and_location_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchFlightsByDateAndLocationRequest {

 String get startPoint; String get destination;@DateOnlyConverter() DateTime get userDate;
/// Create a copy of SearchFlightsByDateAndLocationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchFlightsByDateAndLocationRequestCopyWith<SearchFlightsByDateAndLocationRequest> get copyWith => _$SearchFlightsByDateAndLocationRequestCopyWithImpl<SearchFlightsByDateAndLocationRequest>(this as SearchFlightsByDateAndLocationRequest, _$identity);

  /// Serializes this SearchFlightsByDateAndLocationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchFlightsByDateAndLocationRequest&&(identical(other.startPoint, startPoint) || other.startPoint == startPoint)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.userDate, userDate) || other.userDate == userDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startPoint,destination,userDate);

@override
String toString() {
  return 'SearchFlightsByDateAndLocationRequest(startPoint: $startPoint, destination: $destination, userDate: $userDate)';
}


}

/// @nodoc
abstract mixin class $SearchFlightsByDateAndLocationRequestCopyWith<$Res>  {
  factory $SearchFlightsByDateAndLocationRequestCopyWith(SearchFlightsByDateAndLocationRequest value, $Res Function(SearchFlightsByDateAndLocationRequest) _then) = _$SearchFlightsByDateAndLocationRequestCopyWithImpl;
@useResult
$Res call({
 String startPoint, String destination,@DateOnlyConverter() DateTime userDate
});




}
/// @nodoc
class _$SearchFlightsByDateAndLocationRequestCopyWithImpl<$Res>
    implements $SearchFlightsByDateAndLocationRequestCopyWith<$Res> {
  _$SearchFlightsByDateAndLocationRequestCopyWithImpl(this._self, this._then);

  final SearchFlightsByDateAndLocationRequest _self;
  final $Res Function(SearchFlightsByDateAndLocationRequest) _then;

/// Create a copy of SearchFlightsByDateAndLocationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startPoint = null,Object? destination = null,Object? userDate = null,}) {
  return _then(_self.copyWith(
startPoint: null == startPoint ? _self.startPoint : startPoint // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,userDate: null == userDate ? _self.userDate : userDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SearchFlightsByDateAndLocationRequest implements SearchFlightsByDateAndLocationRequest {
   _SearchFlightsByDateAndLocationRequest({required this.startPoint, required this.destination, @DateOnlyConverter() required this.userDate});
  factory _SearchFlightsByDateAndLocationRequest.fromJson(Map<String, dynamic> json) => _$SearchFlightsByDateAndLocationRequestFromJson(json);

@override final  String startPoint;
@override final  String destination;
@override@DateOnlyConverter() final  DateTime userDate;

/// Create a copy of SearchFlightsByDateAndLocationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchFlightsByDateAndLocationRequestCopyWith<_SearchFlightsByDateAndLocationRequest> get copyWith => __$SearchFlightsByDateAndLocationRequestCopyWithImpl<_SearchFlightsByDateAndLocationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchFlightsByDateAndLocationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchFlightsByDateAndLocationRequest&&(identical(other.startPoint, startPoint) || other.startPoint == startPoint)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.userDate, userDate) || other.userDate == userDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startPoint,destination,userDate);

@override
String toString() {
  return 'SearchFlightsByDateAndLocationRequest(startPoint: $startPoint, destination: $destination, userDate: $userDate)';
}


}

/// @nodoc
abstract mixin class _$SearchFlightsByDateAndLocationRequestCopyWith<$Res> implements $SearchFlightsByDateAndLocationRequestCopyWith<$Res> {
  factory _$SearchFlightsByDateAndLocationRequestCopyWith(_SearchFlightsByDateAndLocationRequest value, $Res Function(_SearchFlightsByDateAndLocationRequest) _then) = __$SearchFlightsByDateAndLocationRequestCopyWithImpl;
@override @useResult
$Res call({
 String startPoint, String destination,@DateOnlyConverter() DateTime userDate
});




}
/// @nodoc
class __$SearchFlightsByDateAndLocationRequestCopyWithImpl<$Res>
    implements _$SearchFlightsByDateAndLocationRequestCopyWith<$Res> {
  __$SearchFlightsByDateAndLocationRequestCopyWithImpl(this._self, this._then);

  final _SearchFlightsByDateAndLocationRequest _self;
  final $Res Function(_SearchFlightsByDateAndLocationRequest) _then;

/// Create a copy of SearchFlightsByDateAndLocationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startPoint = null,Object? destination = null,Object? userDate = null,}) {
  return _then(_SearchFlightsByDateAndLocationRequest(
startPoint: null == startPoint ? _self.startPoint : startPoint // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,userDate: null == userDate ? _self.userDate : userDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
