import 'package:flutter/material.dart';
import 'package:marmita_social/src/feature/home/view/widget/cardapio.dart';
import 'package:marmita_social/src/feature/home/view/widget/restaurantes.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 230,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cardapio()),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/images/alimentos.png',
                      width: 180,
                      height: 200,
                    ),
                    const SizedBox(width: 10),
                    const Text('Cardápio'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 230,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Restaurantes()),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/images/localização.png',
                      width: 180,
                      height: 200,
                    ),
                    const SizedBox(width: 10),
                    const Text('Restaurantes Próximos'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
