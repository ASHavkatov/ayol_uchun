import '../../../core/data/models/categories_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

enum HomeStatus { error, loading, idle }

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required List<CategoriesModel>? model,
    required HomeStatus status,
  }) = _HomeState;

  factory HomeState.initial(){
    return HomeState(model: null, status: HomeStatus.loading);
  }
}
