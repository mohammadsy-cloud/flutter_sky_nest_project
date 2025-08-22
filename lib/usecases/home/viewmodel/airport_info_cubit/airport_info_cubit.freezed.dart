// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airport_info_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AirportInfoState {

 Data get status; String get message; Airport get airport; List<Flight> get flights; String get startPoint; String get endPoint;
/// Create a copy of AirportInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirportInfoStateCopyWith<AirportInfoState> get copyWith => _$AirportInfoStateCopyWithImpl<AirportInfoState>(this as AirportInfoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirportInfoState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.airport, airport) || other.airport == airport)&&const DeepCollectionEquality().equals(other.flights, flights)&&(identical(other.startPoint, startPoint) || other.startPoint == startPoint)&&(identical(other.endPoint, endPoint) || other.endPoint == endPoint));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,airport,const DeepCollectionEquality().hash(flights),startPoint,endPoint);

@override
String toString() {
  return 'AirportInfoState(status: $status, message: $message, airport: $airport, flights: $flights, startPoint: $startPoint, endPoint: $endPoint)';
}


}

/// @nodoc
abstract mixin class $AirportInfoStateCopyWith<$Res>  {
  factory $AirportInfoStateCopyWith(AirportInfoState value, $Res Function(AirportInfoState) _then) = _$AirportInfoStateCopyWithImpl;
@useResult
$Res call({
 Data status, String message, Airport airport, List<Flight> flights, String startPoint, String endPoint
});


$AirportCopyWith<$Res> get airport;

}
/// @nodoc
class _$AirportInfoStateCopyWithImpl<$Res>
    implements $AirportInfoStateCopyWith<$Res> {
  _$AirportInfoStateCopyWithImpl(this._self, this._then);

  final AirportInfoState _self;
  final $Res Function(AirportInfoState) _then;

/// Create a copy of AirportInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? airport = null,Object? flights = null,Object? startPoint = null,Object? endPoint = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,airport: null == airport ? _self.airport : airport // ignore: cast_nullable_to_non_nullable
as Airport,flights: null == flights ? _self.flights : flights // ignore: cast_nullable_to_non_nullable
as List<Flight>,startPoint: null == startPoint ? _self.startPoint : startPoint // ignore: cast_nullable_to_non_nullable
as String,endPoint: null == endPoint ? _self.endPoint : endPoint // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of AirportInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirportCopyWith<$Res> get airport {
  
  return $AirportCopyWith<$Res>(_self.airport, (value) {
    return _then(_self.copyWith(airport: value));
  });
}
}


/// @nodoc


class _AirportInfoState implements AirportInfoState {
  const _AirportInfoState({required this.status, required this.message, required this.airport, required final  List<Flight> flights, required this.startPoint, required this.endPoint}): _flights = flights;
  

@override final  Data status;
@override final  String message;
@override final  Airport airport;
 final  List<Flight> _flights;
@override List<Flight> get flights {
  if (_flights is EqualUnmodifiableListView) return _flights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flights);
}

@override final  String startPoint;
@override final  String endPoint;

/// Create a copy of AirportInfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirportInfoStateCopyWith<_AirportInfoState> get copyWith => __$AirportInfoStateCopyWithImpl<_AirportInfoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AirportInfoState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.airport, airport) || other.airport == airport)&&const DeepCollectionEquality().equals(other._flights, _flights)&&(identical(other.startPoint, startPoint) || other.startPoint == startPoint)&&(identical(other.endPoint, endPoint) || other.endPoint == endPoint));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,airport,const DeepCollectionEquality().hash(_flights),startPoint,endPoint);

@override
String toString() {
  return 'AirportInfoState(status: $status, message: $message, airport: $airport, flights: $flights, startPoint: $startPoint, endPoint: $endPoint)';
}


}

/// @nodoc
abstract mixin class _$AirportInfoStateCopyWith<$Res> implements $AirportInfoStateCopyWith<$Res> {
  factory _$AirportInfoStateCopyWith(_AirportInfoState value, $Res Function(_AirportInfoState) _then) = __$AirportInfoStateCopyWithImpl;
@override @useResult
$Res call({
 Data status, String message, Airport airport, List<Flight> flights, String startPoint, String endPoint
});


@override $AirportCopyWith<$Res> get airport;

}
/// @nodoc
class __$AirportInfoStateCopyWithImpl<$Res>
    implements _$AirportInfoStateCopyWith<$Res> {
  __$AirportInfoStateCopyWithImpl(this._self, this._then);

  final _AirportInfoState _self;
  final $Res Function(_AirportInfoState) _then;

/// Create a copy of AirportInfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? airport = null,Object? flights = null,Object? startPoint = null,Object? endPoint = null,}) {
  return _then(_AirportInfoState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,airport: null == airport ? _self.airport : airport // ignore: cast_nullable_to_non_nullable
as Airport,flights: null == flights ? _self._flights : flights // ignore: cast_nullable_to_non_nullable
as List<Flight>,startPoint: null == startPoint ? _self.startPoint : startPoint // ignore: cast_nullable_to_non_nullable
as String,endPoint: null == endPoint ? _self.endPoint : endPoint // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AirportInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirportCopyWith<$Res> get airport {
  
  return $AirportCopyWith<$Res>(_self.airport, (value) {
    return _then(_self.copyWith(airport: value));
  });
}
}

// dart format on
