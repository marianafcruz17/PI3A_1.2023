import 'package:flutter/material.dart';
import 'package:marmita_social/src/feature/home/view/widget/cardapio.dart';
import 'package:marmita_social/src/feature/home/view/widget/chat.dart';

class Cards extends StatelessWidget {
  final int index;

  const Cards({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Cardapio()),
            );
          },
          child: Image.asset(
            "lib/assets/images/yae.png",
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
