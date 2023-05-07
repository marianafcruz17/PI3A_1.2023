import 'package:marmita_social/src/Feature/auth/domain/model/signup.dart';

class SignUpDto {
     const SignUpDto(this.username, this.email, this.cep, this.birth, this.password,
      this.confirmPassword, this.intoleranciaAlimentar, this.restricaoAlimentar, this.token);

  final String username;
  final String email;
  final String cep;
  final String birth;
  final String password;
  final String confirmPassword;
  final String intoleranciaAlimentar;
  final String restricaoAlimentar;
  final String? token;

  factory SignUpDto.fromDomain(SignupUser user) {
    return SignUpDto(
        user.username,
        user.email,
        user.birth,
        user.password,
        user.confirmPassword,
        user.cep,
        user.intoleranciaAlimentar,
        user.restricaoAlimentar,
        user.token);
  }

  factory SignUpDto.fromJson(Map<String, dynamic> json) => SignUpDto(
        json['username'],
        json['email'],
        json['birth'],
        json['password'],
        json['confirmPassword'],
        json['cep'],
        json['intoleranciaAlimentar'],
        json['restricaoAlimentar'],
        json['token']
      );

  Map<String, dynamic> toJson() => {
        'login': username,
        'password': password,
        'email': email,
        'cep': cep,
        'admin': false,
        'dataNascimento': birth,
        'intoleranciaAlimentar': intoleranciaAlimentar,
        'restricaoAlimentar': restricaoAlimentar,
      };
}
