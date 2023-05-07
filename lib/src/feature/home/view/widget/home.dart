import 'package:flutter/material.dart';
import 'package:marmita_social/src/feature/home/view/widget/cardapio.dart';


class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20 , width: 50,),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cardapio()),
          );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/alimentos.png',
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Text('Cardápio'),
            ],
          ),
        ),
        SizedBox(height: 10,  width: 50,),
        TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/localização.png',
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Text('Restaurantes Próximos'),
            ],
          ),
        ),
      ],
    ),
  );
  }
}