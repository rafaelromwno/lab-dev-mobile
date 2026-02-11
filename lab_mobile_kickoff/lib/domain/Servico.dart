class Servico {
  final String id;
  final String titulo;
  final String descricao;

  Servico({
    required this.id,
    required this.titulo,
    required this.descricao,
  });

  Servico copyWith({
    String? id,
    String? titulo,
    String? descricao,
  }) {
    return Servico(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descricao: descricao ?? this.descricao,
    );
  }
}
