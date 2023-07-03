import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../model/restaurant_model.dart';
import 'cards.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  Future<String> _carregaJson() async {
    return await rootBundle.loadString('assets/restaurantes.json');
  }

  Future<List<Restaurant>> _parseJson() async {
    String jsonString = await _carregaJson();
    final response = await http.post(
      Uri.parse('http://127.0.0.1:5000'),
      headers: {'Content-Type': 'application/json'},
      body: jsonString,
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      debugPrint("Deu certo ${response.body}");

      return jsonList.map((json) => Restaurant.fromJson(json)).toList();
    } else {
      debugPrint('Erro ao fazer a solicitação: ${response.statusCode}');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Restaurant>>(
        future: _parseJson(),
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            debugPrint('Entrou no IF');
            List<Restaurant> restaurantes = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: restaurantes.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 12);
              },
              itemBuilder: (context, index) {
                Restaurant restaurante = restaurantes[index];
                return Cards(index: index, restaurante: restaurante);
              },
            );
          } else if (snapshot.hasError) {
            return Text("Erro ao carregar os dados: ${snapshot.error}");
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
