// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'browse_airports_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BrowseAirportsState {

 Data get status; String get message; List<Airport> get airports; String get query; Filter get filter;
/// Create a copy of BrowseAirportsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrowseAirportsStateCopyWith<BrowseAirportsState> get copyWith => _$BrowseAirportsStateCopyWithImpl<BrowseAirportsState>(this as BrowseAirportsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrowseAirportsState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.airports, airports)&&(identical(other.query, query) || other.query == query)&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(airports),query,filter);

@override
String toString() {
  return 'BrowseAirportsState(status: $status, message: $message, airports: $airports, query: $query, filter: $filter)';
}


}

/// @nodoc
abstract mixin class $BrowseAirportsStateCopyWith<$Res>  {
  factory $BrowseAirportsStateCopyWith(BrowseAirportsState value, $Res Function(BrowseAirportsState) _then) = _$BrowseAirportsStateCopyWithImpl;
@useResult
$Res call({
 Data status, String message, List<Airport> airports, String query, Filter filter
});




}
/// @nodoc
class _$BrowseAirportsStateCopyWithImpl<$Res>
    implements $BrowseAirportsStateCopyWith<$Res> {
  _$BrowseAirportsStateCopyWithImpl(this._self, this._then);

  final BrowseAirportsState _self;
  final $Res Function(BrowseAirportsState) _then;

/// Create a copy of BrowseAirportsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? airports = null,Object? query = null,Object? filter = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,airports: null == airports ? _self.airports : airports // ignore: cast_nullable_to_non_nullable
as List<Airport>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Filter,
  ));
}

}


/// @nodoc


class _BrowseAirportsState implements BrowseAirportsState {
  const _BrowseAirportsState({required this.status, required this.message, required final  List<Airport> airports, this.query = '', this.filter = Filter.all}): _airports = airports;
  

@override final  Data status;
@override final  String message;
 final  List<Airport> _airports;
@override List<Airport> get airports {
  if (_airports is EqualUnmodifiableListView) return _airports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_airports);
}

@override@JsonKey() final  String query;
@override@JsonKey() final  Filter filter;

/// Create a copy of BrowseAirportsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrowseAirportsStateCopyWith<_BrowseAirportsState> get copyWith => __$BrowseAirportsStateCopyWithImpl<_BrowseAirportsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrowseAirportsState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._airports, _airports)&&(identical(other.query, query) || other.query == query)&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_airports),query,filter);

@override
String toString() {
  return 'BrowseAirportsState(status: $status, message: $message, airports: $airports, query: $query, filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$BrowseAirportsStateCopyWith<$Res> implements $BrowseAirportsStateCopyWith<$Res> {
  factory _$BrowseAirportsStateCopyWith(_BrowseAirportsState value, $Res Function(_BrowseAirportsState) _then) = __$BrowseAirportsStateCopyWithImpl;
@override @useResult
$Res call({
 Data status, String message, List<Airport> airports, String query, Filter filter
});




}
/// @nodoc
class __$BrowseAirportsStateCopyWithImpl<$Res>
    implements _$BrowseAirportsStateCopyWith<$Res> {
  __$BrowseAirportsStateCopyWithImpl(this._self, this._then);

  final _BrowseAirportsState _self;
  final $Res Function(_BrowseAirportsState) _then;

/// Create a copy of BrowseAirportsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? airports = null,Object? query = null,Object? filter = null,}) {
  return _then(_BrowseAirportsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,airports: null == airports ? _self._airports : airports // ignore: cast_nullable_to_non_nullable
as List<Airport>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Filter,
  ));
}


}

// dart format on
