import 'package:front_end/classes/produto.dart';

class ProdutoPedido {
  final Produto? produto;
  final int? quantidade;

  ProdutoPedido({this.produto, this.quantidade});

  Map<String, dynamic> toJson() {
    return {
      'produto': produto?.toJson(),
      'quantidade': quantidade,
    };
  }

  factory ProdutoPedido.fromJson(Map<String, dynamic> json) {
    return ProdutoPedido(
      produto:
          json['produto'] != null ? Produto.fromJson(json['produto']) : null,
      quantidade: json['quantidade'] as int?,
    );
  }
}
