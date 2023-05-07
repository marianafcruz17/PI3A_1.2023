import 'package:marmita_social/src/feature/auth/data/dto/signup_dto.dart';
import 'package:marmita_social/src/feature/auth/domain/model/signup.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/repository/signup_screen_interface.dart';


class SignupScreenRepository implements ISignup {
    @override
    Future<SignupUser> signup(SignupUser user) async {
        final dto = SignUpDto.fromDomain(user);
        final response = await http.post(
          Uri.parse('http://192.168.0.4:8082/api/users/'),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: jsonEncode(dto.toJson()),
          );

        if (response.statusCode == 200) {
            final token = response.headers.value('Authorization');
            final domain = SignupUser(user.username, user.birth, user.cep, user.email, user.intoleranciaAlimentar, user.restricaoAlimentar,
                user.password, user.confirmPassword,
                token: token);
            return Future.value(domain);
        } else {
            throw Exception(response.headers['Message']);
        }
    }
}
