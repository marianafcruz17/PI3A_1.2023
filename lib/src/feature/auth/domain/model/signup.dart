class SignupUser {
    const SignupUser(this.username, this.email, this.cep, this.birth, this.password,
      this.confirmPassword, this.intoleranciaAlimentar, this.restricaoAlimentar,{this.token});

  final String username;
  final String email;
  final String cep;
  final String birth;
  final String password;
  final String confirmPassword;
  final List<String> intoleranciaAlimentar;
  final List<String> restricaoAlimentar;
  final String? token;

    factory SignupUser.fromJson(Map<String, dynamic> json) => SignupUser(
      json['username'],
      json['email'],
      json['cep'],
      json['password'], 
      json['confirmPassword'],
      json['birth'], 
      json['intoleranciaAlimentar'], 
      json['restricaoAlimentar'],
         
        token: json['token']);
}
