import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:marmita_social/src/feature/auth/domain/usecase/signup_screen_usecase.dart';

import 'login_page.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool lactoseIsChecked = false;
  bool glutenIsChecked = false;
  bool vegetarianoIsChecked = false;
  bool porcoIsChecked = false;

  var usernameTextFieldController = TextEditingController();

  var nameTextFieldController = TextEditingController();

  var birthTextFieldController = TextEditingController();

  var cepTextFieldController = TextEditingController();

  var intoleranciaTextFieldController = TextEditingController();

  var restricaoOptionTextFieldController = TextEditingController();

  var emailTextFieldController = TextEditingController();

  var passwordTextFieldController = TextEditingController();

  var confirmPasswordTextFieldController = TextEditingController();

  var signupUseCase = SignupUseCase();

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      return Colors.blue;
    }

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
                /*Padding(padding: EdgeInsets.only(bottom: 40)),
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
                        ),*/

                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'User'.i18n(),
                      style: const TextStyle(
                          fontSize: 16, color: Color.fromRGBO(58, 152, 185, 1)),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Flexible(
                    child: TextField(
                      controller: usernameTextFieldController,
                      textAlignVertical: TextAlignVertical.center,
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        contentPadding: const EdgeInsets.only(left: 15.0),
                      ),
                    ),
                  ),
                ]),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'name'.i18n(),
                      style: const TextStyle(
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
                        controller: nameTextFieldController,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding: const EdgeInsets.only(left: 15.0),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'birth'.i18n(),
                      style: const TextStyle(
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
                          readOnly: true,
                          onTap: () {
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1990, 1),
                                lastDate: DateTime.now(),
                                builder: (context, picker) {
                                  return Theme(
                                    data: ThemeData.dark().copyWith(
                                      colorScheme: const ColorScheme.dark(
                                        primary: Colors.deepPurple,
                                        onPrimary: Colors.white,
                                        surface:
                                            Color.fromARGB(255, 151, 205, 255),
                                        onSurface:
                                            Color.fromARGB(255, 16, 7, 68),
                                      ),
                                      dialogBackgroundColor:
                                          const Color.fromARGB(
                                              255, 87, 215, 244),
                                    ),
                                    child: picker!,
                                  );
                                }).then((selectedDate) {
                              if (selectedDate != null) {
                                birthTextFieldController.text =
                                    selectedDate.toString().split(' ')[0];
                              }
                            });
                          },
                          controller: birthTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            contentPadding: const EdgeInsets.only(left: 15.0),
                          )),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'CEP'.i18n(),
                      style: const TextStyle(
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
                        controller: cepTextFieldController,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding: const EdgeInsets.only(left: 15.0),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'intolerancia'.i18n(),
                      style: const TextStyle(
                          fontSize: 16, color: Color.fromRGBO(58, 152, 185, 1)),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Flexible(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              lactoseIsChecked = !lactoseIsChecked;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Row(
                              children: <Widget>[
                                // const Expanded(child: Text("Lactose")),
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: lactoseIsChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      lactoseIsChecked = value!;
                                    });
                                  },
                                ),
                                const Text("Lactose"),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              glutenIsChecked = !glutenIsChecked;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Row(
                              children: <Widget>[
                                // const Expanded(child: Text("Lactose")),
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: glutenIsChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      glutenIsChecked = value!;
                                    });
                                  },
                                ),
                                const Text("Glúten"),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(children: [
                  Text(
                    'restricao'.i18n(),
                    style: const TextStyle(
                        fontSize: 16, color: Color.fromRGBO(58, 152, 185, 1)),
                  ),
                ]),
                Row(
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                vegetarianoIsChecked = !vegetarianoIsChecked;
                              });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: Row(
                                children: <Widget>[
                                  // const Expanded(child: Text("Lactose")),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            getColor),
                                    value: vegetarianoIsChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        vegetarianoIsChecked = value!;
                                      });
                                    },
                                  ),
                                  const Text("Vegetariano"),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                porcoIsChecked = !porcoIsChecked;
                              });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: Row(
                                children: <Widget>[
                                  // const Expanded(child: Text("Lactose")),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            getColor),
                                    value: porcoIsChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        porcoIsChecked = value!;
                                      });
                                    },
                                  ),
                                  const Text("Não como porco"),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: const <Widget>[
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
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            contentPadding: const EdgeInsets.only(left: 15.0),
                          )),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'password'.i18n(),
                      style: const TextStyle(
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
                          obscureText: true,
                          controller: passwordTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            contentPadding: const EdgeInsets.only(left: 15.0),
                          )),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'confirm_password'.i18n(),
                      style: const TextStyle(
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
                          obscureText: true,
                          controller: confirmPasswordTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            contentPadding: const EdgeInsets.only(left: 15.0),
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
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () => {
                            signupUseCase
                                .signup(
                                    usernameTextFieldController.text,
                                    //nameTextFieldController.text,
                                    emailTextFieldController.text,
                                    cepTextFieldController.text,
                                    birthTextFieldController.text,
                                    passwordTextFieldController.text,
                                    confirmPasswordTextFieldController.text,
                                    lactoseIsChecked,
                                    glutenIsChecked,
                                    vegetarianoIsChecked,
                                    porcoIsChecked)
                                .then((msg) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('register_True'.i18n(),
                                        style: const TextStyle(fontSize: 16)),
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
                                            style: TextStyle(fontSize: 16)),
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
                                    title: Text('register_False'.i18n(),
                                        style: const TextStyle(fontSize: 16)),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          Text("$error",
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Ok',
                                            style: TextStyle(fontSize: 16)),
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
                            side: const BorderSide(
                              width: 2.0,
                              color: Color.fromRGBO(74, 250, 218, 1),
                            ),
                            backgroundColor:
                                const Color.fromRGBO(74, 250, 218, 1),
                          ),
                          child: Text('register'.i18n(),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255))),
                        ),
                      ),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
              ]),
            )));
  }
}
