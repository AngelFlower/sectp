import 'dart:convert';
import 'dart:developer';
// ignore: library_prefixes
import 'package:dio/dio.dart' as Dio;
import 'package:flutter_app/models/fish_tank.dart';
import 'package:flutter_app/models/temperature.dart';
import 'package:flutter_app/providers/auth.dart';
import 'package:http/http.dart' as http;

import 'dio.dart';

class HttpService {
  final baseURL = 'http://10.0.2.2:8000/api/v1';

  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<http.Response> login(Map credentials, String deviceID) async {
    final response = await http.post(
      Uri.parse('$baseURL/login'),
      body: json.encode(credentials..addAll({'device_id': deviceID})),
      headers: requestHeaders,
    );

    log(response.body);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<http.Response> user(String token) async {
    final response = await http.get(
      Uri.parse('$baseURL/user'),
      headers: requestHeaders
        ..addAll({
          'Authorization': 'Bearer $token',
        }),
    );

    log(requestHeaders.toString());
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to get user');
    }
  }

  Future<dynamic> get({
    required String url,
    required bool auth,
  }) async {
    final respuesta = await http.get(Uri.parse('$baseURL/$url'),
        headers: await _getHeaders(auth: auth));

    if (respuesta.statusCode == 200) {
      return jsonDecode(respuesta.body);
    } else {
      throw Exception('Failed to get data');
    }
  }

  Future<Map<String, String>> _getHeaders({
    required bool auth,
  }) async {
    if (auth) {
      final token = await Auth().getToken();
      return requestHeaders..addAll({'Authorization': 'Bearer $token'});
    } else {
      return requestHeaders;
    }
  }
}
