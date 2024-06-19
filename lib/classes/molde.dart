import 'package:front_end/classes/componente.dart';
import 'package:front_end/classes/dimensoes.dart';
import 'package:front_end/classes/produto.dart';

class Molde extends Produto {
  final String? tipoInjecao;
  final String? ramoMolde;
  final List<Componente>? componentes;

  Molde({
    super.nome,
    super.dimensoes,
    super.tratamentoTermico,
    super.quantidade,
    this.tipoInjecao,
    this.ramoMolde,
    this.componentes,
  });

  @override
  Map<String, dynamic> toJson() {
    final produtoJson = super.toJson();
    final moldeJson = {
      'tipoInjecao': tipoInjecao,
      'ramoMolde': ramoMolde,
      'componentes': componentes?.map((x) => x.toJson()).toList(),
    };
    produtoJson.addAll(moldeJson);
    return produtoJson;
  }

  @override
  factory Molde.fromJson(Map<String, dynamic> json) {
    var list = json['componentes'] as List?;
    List<Componente>? componentes =
        list?.map((i) => Componente.fromJson(i)).toList();

    return Molde(
      nome: json['nome'] as String?,
      dimensoes: json['dimensoes'] != null
          ? Dimensoes.fromJson(json['dimensoes'])
          : null,
      tratamentoTermico: json['tratamentoTermico'] as bool?,
      quantidade: json['quantidade'] as int?,
      tipoInjecao: json['tipoInjecao'] as String?,
      ramoMolde: json['ramoMolde'] as String?,
      componentes: componentes,
    );
  }
}
