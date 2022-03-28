import 'dart:convert';
import 'dart:developer';
import 'package:flutter_app/providers/auth.dart';
import 'package:http/http.dart' as http;

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
    final response = await http.get(Uri.parse('$baseURL/$url'),
        headers: await _getHeaders(auth: auth));

    //log(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get data');
    }
  }

  Future<dynamic> post({
    required String url,
    required bool auth,
    required Map<String, dynamic> data,
  }) async {
    final response = await http.post(Uri.parse('$baseURL/$url'),
        headers: await _getHeaders(auth: auth), body: json.encode(data));

    log(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }

  Future<dynamic> delete(
      {required String url,
      required bool auth,
      required Map<String, String> data}) async {
    final response = await http.delete(Uri.parse('$baseURL/$url'),
        headers: await _getHeaders(auth: auth), body: json.encode(data));

    log(response.body);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
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
