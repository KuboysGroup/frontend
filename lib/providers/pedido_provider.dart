// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:front_end/classes/pedido.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// final pedidosProvider =
//     StateNotifierProvider<PedidosNotifier, List<Pedido>>((ref) {
//   return PedidosNotifier();
// });

// class PedidosNotifier extends StateNotifier<List<Pedido>> {
//   PedidosNotifier() : super([]);

//   Future<List<Pedido>> getPedidos() async {
//     List<Pedido> pedidosList = [];
//     try {
//       final response =
//           await http.get(Uri.parse('http://192.168.4.14:8080/api/pedidos'));
//       print('Status Code: ${response.statusCode}');
//       if (response.statusCode == 200) {
//         print('Response Body: ${response.body}');
//         final List<dynamic> responseBody = jsonDecode(response.body);
//         pedidosList =
//             responseBody.map((json) => Pedido.fromJson(json)).toList();
//         state = pedidosList;
//       } else {
//         throw Exception(
//             'Falha ao carregar pedidos. Status Code: ${response.statusCode}');
//       }
//     } catch (err) {
//       print('Erro ao carregar pedidos: $err');
//     }
//     return pedidosList;
//   }
// }
