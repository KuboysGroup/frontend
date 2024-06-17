import 'package:front_end/classes/pedido.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AtualizarStatusPedidoRequest {
  static Future<void> atualizarStatusPedido(int? id, Pedido pedido) async {
    try {
      var jsonPedido = jsonEncode(pedido);

      final response = await http.put(
          Uri.parse('http://192.168.4.14:8080/api/pedidos/$id'),
          headers: {'Content-Type': 'application/json'},
          body: jsonPedido);

      print('Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        print('Response Body: ${response.body}');
      } else {
        throw Exception(
            'Falha ao atualizar status do pedido. Status Code: ${response.statusCode}');
      }
    } catch (err) {
      print('Erro ao atualizar status do pedido: $err');
    }
  }
}
