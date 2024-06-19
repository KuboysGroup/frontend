import 'package:front_end/classes/sistema_camara_quente.dart';

class PedidoSistemaCaramaQuente {
  final int? id;
  final String? dataEntrega;
  final String? dataPedido;
  final String? status;
  final List<SistemaCamaraQuente>? produtos;

  PedidoSistemaCaramaQuente({
    this.id,
    this.dataEntrega,
    this.dataPedido,
    this.status,
    this.produtos,
  });

  PedidoSistemaCaramaQuente copyWith({
    int? id,
    String? dataEntrega,
    String? dataPedido,
    String? status,
    List<SistemaCamaraQuente>? produtos,
  }) {
    return PedidoSistemaCaramaQuente(
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

  factory PedidoSistemaCaramaQuente.fromJson(Map<String, dynamic> json) {
    var list = json['produtos'] as List?;
    List<SistemaCamaraQuente>? produtos =
        list?.map((i) => SistemaCamaraQuente.fromJson(i)).toList();

    return PedidoSistemaCaramaQuente(
      id: json['id'] as int?,
      dataEntrega: json['dataEntrega'] as String?,
      dataPedido: json['dataPedido'] as String?,
      status: json['status'] as String?,
      produtos: produtos,
    );
  }
}
