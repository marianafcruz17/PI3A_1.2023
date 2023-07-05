import 'package:marmita_social/src/feature/auth/domain/model/userDetails.dart';

class User {
  const User(this.username, this.password, this.userDetails, {this.token});

  final String username;
  final String password;
  final Userdetails? userDetails;
  final String? token;

  factory User.fromJson(Map<String, dynamic> json) =>
      User(json['username'], json['password'], json['userDetails'],
          token: json['token']);
}
