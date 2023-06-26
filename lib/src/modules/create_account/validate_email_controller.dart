import 'package:flutter/material.dart';

class ValidateEmailController {
  final String validateEmailUsecase = '';
  bool emailIsValid = false;

  Future<bool> sendEmail(String email, BuildContext context) async {
    // chamar o usecase validateEmailUsecase
    if (email == 'vitinho@teste.com') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email já cadastrado!'),
          duration: Duration(seconds: 2),
        ),
      );
      return emailIsValid = false;
    } else {
      return emailIsValid = true;
    }
  }

  // Validação do campo Email
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) return 'Campo obrigatório';
    return null;
  }
}
