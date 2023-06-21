class Cardapios {
  final String id;
  final String nome;
  final String valor;
  final List<String> ingredientes;
  final bool lactose;
  final bool gluten;
  final bool vegetariano;
  final bool porco;

  Cardapios(
      {required this.id,
      required this.nome,
      required this.valor,
      required this.ingredientes,
      required this.lactose,
      required this.gluten,
      required this.vegetariano,
      required this.porco});

  factory Cardapios.fromJson(Map<String, dynamic> json) {
    return Cardapios(
        id: json['id'],
        nome: json['nome'],
        valor: json['valor'],
        ingredientes: json['ingredientes'],
        lactose: json['lactose'],
        gluten: json['gluten'],
        vegetariano: json['vegetariano'],
        porco: json['porco']);
  }
}
