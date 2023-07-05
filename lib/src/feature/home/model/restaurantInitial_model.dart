class Restaurantinicial {
  final String id;
  double? latitude_rest;
  double? longitude_rest;
  double? latitude_user;
  double? longitude_user;
  final String name;
  final bool lactose_rest;
  final bool gluten_rest;
  final bool vegetariano_rest;
  final bool porco_rest;
  final bool lactose_user;
  final bool gluten_user;
  final bool vegetariano_user;
  final bool porco_user;
  final String cardapio;
  bool recomendado;
  double? distancia;

  Restaurantinicial({
    required this.id,
    required this.latitude_rest,
    required this.longitude_rest,
    required this.latitude_user,
    required this.longitude_user,
    required this.name,
    required this.lactose_rest,
    required this.gluten_rest,
    required this.vegetariano_rest,
    required this.porco_rest,
    required this.lactose_user,
    required this.gluten_user,
    required this.vegetariano_user,
    required this.porco_user,
    required this.cardapio,
    required this.recomendado,
    required this.distancia,
  });

  factory Restaurantinicial.fromJson(Map<String, dynamic> json) {
    return Restaurantinicial(
      id: json['id'],
      latitude_rest: json['latitude_rest'],
      longitude_rest: json['longitude_rest'],
      latitude_user: json['latitude_rest'],
      longitude_user: json['longitude_rest'],
      name: json['name'],
      lactose_rest: json['lactose_rest'],
      gluten_rest: json['gluten_rest'],
      vegetariano_rest: json['vegetariano_rest'],
      porco_rest: json['porco_rest'],
      lactose_user: json['lactose_user'],
      gluten_user: json['gluten_user'],
      vegetariano_user: json['vegetariano_user'],
      porco_user: json['porco_user'],
      cardapio: json['cardapio'],
      recomendado: json['recomendacao'],
      distancia: json['distancia'],
    );
  }
}
