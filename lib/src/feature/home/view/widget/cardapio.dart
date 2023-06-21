import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marmita_social/src/feature/home/model/cardapio_model.dart';

class Cardapio extends StatelessWidget {
  const Cardapio({super.key});

  Future<String> _carregaJson() async {
    return await rootBundle.loadString('assets/cardapios.json');
  }

  Future<List<Cardapios>> _parseJson() async {
    String jsonString = await _carregaJson();
    List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => Cardapios.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cardapios>>(
        future: _parseJson(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Cardapios> cardapios = snapshot.data!;
            return ListView.separated(
              //.builder 
              padding: const EdgeInsets.all(12),
              itemCount: cardapios.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 12);
              },
              itemBuilder: (context, index) {
                Cardapios cardapio = cardapios[index];
                return ListTile(
                  title: Text(cardapio.nome),
                  subtitle: Text(cardapio.valor),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text("Erro ao carregar json");
          } else {
            return const CircularProgressIndicator();
          }
        }));
  }
}
