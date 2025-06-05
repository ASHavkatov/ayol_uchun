import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

enum SignupStatus { idle, loading, success, error }

@freezed
abstract class SignupState with _$SignupState {
  const factory SignupState({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String password,
    required SignupStatus status,
    String? errorMessage,
  }) = _SignupState;

  factory SignupState.initial() => SignupState(
    firstName: '',
    lastName: '',
    email: '',
    phoneNumber: '',
    password: '',
    status: SignupStatus.idle,
    errorMessage: null,
  );
}
