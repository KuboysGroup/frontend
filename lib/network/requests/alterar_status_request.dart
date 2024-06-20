import 'dart:convert';
import 'package:front_end/classes/pedido_ferramentas.dart';
import 'package:front_end/classes/pedido_moldes.dart';
import 'package:front_end/classes/pedido_sistema_camara_quente.dart';
import 'package:http/http.dart' as http;

class AtualizarStatusPedidoRequest {
  static Future<void> atualizarStatusPedidoMolde(
      int? id, PedidoMoldes pedido) async {
    try {
      final response = await http.put(
        Uri.parse('http://192.168.4.14:8080/pedidos/molde/$id'),
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

  static Future<void> atualizarStatusPedidoFerramentas(
      int? id, PedidoFerramentas pedido) async {
    try {
      final response = await http.put(
        Uri.parse('http://192.168.4.14:8080/pedidos/ferramenta/$id'),
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

  static Future<void> atualizarStatusPedidoSistema(
      int? id, PedidoSistemaCaramaQuente pedido) async {
    try {
      final response = await http.put(
        Uri.parse('http://192.168.4.14:8080/pedidos/sistema/$id'),
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
