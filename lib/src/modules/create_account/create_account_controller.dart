import 'package:flutter/material.dart';

import 'create_account_validations.dart';
import 'validate_email_controller.dart';

class CreateAccountController extends ChangeNotifier
    with CreateAccountValidations {
  final fullName = TextEditingController();
  final email = TextEditingController();
  final confirmEmail = TextEditingController();
  final cpf = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final ValidateEmailController validateEmailController;
  bool acceptedTerms = false;

  CreateAccountController(this.validateEmailController);

  Future<void> createAccount(BuildContext context) async {
    if (formKey.currentState!.validate() &&
        validateEmailController.emailIsValid &&
        acceptedTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Conta criada com sucesso'),
          duration: Duration(seconds: 2),
        ),
      );
    }

    // chamar o usecase de criar a conta

    // fazer o fold para retornar algum erro ou navegar para a tela home
  }
}
