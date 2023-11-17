import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tests/savingOrderTest/models/sendableOrderModel.dart';

import '../logic/cubit/draft_orders_cubit.dart';

// import '../logic/bloc/draft_orders_bloc.dart';

class DraftOrderScreen extends StatelessWidget {
  const DraftOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DraftOrdersCubit, DraftOrderState>(
        builder: (context, ordersState) {
          return Stack(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: ordersState.drafts.length,
                    itemBuilder: ((context, index) {
                      final draft = ordersState.drafts[index];
                      return ListTile(
                        title: Text(draft.comment),
                      );
                    })),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: const Icon(
                    Icons.delete,
                  ),
                  onPressed: () {
                    context.read<DraftOrdersCubit>().clearDrafts();
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                    onPressed: () {
                      context.read<DraftOrdersCubit>().addDraft(
                          SendableOrderModel(
                              forConsignment: false,
                              customerId: 0,
                              payTypeId: 0,
                              orderDate: '',
                              creditDate: '',
                              comment: Random.secure().nextDouble().toString(),
                              dets: [],
                              orderSum: 0,
                              orderSumWithDiscount: 0));
                    },
                    child: const Text('Add draft')),
              )
            ],
          );
        },
      ),
    );
  }
}
