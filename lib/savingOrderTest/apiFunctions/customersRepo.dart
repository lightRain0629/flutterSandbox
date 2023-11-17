import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/customersModel.dart';

class CustomersRepository {
  Future<List<CustomersModel>> getCustomers(
    BuildContext context,
  ) async {
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3MiOlsid2FyZWhvdXNlIl0sImlkIjo2NzcsImlhdCI6MTcwMDIzMTY4NCwiZXhwIjoxNzAwMjc0ODg0fQ._BykHWs_HhJ7vkXjkASHN6aPk3QT1vfkoVP6CXLMPBE';

    String endpoint = '/api/v1/temp/customers?limit=10&offset=0';
    // final response = await http.get(Uri.parse(ProductionAddress().uri + endpoint),
    final response = await http
        .get(Uri.parse('http://95.85.116.130:233$endpoint'), headers: {
      "accept": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return body.map<CustomersModel>(CustomersModel.fromJson).toList();
    } else if (response.statusCode == 401) {
      throw Exception();
    } else if (response.statusCode == 500) {
      throw Exception();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
