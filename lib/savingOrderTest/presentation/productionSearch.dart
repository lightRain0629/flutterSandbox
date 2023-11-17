// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_bloc_tests/savingOrderTest/models/productModel.dart';
import 'package:flutter_bloc_tests/savingOrderTest/presentation/productPage.dart';

class ProductionSearch extends SearchDelegate {
  final List<ProductModel> production;
  ProductionSearch({
    required this.production,
  });

  List<ProductModel> results = [];

  @override
  List<Widget>? buildActions(BuildContext context) {}

  @override
  Widget? buildLeading(BuildContext context) {}

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
        itemCount: production.length,
        itemBuilder: (context, index) {
          results = production
              .where((element) =>
                  element.name
                      .toLowerCase()
                      .contains(query.toLowerCase().trim()) ||
                  element.barcode
                      .toString()
                      .contains(query.toLowerCase().trim()) ||
                  element.id.toString().contains(query.toLowerCase().trim()) ||
                  element.goodName
                      .toLowerCase()
                      .contains(query.toLowerCase().trim()))
              .toList();
          final product = production[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: Text(product.name),
              subtitle: Text(product.salePrice.toString()),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductPage(product: product)));
              },
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: production.length,
        itemBuilder: (context, index) {
          results = production
              .where((element) =>
                  element.name
                      .toLowerCase()
                      .contains(query.toLowerCase().trim()) ||
                  element.barcode
                      .toString()
                      .contains(query.toLowerCase().trim()) ||
                  element.id.toString().contains(query.toLowerCase().trim()) ||
                  element.goodName
                      .toLowerCase()
                      .contains(query.toLowerCase().trim()))
              .toList();
          final product = production[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: Text(product.name),
              subtitle: Text(product.salePrice.toString()),
                            onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductPage(product: product)));
              },
            ),
          );
        });
  }
}
