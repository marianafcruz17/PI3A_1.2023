import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class HomePage extends StatelessWidget {
    const HomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text('app_name'.i18n())),
            body: Container(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: ListView(children: <Widget>[
                
                    Padding(padding: EdgeInsets.only(bottom: 40)),
                    Row(
                        children: [
                            Image.asset(
                                'lib/assets/images/logo.png',
                                width: 300,
                                height: 200,
                                fit: BoxFit.fill,
                            ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                    ),
                ]),
            ),
        );
    }
}
