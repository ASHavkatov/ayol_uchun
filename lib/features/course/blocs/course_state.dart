import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/data/models/courses_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_state.freezed.dart';

enum CourseStatus { error, loading, idle }

@freezed
abstract class CourseState with _$CourseState {
  const factory CourseState({
    required List<CoursesModel>? course,
    required CourseStatus status,
  }) = _CourseState;

  factory CourseState.initial() {
    return CourseState(course: null, status: CourseStatus.loading);
  }
}
