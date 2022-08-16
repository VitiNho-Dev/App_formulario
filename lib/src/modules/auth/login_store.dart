import 'package:flutter_triple/flutter_triple.dart';

class LoginStore extends NotifierStore<Exception, bool> {
  LoginStore(
    Object initialState,
    this.email,
    this.password,
  ) : super(false);

  final String email;
  final String password;

  Future<void> login() async {
    setLoading(true);

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (email == 'victor@gmail.com' && password == '1234') {
      update(true);
    } else {
      setError(
        Exception(false),
      );
    }

    setLoading(false);
  }
}
