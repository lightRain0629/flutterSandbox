// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc_tests/savingOrderTest/apiFunctions/productionRepo.dart';

import 'package:flutter_bloc_tests/savingOrderTest/models/productModel.dart';
import 'package:flutter_bloc_tests/savingOrderTest/presentation/newOrderPage.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;
  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late TextEditingController qtyController;

  @override
  void initState() {
    // TODO: implement initState
    qtyController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          
          Text(widget.product.barcode),
          Text(widget.product.quantity.toString()),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: TextField(
              keyboardType: TextInputType.number,
              controller: qtyController,
              onSubmitted: (val) {
                widget.product.quantityToSold = int.parse(val);
              },
            ),
          ),
          TextButton(
              onPressed: () {
                orderList.add(widget.product);
                Navigator.pop(context);
              },
              child: const Text('Add product'))
        ],
      ),
    );
  }
}
