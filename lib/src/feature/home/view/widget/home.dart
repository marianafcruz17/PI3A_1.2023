import 'package:flutter/material.dart';

import 'cards.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 12);
      },
      itemBuilder: (context, index) {
        return Cards(index: index);
      },
    ));
  }
}

/*SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            /*SizedBox(
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
            ),*/
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
      ),*/