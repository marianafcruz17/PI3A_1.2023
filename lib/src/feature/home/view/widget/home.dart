import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

import '../../model/restaurant_model.dart';
import 'cards.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  Future<String> _carregaJson() async {
    var data = await rootBundle.loadString('assets/restaurantes.json');
    List jsonData = json.decode(data);
    final LocalStorage storage = LocalStorage('marmita_app.json');
    //var loggedUser = storage.getItem('loggedUser');
    Map<String, dynamic> loggedUser =
        json.decode(storage.getItem('loggedUser'));
    print(jsonData.length.toString());
    for (var i = 0; i < jsonData.length; i++) {
      print(jsonData[i]);
      jsonData[i]['lactose_user'] = loggedUser['lactose_user'];
      jsonData[i]['vegetariano_user'] = loggedUser['vegetariano_user'];
      jsonData[i]['porco_user'] = loggedUser['porco_user'];
      jsonData[i]['gluten_user'] = loggedUser['gluten_user'];
    }
    return jsonData.toString();
  }

  Future<List<Restaurant>> _parseJson() async {
    String jsonString = await _carregaJson();
    final response = await http.post(
      Uri.parse('http://192.168.56.1:5001'),
      headers: {'Content-Type': 'application/json'},
      body: jsonString,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> jsonList = jsonDecode(response.body);
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
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Restaurant> restaurantes = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: restaurantes.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 12);
              },
              itemBuilder: (context, index) {
                Restaurant restaurante = restaurantes[index];
                if (restaurante.recomendado) {
                  return Cards(index: index, restaurante: restaurante);
                } else {
                  return null;
                }
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
