import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_app/src/modules/auth/login_store.dart';

import '../modules/auth/login_page.dart';
import '../modules/home/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => LoginStore(
            false,
            '',
            '',
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/HomePage',
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          '/',
          child: (context, args) => LoginPage(
            store: Modular.get<LoginStore>(),
          ),
        ),
      ];
}
