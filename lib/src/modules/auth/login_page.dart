import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_app/src/modules/auth/login_store.dart';

import '../../shared/components/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  final LoginStore store;

  LoginPage({
    Key? key,
    required this.store,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Login',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 24),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    label: 'Email',
                    hint: 'example@.com',
                    controller: _email,
                    validator: (value) {
                      return value != 'victor@gmail.com'
                          ? 'Email inválido'
                          : null;
                    },
                  ),
                  const SizedBox(height: 12),
                  CustomTextFormField(
                    label: 'Password',
                    hint: '0000',
                    controller: _password,
                    validator: (value) {
                      return value != '1234' ? 'Password inválido' : null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Modular.to.pushNamed('/HomePage');
                  _email.clear();
                  _password.clear();
                }
              },
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
