// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'show_all_rooms_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShowAllRoomsRequest {

 String get address;@DateOnlyConverter() DateTime get startDate;@DateOnlyConverter() DateTime get endDate;
/// Create a copy of ShowAllRoomsRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowAllRoomsRequestCopyWith<ShowAllRoomsRequest> get copyWith => _$ShowAllRoomsRequestCopyWithImpl<ShowAllRoomsRequest>(this as ShowAllRoomsRequest, _$identity);

  /// Serializes this ShowAllRoomsRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowAllRoomsRequest&&(identical(other.address, address) || other.address == address)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,startDate,endDate);

@override
String toString() {
  return 'ShowAllRoomsRequest(address: $address, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $ShowAllRoomsRequestCopyWith<$Res>  {
  factory $ShowAllRoomsRequestCopyWith(ShowAllRoomsRequest value, $Res Function(ShowAllRoomsRequest) _then) = _$ShowAllRoomsRequestCopyWithImpl;
@useResult
$Res call({
 String address,@DateOnlyConverter() DateTime startDate,@DateOnlyConverter() DateTime endDate
});




}
/// @nodoc
class _$ShowAllRoomsRequestCopyWithImpl<$Res>
    implements $ShowAllRoomsRequestCopyWith<$Res> {
  _$ShowAllRoomsRequestCopyWithImpl(this._self, this._then);

  final ShowAllRoomsRequest _self;
  final $Res Function(ShowAllRoomsRequest) _then;

/// Create a copy of ShowAllRoomsRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ShowAllRoomsRequest implements ShowAllRoomsRequest {
   _ShowAllRoomsRequest({required this.address, @DateOnlyConverter() required this.startDate, @DateOnlyConverter() required this.endDate});
  factory _ShowAllRoomsRequest.fromJson(Map<String, dynamic> json) => _$ShowAllRoomsRequestFromJson(json);

@override final  String address;
@override@DateOnlyConverter() final  DateTime startDate;
@override@DateOnlyConverter() final  DateTime endDate;

/// Create a copy of ShowAllRoomsRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShowAllRoomsRequestCopyWith<_ShowAllRoomsRequest> get copyWith => __$ShowAllRoomsRequestCopyWithImpl<_ShowAllRoomsRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShowAllRoomsRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowAllRoomsRequest&&(identical(other.address, address) || other.address == address)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,startDate,endDate);

@override
String toString() {
  return 'ShowAllRoomsRequest(address: $address, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$ShowAllRoomsRequestCopyWith<$Res> implements $ShowAllRoomsRequestCopyWith<$Res> {
  factory _$ShowAllRoomsRequestCopyWith(_ShowAllRoomsRequest value, $Res Function(_ShowAllRoomsRequest) _then) = __$ShowAllRoomsRequestCopyWithImpl;
@override @useResult
$Res call({
 String address,@DateOnlyConverter() DateTime startDate,@DateOnlyConverter() DateTime endDate
});




}
/// @nodoc
class __$ShowAllRoomsRequestCopyWithImpl<$Res>
    implements _$ShowAllRoomsRequestCopyWith<$Res> {
  __$ShowAllRoomsRequestCopyWithImpl(this._self, this._then);

  final _ShowAllRoomsRequest _self;
  final $Res Function(_ShowAllRoomsRequest) _then;

/// Create a copy of ShowAllRoomsRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_ShowAllRoomsRequest(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
