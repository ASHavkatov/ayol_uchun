import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/data/repositories/auth_repository.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository _repo;

  SignupBloc({required AuthRepository repo}):_repo =repo, super(SignupState.initial()) {
    on<SignupFirstPageSubmitted>(_onFirstPageSubmitted);
    on<SignupSecondPageSubmitted>(_onSecondPageSubmitted);
    on<SignupThirdPageSubmitted>(_onThirdPageSubmitted);
    on<SignupFinalSubmitted>(_onFinalSubmitted);
  }

  void _onFirstPageSubmitted(SignupFirstPageSubmitted event, Emitter<SignupState> emit) {
    emit(state.copyWith(
      firstName: event.firstName,
      lastName: event.lastName,
      email: event.email,
      status: SignupStatus.success
    ));
  }

  void _onSecondPageSubmitted(SignupSecondPageSubmitted event, Emitter<SignupState> emit) {
    emit(state.copyWith(
      phoneNumber: event.phoneNumber,
      status: SignupStatus.success
    ));
  }

  void _onThirdPageSubmitted(SignupThirdPageSubmitted event, Emitter<SignupState> emit) {
    emit(state.copyWith(
      password: event.password,
      status: SignupStatus.success
    ));
  }

  Future<void> _onFinalSubmitted(SignupFinalSubmitted event, Emitter<SignupState> emit) async {
    emit(state.copyWith(status: SignupStatus.loading));

    try {
      final result = await _repo.signUp(
        firstName: state.firstName,
        lastName: state.lastName,
        email: state.email,
        phoneNumber: state.phoneNumber,
        password: state.password,
      );
      print("Bloc: $result");


      if (result) {
        emit(state.copyWith(status: SignupStatus.success));
      } else {
        emit(state.copyWith(
          status: SignupStatus.error,
          errorMessage: "Ro'yxatdan o'tishda xatolik yuz berdi",
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: SignupStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
