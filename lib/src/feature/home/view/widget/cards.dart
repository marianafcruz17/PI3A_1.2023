import 'package:flutter/material.dart';
import 'package:marmita_social/src/feature/home/view/widget/restaurant.dart';

import '../../model/restaurant_model.dart';

class Cards extends StatelessWidget {
  final int index;
  final Restaurant restaurante;

  const Cards({super.key, required this.index, required this.restaurante});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Restaurates(
                    restaurante: restaurante,
                  )),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "lib/assets/images/alimentos.png",
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Text(restaurante.name),
              Text(restaurante.id),
            ],
          ),
          Text(restaurante.id),
        ],
      ),
    );
  }
}
