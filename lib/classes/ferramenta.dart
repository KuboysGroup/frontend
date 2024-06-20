import 'package:front_end/classes/dimensoes.dart';
import 'package:front_end/classes/material.dart';
import 'package:front_end/classes/produto.dart';

class Ferramenta extends Produto {
  final String? tipoFerramenta;
  final MaterialEstoque? composicao;
  final MaterialEstoque? revestimento;
  final String? finalidade;

  Ferramenta(
      {super.nome,
      super.dimensoes,
      super.tratamentoTermico,
      super.quantidade,
      this.tipoFerramenta,
      this.composicao,
      this.revestimento,
      this.finalidade});

  @override
  Map<String, dynamic> toJson() {
    final produtoJson = super.toJson();
    final ferramentaJson = {
      'tipoFerramenta': tipoFerramenta,
      'composicao': composicao,
      'revestimento': revestimento,
      'finalidade': finalidade
    };
    produtoJson.addAll(ferramentaJson);
    return produtoJson;
  }

  @override
  factory Ferramenta.fromJson(Map<String, dynamic> json) {
    return Ferramenta(
      nome: json['nome'] as String?,
      dimensoes: json['dimensoes'] != null
          ? Dimensoes.fromJson(json['dimensoes'])
          : null,
      tratamentoTermico: json['tratamentoTermico'] as bool?,
      quantidade: json['quantidade'] as int?,
      tipoFerramenta: json['tipoFerramenta'] as String?,
      composicao: json['composicao'] != null
          ? MaterialEstoque.fromJson(json['composicao'])
          : null,
      revestimento: json['revestimento'] != null
          ? MaterialEstoque.fromJson(json['revestimento'])
          : null,
      finalidade: json['finalidade'] as String?,
    );
  }
}
