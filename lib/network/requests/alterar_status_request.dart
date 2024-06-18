import 'dart:convert';
import 'package:front_end/classes/pedido.dart';
import 'package:http/http.dart' as http;

class AtualizarStatusPedidoRequest {
  static Future<void> atualizarStatusPedido(int? id, Pedido pedido) async {
    try {
      final response = await http.put(
        Uri.parse('http://192.168.4.14:8080/pedidos/$id'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(pedido.toJson()),
      );
      print('Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        print('Response Body: ${response.body}');
      } else {
        throw Exception(
            'Falha ao alterar status. Status Code: ${response.statusCode}');
      }
    } catch (err) {
      print('Falha ao alterar status: $err');
    }
  }
}
