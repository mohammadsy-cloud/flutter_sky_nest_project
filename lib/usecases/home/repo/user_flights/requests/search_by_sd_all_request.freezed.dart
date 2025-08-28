// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_by_sd_all_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchBySdAllRequest {

@JsonKey(includeIfNull: false) String? get startPoint;@JsonKey(includeIfNull: false) String? get destination;
/// Create a copy of SearchBySdAllRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchBySdAllRequestCopyWith<SearchBySdAllRequest> get copyWith => _$SearchBySdAllRequestCopyWithImpl<SearchBySdAllRequest>(this as SearchBySdAllRequest, _$identity);

  /// Serializes this SearchBySdAllRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchBySdAllRequest&&(identical(other.startPoint, startPoint) || other.startPoint == startPoint)&&(identical(other.destination, destination) || other.destination == destination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startPoint,destination);

@override
String toString() {
  return 'SearchBySdAllRequest(startPoint: $startPoint, destination: $destination)';
}


}

/// @nodoc
abstract mixin class $SearchBySdAllRequestCopyWith<$Res>  {
  factory $SearchBySdAllRequestCopyWith(SearchBySdAllRequest value, $Res Function(SearchBySdAllRequest) _then) = _$SearchBySdAllRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? startPoint,@JsonKey(includeIfNull: false) String? destination
});




}
/// @nodoc
class _$SearchBySdAllRequestCopyWithImpl<$Res>
    implements $SearchBySdAllRequestCopyWith<$Res> {
  _$SearchBySdAllRequestCopyWithImpl(this._self, this._then);

  final SearchBySdAllRequest _self;
  final $Res Function(SearchBySdAllRequest) _then;

/// Create a copy of SearchBySdAllRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startPoint = freezed,Object? destination = freezed,}) {
  return _then(_self.copyWith(
startPoint: freezed == startPoint ? _self.startPoint : startPoint // ignore: cast_nullable_to_non_nullable
as String?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SearchBySdAllRequest implements SearchBySdAllRequest {
   _SearchBySdAllRequest({@JsonKey(includeIfNull: false) this.startPoint, @JsonKey(includeIfNull: false) this.destination});
  factory _SearchBySdAllRequest.fromJson(Map<String, dynamic> json) => _$SearchBySdAllRequestFromJson(json);

@override@JsonKey(includeIfNull: false) final  String? startPoint;
@override@JsonKey(includeIfNull: false) final  String? destination;

/// Create a copy of SearchBySdAllRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchBySdAllRequestCopyWith<_SearchBySdAllRequest> get copyWith => __$SearchBySdAllRequestCopyWithImpl<_SearchBySdAllRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchBySdAllRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchBySdAllRequest&&(identical(other.startPoint, startPoint) || other.startPoint == startPoint)&&(identical(other.destination, destination) || other.destination == destination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startPoint,destination);

@override
String toString() {
  return 'SearchBySdAllRequest(startPoint: $startPoint, destination: $destination)';
}


}

/// @nodoc
abstract mixin class _$SearchBySdAllRequestCopyWith<$Res> implements $SearchBySdAllRequestCopyWith<$Res> {
  factory _$SearchBySdAllRequestCopyWith(_SearchBySdAllRequest value, $Res Function(_SearchBySdAllRequest) _then) = __$SearchBySdAllRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? startPoint,@JsonKey(includeIfNull: false) String? destination
});




}
/// @nodoc
class __$SearchBySdAllRequestCopyWithImpl<$Res>
    implements _$SearchBySdAllRequestCopyWith<$Res> {
  __$SearchBySdAllRequestCopyWithImpl(this._self, this._then);

  final _SearchBySdAllRequest _self;
  final $Res Function(_SearchBySdAllRequest) _then;

/// Create a copy of SearchBySdAllRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startPoint = freezed,Object? destination = freezed,}) {
  return _then(_SearchBySdAllRequest(
startPoint: freezed == startPoint ? _self.startPoint : startPoint // ignore: cast_nullable_to_non_nullable
as String?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
