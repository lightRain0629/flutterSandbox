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
      String uri) async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
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

    // final response = await http.post(Uri.parse(ProductionAddress().uri + endpoint),
    final response = await http.post(Uri.parse(uri + endpoint),
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
      Navigator.of(context).pushReplacementNamed('/login');
      // throw Exception();
    } else if (response.statusCode == 400) {
      isEnabledButtonCreateOrder = true;
      throw Exception();
    } else if (response.statusCode == 500) {
      isEnabledButtonCreateOrder = true;
      Navigator.of(context).pushReplacementNamed('/serverErrorPage');
      // throw Exception();
    } else {}
  }
}
