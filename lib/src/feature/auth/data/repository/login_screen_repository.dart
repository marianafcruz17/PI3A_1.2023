import '../../domain/model/user.dart';
import '../../domain/repository/login_screen_interface.dart';
import '../dto/user_dto.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginScreenRepository implements ILogin {
  @override
  Future<User> login(User user) async {
    final dto = UserDto.fromDomain(user);
    final response = await http.post(
      Uri.parse('https://jwt.levite.vps-kinghost.net/api/users/auth'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(dto.toJson()),
    );

    if (response.statusCode == 200) {
      final domain = User(user.username, user.password);
      return Future.value(domain);
    } else {
      const msg = "Usuário Incorreto ou Inexistente";
      return Future.error(msg);
    }
  }
}
