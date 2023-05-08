import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'lib/assets/images/onboard2.png',
            width: 400,
            height: 400,
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: const Text(
                "Chatbot",
                style: TextStyle(fontSize: 30),
              )),
          Text(
            'in_development'.i18n(),
            style: const TextStyle(fontSize: 24),
          )
        ],
      ),
    );
  }
}
