import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../functions/mergeDublicatedProducts.dart';
import '../models/productModel.dart';

class ProdcutsRepository {
  Future<List<ProductModel>> getProducts(
    BuildContext context,
  ) async {
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3MiOlsid2FyZWhvdXNlIl0sImlkIjo2NzcsImlhdCI6MTcwMDMwMDQ1NiwiZXhwIjoxNzAwMzQzNjU2fQ.xVEuY9zhYGxhjyAyx7LUUcKxwQEzJV8ovG5GYGGzVT0';
    String endpoint = '/api/v1/temp/goods?warehouseId=35';
    try {
      // final response = await http.get(Uri.parse(ProductionAddress().uri + endpoint),
      final response = await http
          .get(Uri.parse('http://95.85.116.130:233$endpoint'), headers: {
        "accept": "application/json",
        "Authorization": "Bearer $token"
      });
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final mpl = mergeProducts(
            body.map<ProductModel>(ProductModel.fromJson).toList());
        return mpl;
      } else if (response.statusCode == 401) {
        throw Exception();
      } else if (response.statusCode == 500) {
        throw Exception();
      } else {
        throw Exception(response);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
