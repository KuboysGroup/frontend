import 'dart:async';
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class NetworkClient {
  static const Duration timeoutDuration = Duration(seconds: 60);
  static const String _domain = 'http://192.168.4.14:8180'; // inserir URL
  static const String _path = '/kugel-web/appcapal'; // inserir path
  final String authorization;

  NetworkClient() : authorization = '';
  NetworkClient.withAuth(this.authorization);

  Uri buildUrl(String resource, [List<String>? paramList]) {
    String params = '';
    if (paramList != null) {
      for (String param in paramList) {
        params += params.isEmpty ? '?$param' : '&$param';
      }
    }
    return Uri.parse(_domain + _path + resource + params);
  }

  Map<String, String> getHeaders() {
    Map<String, String> headers = {};
    if (authorization.isNotEmpty) {
      headers['Authorization'] = authorization;
    }
    headers['Content-Type'] = 'application/json';
    return headers;
  }

  Future<dynamic> get(String resource, [List<String>? paramList]) async {
    final url = buildUrl(resource, paramList);
    debugPrint('GET: $url');
    http.Response response = await http
        .get(
          url,
          headers: getHeaders(),
        )
        .timeout(timeoutDuration,
            onTimeout: () =>
                throw TimeoutException('Tempo limite da requisição excedido.'));
    return processResponse(response);
  }

  Future<dynamic> post(String resource, [Object? body]) async {
    final String jsonBody = jsonEncode(body);
    final url = buildUrl(resource);
    debugPrint('POST: $url');
    http.Response response = await http
        .post(
          url,
          headers: getHeaders(),
          body: jsonBody,
        )
        .timeout(timeoutDuration,
            onTimeout: () =>
                throw TimeoutException('Tempo limite da requisição excedido.'));
    return processResponse(response);
  }

  dynamic processResponse(http.Response response) {
    switch (response.statusCode) {
      case < 200:
        return null;
      case >= 200 && < 300:
        if (response.headers['content-type'] == 'application/json') {
          return jsonDecode(utf8.decode(response.bodyBytes));
        } else {
          return response.body;
        }
      case >= 400 && < 500:
        throw response.body;
      case >= 500:
        throw response.body;
      default:
        throw response.body;
    }
  }
}
