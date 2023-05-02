import 'package:flutter/material.dart';

class Cardapio extends StatelessWidget {
  const Cardapio({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/alimentos.png',
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Text('Cardápio 1'),
            ],
          ),
        ),
        SizedBox(height: 10),
        TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/alimentos.png',
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Text('Cardápio 2'),
            ],
          ),
        ),
        SizedBox(height: 10),
        TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/alimentos.png',
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Text('Cardápio 3'),
            ],
          ),
        ),
      ],
    ),
  );
  }
}