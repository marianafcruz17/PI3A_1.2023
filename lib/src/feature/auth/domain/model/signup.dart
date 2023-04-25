class User {
    const User(this.username, this.birth, this.allergy, this.illness, this.foodOption, this.email, this.password,
        this.confirmPassword,
        {this.token});

    final String username;
    final String birth;
    final String allergy;
    final String illness;
    final String foodOption;
    final String email;
    final String password;
    final String? token;
    final String birth;
    final String confirmPassword;

    factory User.fromJson(Map<String, dynamic> json) => User(json['username'],
        json['birth'], json['allergy'], json['illness'], json['foodOption'],
        json['email'], json['password'], json['confirmPassword'],
        token: json['token']);
}
