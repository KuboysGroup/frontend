// class Pedido {
//   final int? id;
//   final String? dataEntrega;
//   final String? dataPedido;
//   final String? status;

//   Pedido({
//     this.id,
//     this.dataEntrega,
//     this.dataPedido,
//     this.status,
//   });

//   Pedido copyWith({
//     int? id,
//     String? dataEntrega,
//     String? dataPedido,
//     String? status,
//   }) {
//     return Pedido(
//       id: id ?? this.id,
//       dataEntrega: dataEntrega ?? this.dataEntrega,
//       dataPedido: dataPedido ?? this.dataPedido,
//       status: status ?? this.status,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'dataEntrega': dataEntrega,
//       'dataPedido': dataPedido,
//       'status': status,
//     };
//   }

//   factory Pedido.fromJson(Map<String, dynamic> json) {
//     return Pedido(
//       id: json['id'] as int?,
//       dataEntrega: json['dataEntrega'] as String?,
//       dataPedido: json['dataPedido'] as String?,
//       status: json['status'] as String?,
//     );
//   }
// }
