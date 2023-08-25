abstract class CreateAccountState {}

class CreateAccountInitialState extends CreateAccountState {}

class CreateAccountSuccessState extends CreateAccountState {
  final bool accountCreated;

  CreateAccountSuccessState({required this.accountCreated});
}

class CreateAccountErrorState extends CreateAccountState {
  final String errorMessage;

  CreateAccountErrorState({required this.errorMessage});
}

class CreateAccountLoadingState extends CreateAccountState {}
