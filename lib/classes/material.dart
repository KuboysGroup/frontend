class Material {
  final String? nome;
  final int? quantEstoque;

  Material({this.nome, this.quantEstoque});

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'quantEstoque': quantEstoque,
    };
  }

  factory Material.fromJson(Map<String, dynamic> json) {
    return Material(
      nome: json['nome'] as String?,
      quantEstoque: json['quantEstoque'] as int?,
    );
  }
}
