import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/orderModel.dart';

class GetOrders {
  Future<List<OrderModel>> getOrders(BuildContext context) async {
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3MiOlsid2FyZWhvdXNlIl0sImlkIjo2NzcsImlhdCI6MTcwMDIzMTY4NCwiZXhwIjoxNzAwMjc0ODg0fQ._BykHWs_HhJ7vkXjkASHN6aPk3QT1vfkoVP6CXLMPBE';

    String endpoint =
        '/api/v1/goodTempOrders?limit=100&offset=0&orderStatus=accepted';
    final response = await http
        .get(Uri.parse('http://95.85.116.130:233$endpoint'), headers: {
      "accept": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return body.map<OrderModel>(OrderModel.fromJson).toList();
    } else if (response.statusCode == 401) {
      throw Exception();
    } else if (response.statusCode == 500) {
      throw Exception();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
