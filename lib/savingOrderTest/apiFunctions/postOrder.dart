import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

bool isEnabledButtonCreateOrder = true;

class PostOrder {
  Future<dynamic> postOrder(
    bool forConsignment,
    int customerId,
    int payTypeId,
    dynamic creditToDate,
    String comment,
    List<Object> dets,
    DateTime orderDate,
    num orderSum,
    num orderSumWithDiscount,
    BuildContext context,
  ) async {
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3MiOlsid2FyZWhvdXNlIl0sImlkIjo2NzcsImlhdCI6MTcwMDMwMDQ1NiwiZXhwIjoxNzAwMzQzNjU2fQ.xVEuY9zhYGxhjyAyx7LUUcKxwQEzJV8ovG5GYGGzVT0';

    String endpoint = '/api/v1/goodTempOrders';

    Object dataToSend = {
      "forConsignment": forConsignment,
      "customerId": customerId,
      "payTypeId": payTypeId,
      "orderDate": orderDate.toString(),
      "creditToDate": creditToDate == null ? null : creditToDate.toString(),
      "comment": comment == '' ? null : comment,
      "dets": dets,
      "orderSum": orderSum,
      "orderSumWithDiscount": orderSumWithDiscount
    };
    isEnabledButtonCreateOrder = false;
    final response = await http.post(
        Uri.parse('http://95.85.116.130:233$endpoint'),
        body: jsonEncode(dataToSend),
        headers: {
          'accept': 'application/json',
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json'
        });

    if (response.statusCode == 201) {
      final body = jsonDecode(response.body);

      Navigator.pop(context);
      isEnabledButtonCreateOrder = true;
      return body;
    } else if (response.statusCode == 401) {
      isEnabledButtonCreateOrder = true;
      // throw Exception();
    } else if (response.statusCode == 400) {
      isEnabledButtonCreateOrder = true;
      throw Exception();
    } else if (response.statusCode == 500) {
      isEnabledButtonCreateOrder = true;
      // throw Exception();
    } else {}
  }
}
