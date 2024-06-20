import 'dart:convert';
import 'package:front_end/classes/pedido_ferramentas.dart';
import 'package:front_end/classes/pedido_moldes.dart';
import 'package:front_end/classes/pedido_sistema_camara_quente.dart';
import 'package:http/http.dart' as http;

class PedidosRequest {
  static Future<List<PedidoMoldes>> getPedidosMoldes() async {
    List<PedidoMoldes> pedidosMoldesList = [];
    try {
      final response = await http.get(
        Uri.parse('http://192.168.4.14:8080/pedidos/molde'),
        headers: {
          'Accept-Charset': 'utf-8',
        },
      );
      print('Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes);
        print('Response Body: $responseBody');
        final List<dynamic> jsonList = jsonDecode(responseBody);
        pedidosMoldesList =
            jsonList.map((json) => PedidoMoldes.fromJson(json)).toList();
      } else {
        throw Exception(
            'Falha ao carregar pedidos. Status Code: ${response.statusCode}');
      }
    } catch (err) {
      print('Erro ao carregar pedidos: $err');
    }
    return pedidosMoldesList;
  }

  static Future<List<PedidoFerramentas>> getPedidosFerramentas() async {
    List<PedidoFerramentas> pedidosFerramentasList = [];
    try {
      final response = await http.get(
        Uri.parse('http://192.168.4.14:8080/pedidos/ferramenta'),
        headers: {
          'Accept-Charset': 'utf-8',
        },
      );
      print('Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes);
        print('Response Body: $responseBody');
        final List<dynamic> jsonList = jsonDecode(responseBody);
        pedidosFerramentasList =
            jsonList.map((json) => PedidoFerramentas.fromJson(json)).toList();
      } else {
        throw Exception(
            'Falha ao carregar pedidos. Status Code: ${response.statusCode}');
      }
    } catch (err) {
      print('Erro ao carregar pedidos: $err');
    }
    return pedidosFerramentasList;
  }

  static Future<List<PedidoSistemaCaramaQuente>> getPedidosSistemas() async {
    List<PedidoSistemaCaramaQuente> pedidosSistemasList = [];
    try {
      final response = await http.get(
        Uri.parse('http://192.168.4.14:8080/pedidos/sistema'),
        headers: {
          'Accept-Charset': 'utf-8',
        },
      );
      print('Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes);
        print('Response Body: $responseBody');
        final List<dynamic> jsonList = jsonDecode(responseBody);
        pedidosSistemasList = jsonList
            .map((json) => PedidoSistemaCaramaQuente.fromJson(json))
            .toList();
      } else {
        throw Exception(
            'Falha ao carregar pedidos. Status Code: ${response.statusCode}');
      }
    } catch (err) {
      print('Erro ao carregar pedidos: $err');
    }
    return pedidosSistemasList;
  }
}
