import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:marmita_social/src/feature/auth/domain/usecase/login_screen_usecase.dart';
import 'package:marmita_social/src/feature/onboarding/presentation/view/page/splash_screen.dart';

//import 'signup_page.dart';

class LoginScreen extends StatelessWidget {
    late ColorScheme _colors;
    late Theme Data_theme;

    final loginTextFieldController = TextEditingController();
    final passwordTextFieldController = TextEditingController();
    final loginUseCase = LoginUseCase();

  LoginScreen({super.key});

    @override
    Widget build(BuildContext context){
        return Scaffold(
            appBar: AppBar(title: const Text("Login")),
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

                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Row(
                        children: [
                            Text(
                                'username'.i18n(),
                                style: TextStyle(fontSize: 16, color: Color.fromRGBO(58, 152, 185,1)),
                            ),
                        ],
                    ),

                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Row(
                        children: [
                            Flexible(
                                child: TextField(
                                    controller: loginTextFieldController,
                                    style: TextStyle(fontSize: 16),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(left: 15.0),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20.0),
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(58, 152, 185,1),
                                                width: 2.0)),
                                )),
                            ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Row(
                        children: [
                            Text(
                                'password'.i18n(),
                                style: TextStyle(fontSize: 16, color: Color.fromRGBO(58, 152, 185,1)
                                ),
                            ),
                        ],
                    ),

                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Row(
                        children: [
                            Flexible(
                                child: TextField(
                                    obscureText: true,
                                    controller: passwordTextFieldController,
                                    style: TextStyle(fontSize: 16),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        contentPadding: EdgeInsets.only(left: 15.0),
                                    )),
                            ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                    ),

                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    Row(
                        children: [
                            Flexible(
                                child: SizedBox(
                                    child: ElevatedButton(
                                        child: Text('login'.i18n(),
                                            style: TextStyle(
                                                color: Color.fromRGBO(58, 152, 185,1))),
                                        onPressed: () => {
                                            loginUseCase
                                                .login(loginTextFieldController.text,
                                                    passwordTextFieldController.text)
                                                .then((msg){
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext context){
                                                            return AlertDialog(
                                                                title: Text('username_true'.i18n(), style: TextStyle(fontSize: 16)),
                                                                content: SingleChildScrollView(
                                                                    child: ListBody(
                                                                        children: <Widget>[
                                                                            Text(""),
                                                                        ],
                                                                    ),
                                                                ),
                                                                actions: <Widget>[
                                                                    TextButton(
                                                                        child: const Text('Ok', style: TextStyle(fontSize: 16)),
                                                                        onPressed: (){
                                                                            Navigator.of(context).pop();
                                                                            Navigator.of(context).push(
                                                                                MaterialPageRoute(
                                                                                    builder: (context) =>
                                                                                        SplashScreen()));
                                                                        },
                                                                    ),
                                                                ],
                                                            );
                                                        },
                                                    );
                                                }).catchError((error){
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext context){
                                                            return AlertDialog(
                                                                title: Text('username_false'.i18n(), style: TextStyle(fontSize: 16)),
                                                                content: SingleChildScrollView(
                                                                    child: ListBody(
                                                                        children: <Widget>[
                                                                            Text("$error", style: TextStyle(fontSize: 16)),
                                                                        ],
                                                                    ),
                                                                ),
                                                                actions: <Widget>[
                                                                    TextButton(
                                                                        child: const Text("Ok"),
                                                                        onPressed: (){
                                                                            Navigator.of(context).pop();
                                                                        },
                                                                    ),
                                                                ],
                                                            );
                                                        },
                                                    );
                                                })
                                        },

                                        style: ElevatedButton.styleFrom(
                                            side: BorderSide(
                                                width: 2.0,
                                                color: Color.fromARGB(255,0,0,0),
                                            ),
                                            primary: Color.fromARGB(255,255,255,255),
                                        )
                                    ),

                                    width: double.infinity,
                                    height: 40
                                ),
                            )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                    ),
                ])
            )
        );
    }
}