class SignupUser {
  const SignupUser(
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
      {this.token});

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

  factory SignupUser.fromJson(Map<String, dynamic> json) => SignupUser(
      json['username'],
      json['email'],
      json['cep'],
      json['password'],
      json['confirmPassword'],
      json['birth'],
      json['lactose'],
      json['gluten'],
      json['vegetariano'],
      json['porco'],
      token: json['token']);
}
