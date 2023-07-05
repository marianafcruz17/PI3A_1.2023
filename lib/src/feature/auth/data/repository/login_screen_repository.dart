import 'package:flutter/material.dart';
import 'package:marmita_social/src/feature/auth/domain/model/userDetails.dart';

import '../../domain/model/user.dart';
import '../../domain/repository/login_screen_interface.dart';
import '../dto/user_dto.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginScreenRepository implements ILogin {
  @override
  Future<User> login(UserDto user) async {
    //final dto = UserDto.fromDomain(user);
    final response = await http.post(
      Uri.parse(
          'https://marmita-social.levite.vps-kinghost.net/api/users/auth'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      //debugPrint(jsonDecode(response.body).toString());
      final data = jsonDecode(response.body) as Map;
      debugPrint(data['token']);
      final domain = User(user.username, user.password,
          Userdetails.fromJson(data['userDetails']));
      return Future.value(domain);
    } else {
      const msg = "Usuário Incorreto ou Inexistente";
      return Future.error(msg);
    }
  }
}
