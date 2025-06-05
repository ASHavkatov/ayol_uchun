sealed class SignupEvent {}

class SignupFirstPageSubmitted extends SignupEvent {
  final String firstName;
  final String lastName;
  final String email;

  SignupFirstPageSubmitted({
    required this.firstName,
    required this.lastName,
    required this.email,
  });
}

class SignupSecondPageSubmitted extends SignupEvent {
  final String phoneNumber;

  SignupSecondPageSubmitted({required this.phoneNumber});
}

class SignupThirdPageSubmitted extends SignupEvent {
  final String password;

  SignupThirdPageSubmitted({required this.password});
}

class SignupFinalSubmitted extends SignupEvent {}
