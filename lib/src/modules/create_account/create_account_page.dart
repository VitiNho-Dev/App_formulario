import 'package:flutter/material.dart';

import '../../shared/components/custom_text_form_field.dart';
import 'create_account_controller.dart';

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
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
                  controller: controller.fullName,
                ),
                CustomTextFormField(
                  label: 'Email',
                  hint: 'Digite seu email',
                  validator: controller.validateEmailController.validateEmail,
                  controller: controller.email,
                ),
                CustomTextFormField(
                  label: 'Confirmar Email',
                  hint: 'Digite novamente seu email',
                  onTap: () => controller.validateEmailController.sendEmail(
                    controller.email.text,
                    context,
                  ),
                  validator: (value) => controller.validateConfirmEmail(
                    value,
                    controller.email.text,
                  ),
                  controller: controller.confirmEmail,
                ),
                CustomTextFormField(
                  label: 'CPF',
                  hint: 'Digite seu CPF',
                  validator: controller.validateCPF,
                  controller: controller.cpf,
                ),
                CustomTextFormField(
                  label: 'Senha',
                  hint: 'Digite sua senha',
                  validator: controller.validatePassword,
                  controller: controller.password,
                ),
                CustomTextFormField(
                  label: 'Confirmar Senha',
                  hint: 'Digite novamente sua senha',
                  validator: (value) => controller.validateConfirmPassword(
                    value,
                    controller.password.text,
                  ),
                  controller: controller.confirmPassword,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: controller.acceptedTerms,
                      onChanged: (value) {
                        setState(() {
                          controller.acceptedTerms = value!;
                        });
                      },
                    ),
                    const Text('Aceito os termos'),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    controller.validateEmailController.sendEmail(
                      controller.email.text,
                      context,
                    );

                    controller.validateAccepetdTerms(
                      controller.acceptedTerms,
                      context,
                    );

                    controller.createAccount(context);
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
