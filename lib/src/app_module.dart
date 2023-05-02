import 'package:flutter_modular/flutter_modular.dart';
import 'package:marmita_social/src/feature/auth/auth_module.dart';
import 'package:marmita_social/src/feature/auth/presentation/view/page/login_page.dart';
import 'package:marmita_social/src/feature/home/home_module.dart';

class AppModule extends Module{
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
      //ModuleRoute('/', module: HomeModule()),
      ModuleRoute('/', module: AuthModule() ),
  ];



}