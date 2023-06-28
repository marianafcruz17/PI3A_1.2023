import 'package:flutter/material.dart';

import 'location_map.dart';
import '../../model/restaurant_model.dart';

class Restaurates extends StatelessWidget {
  final Restaurant restaurante;
  const Restaurates({super.key, required this.restaurante});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurante.name),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 58, 152, 185),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                "lib/assets/images/cardapio2.png", // alterar pelo restaurant.cardapio
              ),
            ),
            const SizedBox(height: 20),
            LocationMap(restaurante),
          ],
        ),
      ),
    );
  }
}
