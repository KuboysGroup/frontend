import 'package:front_end/classes/material.dart';

class Componente {
  final String? nome;
  final List<Material>? composicao;
  final int? quantEstoque;

  Componente({
    this.nome,
    this.composicao,
    this.quantEstoque,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'composicao': composicao?.map((x) => x.toJson()).toList(),
      'quantEstoque': quantEstoque,
    };
  }

  factory Componente.fromJson(Map<String, dynamic> json) {
    var list = json['composicao'] as List?;
    List<Material>? composicao =
        list?.map((i) => Material.fromJson(i)).toList();

    return Componente(
      nome: json['nome'] as String?,
      composicao: composicao,
      quantEstoque: json['quantEstoque'] as int?,
    );
  }
}
