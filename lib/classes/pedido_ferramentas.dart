import 'package:front_end/classes/ferramenta.dart';

class PedidoFerramentas {
  final int? id;
  final String? dataEntrega;
  final String? dataPedido;
  final String? status;
  final List<Ferramenta>? produtos;

  PedidoFerramentas({
    this.id,
    this.dataEntrega,
    this.dataPedido,
    this.status,
    this.produtos,
  });

  PedidoFerramentas copyWith({
    int? id,
    String? dataEntrega,
    String? dataPedido,
    String? status,
    List<Ferramenta>? produtos,
  }) {
    return PedidoFerramentas(
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

  factory PedidoFerramentas.fromJson(Map<String, dynamic> json) {
    var list = json['produtos'] as List?;
    List<Ferramenta>? produtos =
        list?.map((i) => Ferramenta.fromJson(i)).toList();

    return PedidoFerramentas(
      id: json['id'] as int?,
      dataEntrega: json['dataEntrega'] as String?,
      dataPedido: json['dataPedido'] as String?,
      status: json['status'] as String?,
      produtos: produtos,
    );
  }
}
