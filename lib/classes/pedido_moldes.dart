import 'package:front_end/classes/molde.dart';

class PedidoMoldes {
  final int? id;
  final String? dataEntrega;
  final String? dataPedido;
  final String? status;
  final List<Molde>? produtos;

  PedidoMoldes({
    this.id,
    this.dataEntrega,
    this.dataPedido,
    this.status,
    this.produtos,
  });

  PedidoMoldes copyWith({
    int? id,
    String? dataEntrega,
    String? dataPedido,
    String? status,
    List<Molde>? produtos,
  }) {
    return PedidoMoldes(
      id: id ?? this.id,
      dataEntrega: dataEntrega ?? this.dataEntrega,
      dataPedido: dataPedido ?? this.dataPedido,
      status: status ?? this.status,
      produtos: produtos ?? this.produtos,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dataEntrega': dataEntrega,
      'dataPedido': dataPedido,
      'status': status,
      'produtos': produtos?.map((x) => x.toJson()).toList(),
    };
  }

  factory PedidoMoldes.fromJson(Map<String, dynamic> json) {
    var list = json['produtos'] as List?;
    List<Molde>? produtos = list?.map((i) => Molde.fromJson(i)).toList();

    return PedidoMoldes(
      id: json['id'] as int?,
      dataEntrega: json['dataEntrega'] as String?,
      dataPedido: json['dataPedido'] as String?,
      status: json['status'] as String?,
      produtos: produtos,
    );
  }
}
