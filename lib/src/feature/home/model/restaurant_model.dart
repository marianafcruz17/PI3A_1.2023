class Restaurant {
  final String id;
  double? latitude;
  double? longitude;
  final String name;
  final bool lactose;
  final bool gluten;
  final bool vegetariano;
  final bool porco;
  bool recomendado;
  String distancia;

  Restaurant({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.lactose,
    required this.gluten,
    required this.vegetariano,
    required this.porco,
    required this.recomendado,
    required this.distancia,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      latitude: json['latitude_rest'],
      longitude: json['longitude_rest'],
      name: json['name'],
      lactose: json['lactose_user'],
      gluten: json['gluten_user'],
      vegetariano: json['vegetariano_user'],
      porco: json['porco_user'],
      recomendado: json['recomendado'],
      distancia: json['distancia'],
    );
  }
}
