import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:marmita_social/src/feature/home/model/restaurant_model.dart';
import 'package:marmita_social/src/feature/home/usercase/home_usercase.dart';

class HomeRepository implements IHome {
  Future<String> _carregaJson() async {
    return await rootBundle.loadString('assets/restaurantes.json');
  }

  @override
  Future<List<Restaurant>> parseJson() async {
    String jsonString = await _carregaJson();
    final response = await http.post(
      Uri.parse('http://127.0.0.1:5000'),
      headers: {'Content-Type': 'application/json'},
      body: jsonString,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> jsonList = jsonDecode(response.body);
      debugPrint("Deu certo ${response.body}");

      return jsonList.map((json) => Restaurant.fromJson(json)).toList();
    } else {
      debugPrint('Erro ao fazer a solicitação: ${response.statusCode}');
      return [];
    }
  }
}
