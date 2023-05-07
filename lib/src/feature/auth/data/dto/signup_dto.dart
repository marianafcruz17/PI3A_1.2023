import 'package:marmita_social/src/Feature/auth/domain/model/signup.dart';

class SignUpDto {
     const SignUpDto(this.username, this.email, this.birth, this.password,
      this.confirmPassword, this.token);

  final String username;
  final String email;
  final String birth;
  final String password;
  final String confirmPassword;
  final String? token;

  factory SignUpDto.fromDomain(SignupUser user) {
    return SignUpDto(
        user.username,
        user.email,
        user.birth,
        user.password,
        user.confirmPassword,
        user.token);
  }

  factory SignUpDto.fromJson(Map<String, dynamic> json) => SignUpDto(
        json['username'],
        json['email'],
        json['birth'],
        json['password'],
        json['confirmPassword'],
        json['token'],
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'email': email,
        'token': token
      };
}