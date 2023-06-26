import 'package:flutter_triple/flutter_triple.dart';

class LoginStore extends NotifierStore<Exception, bool> {
  final String email;
  final String password;

  LoginStore({
    this.email = '',
    this.password = '',
  }) : super(false);

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
