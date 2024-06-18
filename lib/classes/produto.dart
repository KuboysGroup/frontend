import 'package:front_end/classes/componente.dart';
import 'package:front_end/classes/dimensoes.dart';
import 'package:front_end/classes/material.dart';

class Produto {
  final String? nome;
  final Dimensoes? dimensoes;
  final bool? tratamentoTermico;
  // final String? tipoInjecao;
  // final String? ramoMolde;
  // final List<Componente>? componentes;
  // final String? tipoFerramenta;
  // final Material? composicao;
  // final Material? revestimento;
  // final String? finalidade;
  // final Material? materialResistencia;
  // final double? tempOperacao;

  Produto({
    this.nome,
    this.dimensoes,
    this.tratamentoTermico,
    // this.tipoInjecao,
    // this.ramoMolde,
    // this.componentes,
    // this.tipoFerramenta,
    // this.composicao,
    // this.revestimento,
    // this.finalidade,
    // this.materialResistencia,
    // this.tempOperacao
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'dimensoes': dimensoes?.toJson(),
      'tratamentoTermico': tratamentoTermico,
      // 'tipoInjecao': tipoInjecao ?? '',
      // 'ramoMolde': ramoMolde ?? '',
      // 'componentes': componentes?.map((x) => x.toJson()).toList() ?? '',
      // 'tipoFerramenta': tipoFerramenta ?? '',
      // 'composicao': composicao ?? '',
      // 'revestimento': revestimento ?? '',
      // 'finalidade': finalidade ?? '',
      // 'materialResistencia': materialResistencia ?? '',
      // 'tempOperacao': tempOperacao ?? ''
    };
  }

  factory Produto.fromJson(Map<String, dynamic> json) {
    // var list = json['componentes'] as List?;
    // List<Componente>? componentes =
    //     list?.map((i) => Componente.fromJson(i)).toList();

    return Produto(
      nome: json['nome'] as String?,
      dimensoes: json['dimensoes'] != null
          ? Dimensoes.fromJson(json['dimensoes'])
          : null,
      tratamentoTermico: json['tratamentoTermico'] as bool?,
      // tipoInjecao: json['tipoInjecao'] as String?,
      // ramoMolde: json['ramoMolde'] as String?,
      // componentes: componentes,
      // tipoFerramenta: json['tipoFerramenta'] as String?,
      // composicao: json['composicao'] != null
      //     ? Material.fromJson(json['composicao'])
      //     : null,
      // revestimento: json['revestimento'] != null
      //     ? Material.fromJson(json['revestimento'])
      //     : null,
      // finalidade: json['finalidade'] as String?,
      // materialResistencia: json['materialResistencia'] != null
      //     ? Material.fromJson(json['materialResistencia'])
      //     : null,
      // tempOperacao: (json['tempOperacao'] as num?)?.toDouble()
    );
  }
}
