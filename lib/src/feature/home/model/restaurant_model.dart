class Restaurant {
  final String id;
  double? latitude;
  double? longitude;
  final String name;
  final bool lactose;
  final bool gluten;
  final bool vegetariano;
  final bool porco;

  Restaurant({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.lactose,
    required this.gluten,
    required this.vegetariano,
    required this.porco,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
        id: json['id'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        name: json['name'],
        lactose: json['lactose'],
        gluten: json['gluten'],
        vegetariano: json['vegetariano'],
        porco: json['porco']);
  }
}
