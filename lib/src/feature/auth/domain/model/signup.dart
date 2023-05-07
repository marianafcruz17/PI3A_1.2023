class SignupUser {
    const SignupUser(this.username, this.email, this.cep, this.birth, this.password,
      this.confirmPassword, this.intoleranciaAlimentar, this.restricaoAlimentar,{this.token});

  final String username;
  final String email;
  final String cep;
  final String birth;
  final String password;
  final String confirmPassword;
  final String intoleranciaAlimentar;
  final String restricaoAlimentar;
  final String? token;

    factory SignupUser.fromJson(Map<String, dynamic> json) => SignupUser(json['username'],
        json['birth'], json['cep'], json['intoleranciaAlimentar'], json['restricaoAlimentar'],
        json['email'], json['password'], json['confirmPassword'],
        token: json['token']);
}
