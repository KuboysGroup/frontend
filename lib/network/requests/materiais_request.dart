import 'dart:convert';
import 'package:front_end/classes/material.dart';
import 'package:http/http.dart' as http;

class MateriaisRequest {
  static Future<List<MaterialEstoque>> getMateriais() async {
    List<MaterialEstoque> materiaisList = [];
    try {
      final response = await http.get(
        Uri.parse('http://localhost:8080/materiais'),
        headers: {
          'Accept-Charset': 'utf-8',
        },
      );
      print('Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes);
        print('Response Body: $responseBody');
        final List<dynamic> jsonList = jsonDecode(responseBody);
        materiaisList =
            jsonList.map((json) => MaterialEstoque.fromJson(json)).toList();
      } else {
        throw Exception(
            'Falha ao carregar materiais. Status Code: ${response.statusCode}');
      }
    } catch (err) {
      print('Erro ao carregar materiais: $err');
    }
    return materiaisList;
  }

  static Future<void> createMaterial(MaterialEstoque materialEstoque) async {
    try {
      final response =
          await http.post(Uri.parse('http://localhost:8080/materiais'),
              headers: {
                'Content-Type': 'application/json',
              },
              body: jsonEncode(materialEstoque.toJson()));
      print('Status Code: ${response.statusCode}');
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print("Deu bom");
      } else {
        throw Exception(
            'Falha ao incluir material. Status Code: ${response.statusCode}');
      }
    } catch (err) {
      print('Erro ao incluir material: $err');
    }
  }

  static Future<void> updateMaterial(List<MaterialEstoque> lista) async {
    try {
      final response =
          await http.put(Uri.parse('http://localhost:8080/materiais'),
              headers: {
                'Content-Type': 'application/json',
              },
              body: jsonEncode(lista));
      print('Status Code: ${response.statusCode}');
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print("Deu bom");
      } else {
        throw Exception(
            'Falha ao atualizar material. Status Code: ${response.statusCode}');
      }
    } catch (err) {
      print('Erro ao atualizar material: $err');
    }
  }
}
