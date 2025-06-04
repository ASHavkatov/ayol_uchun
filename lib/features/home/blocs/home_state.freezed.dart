// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 List<CategoriesModel>? get category; List<CoursesModel>? get courses; List<SocialAccountsModel>? get social; List<InterviewModel>? get interview; UserModel? get user; HomeStatus get status;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&const DeepCollectionEquality().equals(other.category, category)&&const DeepCollectionEquality().equals(other.courses, courses)&&const DeepCollectionEquality().equals(other.social, social)&&const DeepCollectionEquality().equals(other.interview, interview)&&(identical(other.user, user) || other.user == user)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(category),const DeepCollectionEquality().hash(courses),const DeepCollectionEquality().hash(social),const DeepCollectionEquality().hash(interview),user,status);

@override
String toString() {
  return 'HomeState(category: $category, courses: $courses, social: $social, interview: $interview, user: $user, status: $status)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 List<CategoriesModel>? category, List<CoursesModel>? courses, List<SocialAccountsModel>? social, List<InterviewModel>? interview, UserModel? user, HomeStatus status
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = freezed,Object? courses = freezed,Object? social = freezed,Object? interview = freezed,Object? user = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as List<CategoriesModel>?,courses: freezed == courses ? _self.courses : courses // ignore: cast_nullable_to_non_nullable
as List<CoursesModel>?,social: freezed == social ? _self.social : social // ignore: cast_nullable_to_non_nullable
as List<SocialAccountsModel>?,interview: freezed == interview ? _self.interview : interview // ignore: cast_nullable_to_non_nullable
as List<InterviewModel>?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeStatus,
  ));
}

}


/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({required final  List<CategoriesModel>? category, required final  List<CoursesModel>? courses, required final  List<SocialAccountsModel>? social, required final  List<InterviewModel>? interview, required this.user, required this.status}): _category = category,_courses = courses,_social = social,_interview = interview;
  

 final  List<CategoriesModel>? _category;
@override List<CategoriesModel>? get category {
  final value = _category;
  if (value == null) return null;
  if (_category is EqualUnmodifiableListView) return _category;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CoursesModel>? _courses;
@override List<CoursesModel>? get courses {
  final value = _courses;
  if (value == null) return null;
  if (_courses is EqualUnmodifiableListView) return _courses;
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

 final  List<InterviewModel>? _interview;
@override List<InterviewModel>? get interview {
  final value = _interview;
  if (value == null) return null;
  if (_interview is EqualUnmodifiableListView) return _interview;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  UserModel? user;
@override final  HomeStatus status;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&const DeepCollectionEquality().equals(other._category, _category)&&const DeepCollectionEquality().equals(other._courses, _courses)&&const DeepCollectionEquality().equals(other._social, _social)&&const DeepCollectionEquality().equals(other._interview, _interview)&&(identical(other.user, user) || other.user == user)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_category),const DeepCollectionEquality().hash(_courses),const DeepCollectionEquality().hash(_social),const DeepCollectionEquality().hash(_interview),user,status);

@override
String toString() {
  return 'HomeState(category: $category, courses: $courses, social: $social, interview: $interview, user: $user, status: $status)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 List<CategoriesModel>? category, List<CoursesModel>? courses, List<SocialAccountsModel>? social, List<InterviewModel>? interview, UserModel? user, HomeStatus status
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = freezed,Object? courses = freezed,Object? social = freezed,Object? interview = freezed,Object? user = freezed,Object? status = null,}) {
  return _then(_HomeState(
category: freezed == category ? _self._category : category // ignore: cast_nullable_to_non_nullable
as List<CategoriesModel>?,courses: freezed == courses ? _self._courses : courses // ignore: cast_nullable_to_non_nullable
as List<CoursesModel>?,social: freezed == social ? _self._social : social // ignore: cast_nullable_to_non_nullable
as List<SocialAccountsModel>?,interview: freezed == interview ? _self._interview : interview // ignore: cast_nullable_to_non_nullable
as List<InterviewModel>?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeStatus,
  ));
}


}

// dart format on
