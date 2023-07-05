import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:marmita_social/src/feature/auth/data/dto/user_dto.dart';
import 'package:marmita_social/src/feature/auth/data/repository/login_screen_repository.dart';
import '../model/user.dart';

class LoginUseCase {
  final repository = LoginScreenRepository();

  List validateUsername(String username) {
    if (username.isEmpty) {
      return [false, 'O campo usuario não pode estar em branco.'];
    }

    return [true];
  }

  List validatePassword(String password) {
    if (password.isEmpty) {
      return [false, 'A senha não pode estar em branco.'];
    }
    return [true];
  }

  Future<User> login(String username, String password) async {
    if (!validateUsername(username)[0]) {
      final errorMsg = validateUsername(username)[1];
      return Future.error("$errorMsg");
    }

    if (!validatePassword(password)[0]) {
      final errorMsg = validatePassword(password)[1];
      return Future.error("$errorMsg");
    }
    var retorno = await repository.login(UserDto(username, password));
    final LocalStorage storage = LocalStorage('marmita_app.json');
    storage.setItem('loggedUser', json.encode(retorno.userDetails?.toJson()));
    return retorno;
  }
}
