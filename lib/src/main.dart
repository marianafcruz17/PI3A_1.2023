import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'app_widget.dart';

void main() {
  runApp(
    ModularApp(module: AppModule(), child: AppWidget())
  );
}

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

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}