import 'package:front_end/classes/material.dart';

class Componente {
  final String? nome;
  final List<MaterialEstoque>? composicao;
  final int? quantEstoque;

  Componente({
    this.nome,
    this.composicao,
    this.quantEstoque,
  });

  Componente copyWith({
    String? nome,
    List<MaterialEstoque>? composicao,
    int? quantEstoque,
  }) {
    return Componente(
      nome: nome ?? this.nome,
      composicao: composicao ?? List.from(this.composicao!),
      quantEstoque: quantEstoque ?? this.quantEstoque,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'composicao': composicao?.map((x) => x.toJson()).toList(),
      'quantEstoque': quantEstoque,
    };
  }

  factory Componente.fromJson(Map<String, dynamic> json) {
    var list = json['composicao'] as List?;
    List<MaterialEstoque>? composicao =
        list?.map((i) => MaterialEstoque.fromJson(i)).toList();

    return Componente(
      nome: json['nome'] as String?,
      composicao: composicao,
      quantEstoque: json['quantEstoque'] as int?,
    );
  }
}
