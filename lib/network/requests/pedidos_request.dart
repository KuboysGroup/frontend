import 'dart:convert';
import 'package:front_end/classes/pedido.dart';
import 'package:http/http.dart' as http;

Future<List<Pedido>> getItem() async {
  final response =
      await http.get(Uri.parse('http://192.168.4.14:8080/api/pedidos'));

  if (response.statusCode == 200) {
    final List<dynamic> responseBody = jsonDecode(response.body);
    List<Pedido> pedidosList =
        responseBody.map((json) => Pedido.fromJson(json)).toList();
    return pedidosList;
  } else {
    throw Exception('Falha ao carregar pedidos');
  }
}
