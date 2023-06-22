import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:marmita_social/src/feature/auth/domain/usecase/forgot_screen_usecase.dart';
import 'login_page.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  var emailTextFieldController = TextEditingController();

  var forgotUseCase = ForgotUseCase();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'app_name'.i18n(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: null,
            body: Container(
              padding: const EdgeInsets.only(left: 40, right: 40),
              width: double.infinity,
              height: double.infinity,
              child: ListView(children: <Widget>[
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/images/logo.png',
                      width: 300,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: const [
                    Text(
                      "E-mail:",
                      style: TextStyle(
                          fontSize: 16, color: Color.fromRGBO(58, 152, 185, 1)),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: TextField(
                          controller: emailTextFieldController,
                          style: const TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          )),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () => {
                                    forgotUseCase
                                        .forgot(emailTextFieldController.text)
                                        .then((msg) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('new_Pass'.i18n(),
                                                style: const TextStyle(
                                                    fontSize: 16)),
                                            content: SingleChildScrollView(
                                              child: ListBody(
                                                children: const <Widget>[
                                                  Text(""),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('Ok',
                                                    style: TextStyle(
                                                        fontSize: 16)),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginScreen()));
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }).catchError((error) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('new_Pass_False'.i18n(),
                                                style: const TextStyle(
                                                    fontSize: 16)),
                                            content: SingleChildScrollView(
                                              child: ListBody(
                                                children: <Widget>[
                                                  Text("$error"),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('Ok',
                                                    style: TextStyle(
                                                        fontSize: 16)),
                                                onPressed: () {
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
                                backgroundColor:
                                    const Color.fromRGBO(58, 152, 185, 1),
                              ),
                              child: Text('confirm'.i18n(),
                                  style: const TextStyle(
                                      color: Color.fromARGB(
                                          255, 255, 255, 255))))),
                    )
                  ],
                ),
              ]),
            )));
  }
}
