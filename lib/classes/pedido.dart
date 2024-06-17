import 'package:front_end/classes/produto_pedido.dart';

class Pedido {
  final int? id;
  final List<ProdutoPedido>? produtos;
  final String? dataEntrega;
  final String? dataPedido;
  final String? status;

  Pedido({
    this.id,
    this.produtos,
    this.dataEntrega,
    this.dataPedido,
    this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'produtos': produtos?.map((x) => x.toJson()).toList(),
      'dataEntrega': dataEntrega,
      'dataPedido': dataPedido,
      'status': status,
    };
  }

  factory Pedido.fromJson(Map<String, dynamic> json) {
    var list = json['produtos'] as List?;
    List<ProdutoPedido>? produtos =
        list?.map((i) => ProdutoPedido.fromJson(i)).toList();

    return Pedido(
      id: json['id'] as int?,
      produtos: produtos,
      dataEntrega: json['dataEntrega'] as String?,
      dataPedido: json['dataPedido'] as String?,
      status: json['status'] as String?,
    );
  }
}
