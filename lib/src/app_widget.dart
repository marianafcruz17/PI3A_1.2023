import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class AppWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    LocalJsonLocalization.delegate.directories = ['lib/assets/i18n'];

    
     return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
      title: 'app_name'.i18n(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate, 
        GlobalWidgetsLocalizations.delegate, 
        LocalJsonLocalization.delegate 
      ],
        supportedLocales: const [
          Locale('pt', 'BR'),
          Locale('en', 'US'),
        ],
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
    );
  }
}

// configura o scroll para android e para desktop
class AppScrollBehavior extends MaterialScrollBehavior{

    @override
    Set<PointerDeviceKind> get dragDevices => {
      PointerDeviceKind.touch,
      PointerDeviceKind.mouse,
    };
}