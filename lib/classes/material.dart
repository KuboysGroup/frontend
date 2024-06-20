class MaterialEstoque {
  final String? nome;
  final int? quantEstoque;

  MaterialEstoque({this.nome, this.quantEstoque});

  MaterialEstoque copyWith({
    String? nome,
    int? quantEstoque,
  }) {
    return MaterialEstoque(
      nome: nome ?? this.nome,
      quantEstoque: quantEstoque ?? this.quantEstoque,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'quantEstoque': quantEstoque,
    };
  }

  factory MaterialEstoque.fromJson(Map<String, dynamic> json) {
    return MaterialEstoque(
      nome: json['nome'] as String?,
      quantEstoque: json['quantEstoque'] as int?,
    );
  }
}
