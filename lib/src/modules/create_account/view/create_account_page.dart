import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/components/custom_text_form_field.dart';
import '../controller/create_account_controller.dart';
import '../state/create_account_state.dart';

class CreateAccountPage extends StatefulWidget {
  final CreateAccountController createAccountController;

  const CreateAccountPage({
    Key? key,
    required this.createAccountController,
  }) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  CreateAccountController get controller => widget.createAccountController;
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final confirmEmailController = TextEditingController();
  final cpfController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool acceptedTerms = false;

  void confirmAcceptanceOfTerms(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: size.height * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: size.height * 0.03),
                CustomTextFormField(
                  label: 'Nome e Sobrenome',
                  hint: 'Digite seu nome completo',
                  validator: controller.validateName,
                  controller: nameController,
                ),
                CustomTextFormField(
                  label: 'Email',
                  hint: 'Digite seu email',
                  validator: controller.validateEmail,
                  controller: emailController,
                ),
                CustomTextFormField(
                  label: 'Confirmar Email',
                  hint: 'Digite novamente seu email',
                  validator: (value) => controller.validateConfirmEmail(
                    value,
                    emailController.text,
                  ),
                  controller: confirmEmailController,
                ),
                CustomTextFormField(
                  label: 'CPF',
                  hint: 'Digite seu CPF',
                  validator: controller.validateCPF,
                  controller: cpfController,
                ),
                CustomTextFormField(
                  label: 'Senha',
                  hint: 'Digite sua senha',
                  validator: controller.validatePassword,
                  controller: passwordController,
                ),
                CustomTextFormField(
                  label: 'Confirmar Senha',
                  hint: 'Digite novamente sua senha',
                  validator: (value) => controller.validateConfirmPassword(
                    value,
                    passwordController.text,
                  ),
                  controller: confirmPasswordController,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: acceptedTerms,
                      onChanged: (value) {
                        setState(() {
                          acceptedTerms = value!;
                        });
                      },
                    ),
                    const Text('Aceito os termos'),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    final accepted = controller //
                        .validateAccepetdTerms(acceptedTerms);
                    if (accepted != null) {
                      confirmAcceptanceOfTerms(accepted);
                    }

                    if (_formKey.currentState!.validate()) {
                      controller.createAccount(
                        emailController.text,
                        passwordController.text,
                      );
                      if (controller.value is CreateAccountSuccessState) {
                        Modular.to.navigate('/HomePage');
                      }
                    }
                  },
                  child: const Text('Criar Conta'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
