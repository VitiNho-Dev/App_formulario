import 'package:flutter/material.dart';

import '../../../shared/validators/create_account_validations.dart';
import '../state/create_account_state.dart';

class CreateAccountController extends ValueNotifier<CreateAccountState>
    with CreateAccountValidations {
  CreateAccountController() : super(CreateAccountInitialState());

  Future<void> createAccount(String email, String password) async {
    value = CreateAccountLoadingState();

    if (email != 'vitinho@gmail.com') {
      value = CreateAccountErrorState(errorMessage: 'Email não cadastrado');
      return;
    }

    if (password != '123456') {
      value = CreateAccountErrorState(errorMessage: 'Senha não cadastrada');
      return;
    }

    value = CreateAccountSuccessState(accountCreated: true);
  }
}
