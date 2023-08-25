mixin CreateAccountValidations {
  // Validação do campo Nome
  String? validateName(String? value) {
    if (value == null || value.isEmpty) return 'Campo obrigatório';
    return null;
  }

  // Validação do campo EMail
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Campo obrigatório';
    return null;
  }

  // Validação do campo Confirmar Email
  String? validateConfirmEmail(String? value, String email) {
    if (value == null || value.isEmpty) return 'Campo obrigatório';
    if (value != email) return 'Os Email não coincidem';
    return null;
  }

  // Validação do campo CPF
  String? validateCPF(String? value) {
    if (value == null || value.isEmpty) return 'Campo obrigatório';
    return null;
  }

  // Validação do campo Senha
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Campo obrigatório';
    if (value.length < 6) return 'A senha deve ter no minimo 6 digitos';
    return null;
  }

  // Validação do campo confirmar Senha
  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) return 'Campo obrigatório';
    if (value != password) return 'As senhas não coincidem';
    return null;
  }

  // Validação do campo de aceitar o termos
  String? validateAccepetdTerms(bool value) {
    if (!value) return 'É preciso aceitar os termos';
    return null;
  }
}
