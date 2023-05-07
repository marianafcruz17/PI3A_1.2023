import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/onboard2.png',
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 10),
              const Text('CHAT'),
            ],
          ),
        ),
      ],
    ),
  );
  }
}