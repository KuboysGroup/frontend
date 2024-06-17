import 'package:front_end/classes/dimensoes.dart';

class Produto {
  final String? nome;
  final Dimensoes? dimensoes;
  final bool? tratamentoTermico;

  Produto({
    this.nome,
    this.dimensoes,
    this.tratamentoTermico,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'dimensoes': dimensoes,
      'tratamentoTermico': tratamentoTermico,
    };
  }

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      nome: json['nome'] as String?,
      dimensoes: json['dimensoes'] as Dimensoes?,
      tratamentoTermico: json['tratamentoTermico'] as bool?,
    );
  }
}
