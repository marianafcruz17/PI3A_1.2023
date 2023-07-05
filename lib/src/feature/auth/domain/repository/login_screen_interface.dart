import 'package:marmita_social/src/feature/auth/data/dto/user_dto.dart';

import '../model/user.dart';

abstract class ILogin {
  Future<User> login(UserDto user);
}
