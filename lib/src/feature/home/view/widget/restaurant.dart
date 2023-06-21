import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../model/restaurant_model.dart';

class Restaurates extends StatelessWidget {
  const Restaurates({super.key});

  Future<String> _carregaJson() async {
    return await rootBundle.loadString('assets/restaurantes.json');
  }

  Future<List<Restaurant>> _parseJson() async {
    String jsonString = await _carregaJson();
    List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => Restaurant.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Restaurant>>(
        future: _parseJson(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Restaurant> restaurantes = snapshot.data!;
            return ListView.separated(
              //.builder
              padding: const EdgeInsets.all(12),
              itemCount: restaurantes.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 12);
              },
              itemBuilder: (context, index) {
                Restaurant restaurante = restaurantes[index];
                return ListTile(
                  title: Text(restaurante.name),
                  subtitle: Text(restaurante.id),
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
