// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CourseState {

 List<CoursesModel>? get course; List<SocialAccountsModel>? get social; CourseStatus get status;
/// Create a copy of CourseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseStateCopyWith<CourseState> get copyWith => _$CourseStateCopyWithImpl<CourseState>(this as CourseState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseState&&const DeepCollectionEquality().equals(other.course, course)&&const DeepCollectionEquality().equals(other.social, social)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(course),const DeepCollectionEquality().hash(social),status);

@override
String toString() {
  return 'CourseState(course: $course, social: $social, status: $status)';
}


}

/// @nodoc
abstract mixin class $CourseStateCopyWith<$Res>  {
  factory $CourseStateCopyWith(CourseState value, $Res Function(CourseState) _then) = _$CourseStateCopyWithImpl;
@useResult
$Res call({
 List<CoursesModel>? course, List<SocialAccountsModel>? social, CourseStatus status
});




}
/// @nodoc
class _$CourseStateCopyWithImpl<$Res>
    implements $CourseStateCopyWith<$Res> {
  _$CourseStateCopyWithImpl(this._self, this._then);

  final CourseState _self;
  final $Res Function(CourseState) _then;

/// Create a copy of CourseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? course = freezed,Object? social = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
course: freezed == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as List<CoursesModel>?,social: freezed == social ? _self.social : social // ignore: cast_nullable_to_non_nullable
as List<SocialAccountsModel>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CourseStatus,
  ));
}

}


/// @nodoc


class _CourseState implements CourseState {
  const _CourseState({required final  List<CoursesModel>? course, required final  List<SocialAccountsModel>? social, required this.status}): _course = course,_social = social;
  

 final  List<CoursesModel>? _course;
@override List<CoursesModel>? get course {
  final value = _course;
  if (value == null) return null;
  if (_course is EqualUnmodifiableListView) return _course;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<SocialAccountsModel>? _social;
@override List<SocialAccountsModel>? get social {
  final value = _social;
  if (value == null) return null;
  if (_social is EqualUnmodifiableListView) return _social;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  CourseStatus status;

/// Create a copy of CourseState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseStateCopyWith<_CourseState> get copyWith => __$CourseStateCopyWithImpl<_CourseState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseState&&const DeepCollectionEquality().equals(other._course, _course)&&const DeepCollectionEquality().equals(other._social, _social)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_course),const DeepCollectionEquality().hash(_social),status);

@override
String toString() {
  return 'CourseState(course: $course, social: $social, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CourseStateCopyWith<$Res> implements $CourseStateCopyWith<$Res> {
  factory _$CourseStateCopyWith(_CourseState value, $Res Function(_CourseState) _then) = __$CourseStateCopyWithImpl;
@override @useResult
$Res call({
 List<CoursesModel>? course, List<SocialAccountsModel>? social, CourseStatus status
});




}
/// @nodoc
class __$CourseStateCopyWithImpl<$Res>
    implements _$CourseStateCopyWith<$Res> {
  __$CourseStateCopyWithImpl(this._self, this._then);

  final _CourseState _self;
  final $Res Function(_CourseState) _then;

/// Create a copy of CourseState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? course = freezed,Object? social = freezed,Object? status = null,}) {
  return _then(_CourseState(
course: freezed == course ? _self._course : course // ignore: cast_nullable_to_non_nullable
as List<CoursesModel>?,social: freezed == social ? _self._social : social // ignore: cast_nullable_to_non_nullable
as List<SocialAccountsModel>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CourseStatus,
  ));
}


}

// dart format on
