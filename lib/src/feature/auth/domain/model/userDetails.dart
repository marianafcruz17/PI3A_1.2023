class Userdetails {
  const Userdetails(this.vegetariano, this.gluten, this.lactose, this.porco);

  final bool vegetariano;
  final bool gluten;
  final bool lactose;
  final bool porco;

  factory Userdetails.fromJson(Map<String, dynamic> json) => Userdetails(
        json['vegetariano'],
        json['gluten'],
        json['lactose'],
        json['porco'],
      );

  Map<String, dynamic> toJson() => {
        'vegetariano': vegetariano,
        'gluten': gluten,
        'lactose': lactose,
        'porco': porco
      };
}
