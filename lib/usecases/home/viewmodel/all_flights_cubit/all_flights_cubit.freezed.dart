// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_flights_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AllFlightsState {

 Data get status; String get message; List<Flight> get flights; String get start; String get end; DateTime get date;
/// Create a copy of AllFlightsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllFlightsStateCopyWith<AllFlightsState> get copyWith => _$AllFlightsStateCopyWithImpl<AllFlightsState>(this as AllFlightsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllFlightsState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.flights, flights)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(flights),start,end,date);

@override
String toString() {
  return 'AllFlightsState(status: $status, message: $message, flights: $flights, start: $start, end: $end, date: $date)';
}


}

/// @nodoc
abstract mixin class $AllFlightsStateCopyWith<$Res>  {
  factory $AllFlightsStateCopyWith(AllFlightsState value, $Res Function(AllFlightsState) _then) = _$AllFlightsStateCopyWithImpl;
@useResult
$Res call({
 Data status, String message, List<Flight> flights, String start, String end, DateTime date
});




}
/// @nodoc
class _$AllFlightsStateCopyWithImpl<$Res>
    implements $AllFlightsStateCopyWith<$Res> {
  _$AllFlightsStateCopyWithImpl(this._self, this._then);

  final AllFlightsState _self;
  final $Res Function(AllFlightsState) _then;

/// Create a copy of AllFlightsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? flights = null,Object? start = null,Object? end = null,Object? date = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,flights: null == flights ? _self.flights : flights // ignore: cast_nullable_to_non_nullable
as List<Flight>,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc


class _AllFlightsState implements AllFlightsState {
  const _AllFlightsState({required this.status, required this.message, required final  List<Flight> flights, required this.start, required this.end, required this.date}): _flights = flights;
  

@override final  Data status;
@override final  String message;
 final  List<Flight> _flights;
@override List<Flight> get flights {
  if (_flights is EqualUnmodifiableListView) return _flights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flights);
}

@override final  String start;
@override final  String end;
@override final  DateTime date;

/// Create a copy of AllFlightsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AllFlightsStateCopyWith<_AllFlightsState> get copyWith => __$AllFlightsStateCopyWithImpl<_AllFlightsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AllFlightsState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._flights, _flights)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_flights),start,end,date);

@override
String toString() {
  return 'AllFlightsState(status: $status, message: $message, flights: $flights, start: $start, end: $end, date: $date)';
}


}

/// @nodoc
abstract mixin class _$AllFlightsStateCopyWith<$Res> implements $AllFlightsStateCopyWith<$Res> {
  factory _$AllFlightsStateCopyWith(_AllFlightsState value, $Res Function(_AllFlightsState) _then) = __$AllFlightsStateCopyWithImpl;
@override @useResult
$Res call({
 Data status, String message, List<Flight> flights, String start, String end, DateTime date
});




}
/// @nodoc
class __$AllFlightsStateCopyWithImpl<$Res>
    implements _$AllFlightsStateCopyWith<$Res> {
  __$AllFlightsStateCopyWithImpl(this._self, this._then);

  final _AllFlightsState _self;
  final $Res Function(_AllFlightsState) _then;

/// Create a copy of AllFlightsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? flights = null,Object? start = null,Object? end = null,Object? date = null,}) {
  return _then(_AllFlightsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,flights: null == flights ? _self._flights : flights // ignore: cast_nullable_to_non_nullable
as List<Flight>,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
