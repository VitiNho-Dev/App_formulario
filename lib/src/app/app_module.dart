import 'package:flutter_modular/flutter_modular.dart';

import '../modules/auth/login_page.dart';
import '../modules/auth/login_store.dart';
import '../modules/create_account/controller/create_account_controller.dart';
import '../modules/create_account/view/create_account_page.dart';
import '../modules/home/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => LoginStore()),
        Bind((i) => CreateAccountController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => CreateAccountPage(
            createAccountController: context.read<CreateAccountController>(),
          ),
        ),
        ChildRoute(
          '/login',
          child: (context, args) => LoginPage(
            store: Modular.get<LoginStore>(),
          ),
        ),
        ChildRoute(
          '/HomePage',
          child: (context, args) => const HomePage(),
        ),
      ];
}
