// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tests/savingOrderTest/apiFunctions/productionRepo.dart';
import 'package:flutter_bloc_tests/savingOrderTest/models/productModel.dart';
import 'package:flutter_bloc_tests/savingOrderTest/models/sendableOrderModel.dart';
import 'package:flutter_bloc_tests/savingOrderTest/presentation/productPage.dart';
import 'package:flutter_bloc_tests/savingOrderTest/presentation/productionSearch.dart';

import '../logic/cubit/draft_orders_cubit.dart';

List<ProductModel> orderList = [];

class NewOrderPage extends StatefulWidget {
  final int customerId;
  final String customerName;

  const NewOrderPage({
    Key? key,
    required this.customerId,
    required this.customerName,
  }) : super(key: key);

  @override
  State<NewOrderPage> createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {
  @override
  void initState() {
    // TODO: implement initState
    orderList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ProdcutsRepository().getProducts(context),
        builder: (context, snap) {
          print(snap.data);
          if (snap.hasData) {
            return BlocBuilder<DraftOrdersCubit, DraftOrderState>(
              builder: (context, state) {
                return Scaffold(
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      showSearch(
                          context: context,
                          delegate: ProductionSearch(production: snap.data!));
                    },
                    child: const Icon(Icons.add),
                  ),
                  appBar: AppBar(
                    actions: [
                      IconButton(
                          onPressed: () {
                            context.read<DraftOrdersCubit>().addDraft(
                                SendableOrderModel(
                                    forConsignment: false,
                                    customerId: widget.customerId,
                                    payTypeId: 0,
                                    orderDate: '',
                                    creditDate: '',
                                    comment: 'send',
                                    dets: List.generate(
                                        orderList.length,
                                        (index) => SendableProductModel(
                                            goodId: orderList[index].id,
                                            goodInvDetId:
                                                orderList[index].goodInvDetId!,
                                            expDate:
                                                orderList[index].expireDate,
                                            quantityToSold:
                                                orderList[index].quantityToSold,
                                            price: (orderList[index]
                                                    .priceToSold! *
                                                orderList[index].salePrice!),
                                            discountId: 0,
                                            discountSum: 0,
                                            id: 0)),
                                    orderSum: 0,
                                    orderSumWithDiscount: 0));
                          },
                          icon: Icon(Icons.save)),
                      IconButton(
                          onPressed: () {
                            setState(() {});
                          },
                          icon: Icon(Icons.refresh))
                    ],
                    centerTitle: true,
                    title: Text(widget.customerName),
                  ),
                  body: ListView.builder(
                      itemCount: orderList.length,
                      itemBuilder: (context, index) {
                        final product = orderList[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            title: Text(product.name),
                            subtitle: Text(product.quantityToSold.toString()),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductPage(product: product)));
                            },
                          ),
                        );
                      }),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
