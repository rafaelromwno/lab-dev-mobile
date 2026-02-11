class Servico {
  final String id;
  final String titulo;
  final String descricao;

  Servico({
    required this.id,
    required this.titulo,
    required this.descricao,
  });

  // JSON -> objeto
  factory Servico.fromJson(Map<String, dynamic> json) {
    return Servico(
      id: json['id'] as String,
      titulo: json['titulo'] as String,
      descricao: json['descricao'] as String,
    );
  }

  // objeto -> JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
    };
  }

  // criar cópia com alterações
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

  @override
  String toString() {
    return 'Servico(id: $id, titulo: $titulo, descricao: $descricao)';
  }
}