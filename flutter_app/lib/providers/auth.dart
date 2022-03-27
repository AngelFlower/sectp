import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_app/services/http_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:platform_device_id/platform_device_id.dart';

import 'package:flutter_app/models/user.dart';

import 'package:http/http.dart' as http;

class Auth extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  bool _isAuth = false;
  late User _user;

  bool get isAuth => _isAuth;
  User get user => _user;

  Future login({required Map credentials}) async {
    String deviceID = await getDeviceID();

    log('device ID: $deviceID');

    http.Response response = await HttpService().login(credentials, deviceID);

    String token = jsonDecode(response.body)['token'];

    await attempt(token);

    storeToke(token);
  }

  String removeLastChars(String str, int chars) {
    return str.substring(0, str.length - chars);
  }

  Future attempt(String token) async {
    try {
      http.Response response = await HttpService().user(token);
      log(response.body);

      _user = User.fromJson(jsonDecode(response.body)['data']);
      _isAuth = true;
      notifyListeners();
    } catch (e) {
      _isAuth = false;
      log('message: $e');
    }
    log(_isAuth.toString());
  }

  storeToke(String token) async {
    await storage.write(key: 'auth', value: token);
  }

  Future getToken() async {
    return await storage.read(key: 'auth');
  }

  deleteToken() async {
    await storage.delete(key: 'auth');
  }

  Future getDeviceID() async {
    String? deviceID;
    try {
      deviceID = await PlatformDeviceId.getDeviceId;
      log('Device ID: $deviceID');
    } catch (e) {
      log('Error: $e');
    }

    return deviceID;
  }

  void logout() async {
    _isAuth = false;

    await HttpService()
        .delete(url: 'logout', auth: true, data: {'token': await getToken()});

    await deleteToken();

    notifyListeners();
  }
}
