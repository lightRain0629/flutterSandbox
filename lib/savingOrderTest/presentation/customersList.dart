import 'package:flutter/material.dart';
import 'package:flutter_bloc_tests/savingOrderTest/apiFunctions/customersRepo.dart';
import 'package:flutter_bloc_tests/savingOrderTest/apiFunctions/productionRepo.dart';
import 'package:flutter_bloc_tests/savingOrderTest/presentation/draftOrdersScreen.dart';
import 'package:flutter_bloc_tests/savingOrderTest/presentation/newOrderPage.dart';

import 'draftsOrderList.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DraftsOrderList()));
              },
              icon: const Icon(Icons.drafts))
        ],
        title: const Text('Customers'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: CustomersRepository().getCustomers(context),
          builder: (context, snap) {
            return snap.hasData
                ? ListView.builder(itemBuilder: ((context, index) {
                    final customer = snap.data![index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        title: Text('${customer.name} ${customer.id}'),
                        subtitle: Text('${customer.city} ${customer.district}'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewOrderPage(
                                      customerId: customer.id,
                                      customerName: customer.name)));
                        },
                      ),
                    );
                  }))
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}
