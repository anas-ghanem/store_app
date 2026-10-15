import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> getData({required String url,@required token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "bearer $token"});
    }
    http.Response response = await http.get(Uri.parse(url),headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data from API ${response.statusCode}');
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "bearer $token"});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    Map<String, dynamic> data = jsonDecode(response.body);

    return data;
  }

  Future<dynamic> put({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type':'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({"Authorization": "bearer $token"});
    }
    print('url: $url');
    print('body: $body');
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    
    Map<String, dynamic> data = jsonDecode(response.body);

    return data;
  }
}
