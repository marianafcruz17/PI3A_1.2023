import 'package:flutter/material.dart';

class UserConfig extends StatelessWidget {
  const UserConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Configurações de Usuario', style: TextStyle(fontSize: 20))),
    );
  }
}