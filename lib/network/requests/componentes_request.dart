import 'dart:convert';
import 'package:front_end/classes/componente.dart';
import 'package:http/http.dart' as http;

class ComponentesRequest {
  static Future<List<Componente>> getComponentes() async {
    List<Componente> componentesList = [];
    try {
      final response = await http.get(
        Uri.parse('http://192.168.4.14:8080/componentes'),
        headers: {
          'Accept-Charset': 'utf-8',
        },
      );
      print('Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes);
        print('Response Body: $responseBody');
        final List<dynamic> jsonList = jsonDecode(responseBody);
        componentesList =
            jsonList.map((json) => Componente.fromJson(json)).toList();
      } else {
        throw Exception(
            'Falha ao carregar componentes. Status Code: ${response.statusCode}');
      }
    } catch (err) {
      print('Erro ao carregar componentes: $err');
    }
    return componentesList;
  }

  static Future<void> createComponente(Componente componente) async {
    try {
      final response =
          await http.post(Uri.parse('http://192.168.4.14:8080/componentes'),
              headers: {
                'Content-Type': 'application/json',
              },
              body: jsonEncode(componente.toJson()));
      print('Status Code: ${response.statusCode}');
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print("Deu bom");
      } else {
        throw Exception(
            'Falha ao incluir componente. Status Code: ${response.statusCode}');
      }
    } catch (err) {
      print('Erro ao incluir componente: $err');
    }
  }

  static Future<void> updateComponente(List<Componente> lista) async {
    try {
      final response =
          await http.put(Uri.parse('http://192.168.4.14:8080/componentes'),
              headers: {
                'Content-Type': 'application/json',
              },
              body: jsonEncode(lista));
      print('Status Code: ${response.statusCode}');
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print("Deu bom");
      } else {
        throw Exception(
            'Falha ao atualizar componente. Status Code: ${response.statusCode}');
      }
    } catch (err) {
      print('Erro ao atualizar componente: $err');
    }
  }
}
