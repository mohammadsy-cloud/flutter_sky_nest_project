// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'browse_hotels_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BrowseHotelsState {

 Data get status; String get statusMessage; List<Hotel> get hotels; Filter get currentFilter; bool get isNearby;
/// Create a copy of BrowseHotelsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrowseHotelsStateCopyWith<BrowseHotelsState> get copyWith => _$BrowseHotelsStateCopyWithImpl<BrowseHotelsState>(this as BrowseHotelsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrowseHotelsState&&(identical(other.status, status) || other.status == status)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&const DeepCollectionEquality().equals(other.hotels, hotels)&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter)&&(identical(other.isNearby, isNearby) || other.isNearby == isNearby));
}


@override
int get hashCode => Object.hash(runtimeType,status,statusMessage,const DeepCollectionEquality().hash(hotels),currentFilter,isNearby);

@override
String toString() {
  return 'BrowseHotelsState(status: $status, statusMessage: $statusMessage, hotels: $hotels, currentFilter: $currentFilter, isNearby: $isNearby)';
}


}

/// @nodoc
abstract mixin class $BrowseHotelsStateCopyWith<$Res>  {
  factory $BrowseHotelsStateCopyWith(BrowseHotelsState value, $Res Function(BrowseHotelsState) _then) = _$BrowseHotelsStateCopyWithImpl;
@useResult
$Res call({
 Data status, String statusMessage, List<Hotel> hotels, Filter currentFilter, bool isNearby
});




}
/// @nodoc
class _$BrowseHotelsStateCopyWithImpl<$Res>
    implements $BrowseHotelsStateCopyWith<$Res> {
  _$BrowseHotelsStateCopyWithImpl(this._self, this._then);

  final BrowseHotelsState _self;
  final $Res Function(BrowseHotelsState) _then;

/// Create a copy of BrowseHotelsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? statusMessage = null,Object? hotels = null,Object? currentFilter = null,Object? isNearby = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,statusMessage: null == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String,hotels: null == hotels ? _self.hotels : hotels // ignore: cast_nullable_to_non_nullable
as List<Hotel>,currentFilter: null == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as Filter,isNearby: null == isNearby ? _self.isNearby : isNearby // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _BrowseHotelsState implements BrowseHotelsState {
  const _BrowseHotelsState({required this.status, required this.statusMessage, required final  List<Hotel> hotels, required this.currentFilter, required this.isNearby}): _hotels = hotels;
  

@override final  Data status;
@override final  String statusMessage;
 final  List<Hotel> _hotels;
@override List<Hotel> get hotels {
  if (_hotels is EqualUnmodifiableListView) return _hotels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hotels);
}

@override final  Filter currentFilter;
@override final  bool isNearby;

/// Create a copy of BrowseHotelsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrowseHotelsStateCopyWith<_BrowseHotelsState> get copyWith => __$BrowseHotelsStateCopyWithImpl<_BrowseHotelsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrowseHotelsState&&(identical(other.status, status) || other.status == status)&&(identical(other.statusMessage, statusMessage) || other.statusMessage == statusMessage)&&const DeepCollectionEquality().equals(other._hotels, _hotels)&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter)&&(identical(other.isNearby, isNearby) || other.isNearby == isNearby));
}


@override
int get hashCode => Object.hash(runtimeType,status,statusMessage,const DeepCollectionEquality().hash(_hotels),currentFilter,isNearby);

@override
String toString() {
  return 'BrowseHotelsState(status: $status, statusMessage: $statusMessage, hotels: $hotels, currentFilter: $currentFilter, isNearby: $isNearby)';
}


}

/// @nodoc
abstract mixin class _$BrowseHotelsStateCopyWith<$Res> implements $BrowseHotelsStateCopyWith<$Res> {
  factory _$BrowseHotelsStateCopyWith(_BrowseHotelsState value, $Res Function(_BrowseHotelsState) _then) = __$BrowseHotelsStateCopyWithImpl;
@override @useResult
$Res call({
 Data status, String statusMessage, List<Hotel> hotels, Filter currentFilter, bool isNearby
});




}
/// @nodoc
class __$BrowseHotelsStateCopyWithImpl<$Res>
    implements _$BrowseHotelsStateCopyWith<$Res> {
  __$BrowseHotelsStateCopyWithImpl(this._self, this._then);

  final _BrowseHotelsState _self;
  final $Res Function(_BrowseHotelsState) _then;

/// Create a copy of BrowseHotelsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? statusMessage = null,Object? hotels = null,Object? currentFilter = null,Object? isNearby = null,}) {
  return _then(_BrowseHotelsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Data,statusMessage: null == statusMessage ? _self.statusMessage : statusMessage // ignore: cast_nullable_to_non_nullable
as String,hotels: null == hotels ? _self._hotels : hotels // ignore: cast_nullable_to_non_nullable
as List<Hotel>,currentFilter: null == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as Filter,isNearby: null == isNearby ? _self.isNearby : isNearby // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
