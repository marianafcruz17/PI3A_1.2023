import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import 'app_module.dart';
import 'app_widget.dart';
import 'feature/auth/presentation/view/page/login_page.dart';

void main() {
  runApp(
    ModularApp(module: AppModule(), child: AppWidget())
  );
}
/*
class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      scrollBehavior: AppScrollBehavior(),

      title: 'app_name'.i18n(),
            
      supportedLocales: const [
        
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      
      ],
      
      home: LoginScreen());
  }
}

*/