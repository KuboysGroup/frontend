import 'package:front_end/classes/dimensoes.dart';

abstract class Produto {
  final String? nome;
  final Dimensoes? dimensoes;
  final bool? tratamentoTermico;
  final int? quantidade;

  Produto({this.nome, this.dimensoes, this.tratamentoTermico, this.quantidade});

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'dimensoes': dimensoes?.toJson(),
      'tratamentoTermico': tratamentoTermico,
      'quantidade': quantidade
    };
  }
}
