import 'package:marmita_social/src/feature/auth/domain/model/signup.dart';

class SignUpDto {
  const SignUpDto(
      this.username,
      this.email,
      this.cep,
      this.birth,
      this.password,
      this.confirmPassword,
      this.lactose,
      this.gluten,
      this.vegetariano,
      this.porco,
      this.token);

  final String username;
  final String email;
  final String cep;
  final String birth;
  final String password;
  final String confirmPassword;
  final bool lactose;
  final bool gluten;
  final bool vegetariano;
  final bool porco;
  final String? token;

  factory SignUpDto.fromDomain(SignupUser user) {
    return SignUpDto(
        user.username,
        user.email,
        user.cep,
        user.birth,
        user.password,
        user.confirmPassword,
        user.lactose,
        user.gluten,
        user.vegetariano,
        user.porco,
        user.token);
  }

  factory SignUpDto.fromJson(Map<String, dynamic> json) => SignUpDto(
      json['username'],
      json['email'],
      json['cep'],
      json['birth'],
      json['password'],
      json['confirmPassword'],
      json['lactose'],
      json['gluten'],
      json['vegetariano'],
      json['porco'],
      json['token']);

  Map<String, dynamic> toJson() => {
        'login': username,
        'password': password,
        'email': email,
        'cep': cep,
        'admin': false,
        'dataNascimento': birth,
        'lactose': lactose,
        'gluten': gluten,
        'vegetariano': vegetariano,
        'porco': porco
      };
}
