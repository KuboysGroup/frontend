import 'package:front_end/classes/dimensoes.dart';
import 'package:front_end/classes/material.dart';
import 'package:front_end/classes/produto.dart';

class SistemaCamaraQuente extends Produto {
  final Material? materialResistencia;
  final double? tempOperacao;

  SistemaCamaraQuente({
    super.nome,
    super.dimensoes,
    super.tratamentoTermico,
    super.quantidade,
    this.materialResistencia,
    this.tempOperacao,
  });

  @override
  Map<String, dynamic> toJson() {
    final produtoJson = super.toJson();
    final ferramentaJson = {
      'materialResistencia': materialResistencia,
      'tempOperacao': tempOperacao,
    };
    produtoJson.addAll(ferramentaJson);
    return produtoJson;
  }

  @override
  factory SistemaCamaraQuente.fromJson(Map<String, dynamic> json) {
    return SistemaCamaraQuente(
      nome: json['nome'] as String?,
      dimensoes: json['dimensoes'] != null
          ? Dimensoes.fromJson(json['dimensoes'])
          : null,
      tratamentoTermico: json['tratamentoTermico'] as bool?,
      quantidade: json['quantidade'] as int?,
      materialResistencia: json['materialResistencia'] as Material?,
      tempOperacao: json['tempOperacao'] as double?,
    );
  }
}
