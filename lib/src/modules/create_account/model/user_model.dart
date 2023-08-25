class UserModel {
  final String name;
  final String surname;
  final String email;
  final String cpf;
  final String password;
  final bool acceptedTerms;

  const UserModel({
    required this.name,
    required this.surname,
    required this.email,
    required this.cpf,
    required this.password,
    required this.acceptedTerms,
  });
}
