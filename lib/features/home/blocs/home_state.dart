import 'package:ayol_uchun_exam/core/data/models/courses_model.dart';
import 'package:ayol_uchun_exam/core/data/models/interview_model.dart';
import 'package:ayol_uchun_exam/core/data/models/social_accounts_model.dart';
import 'package:ayol_uchun_exam/core/data/models/user_model.dart';

import '../../../core/data/models/categories_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

enum HomeStatus { error, loading, idle }

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required List<CategoriesModel>? category,
    required List<CoursesModel>? courses,
    required List<SocialAccountsModel>? social,
    required List<InterviewModel>? interview,
    required UserModel? user,
    required HomeStatus status,
  }) = _HomeState;

  factory HomeState.initial(){
    return HomeState(user: null,category: [], status: HomeStatus.loading, courses: [], social: [], interview: [],);
  }
}
