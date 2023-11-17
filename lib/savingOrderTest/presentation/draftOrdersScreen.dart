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
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Builder(builder: (context) {
                final counterVal = context
                    .select((DraftOrdersCubit cubit) => cubit.state.comment);
                return Text('Cntr ' + counterVal.toString());
              }),
              TextButton(
                  onPressed: () {
                    // context.read<DraftOrdersCubit>().add(AddDraft(
                    //     draft: SendableOrderModel(
                    //         comment: 'not init',
                    //         forConsignment: false,
                    //         orderDate: DateTime(0).toString(),
                    //         creditDate: DateTime(0).toString(),
                    //         orderSum: 0,
                    //         orderSumWithDiscount: 0,
                    //         dets: [],
                    //         customerId: 0,
                    //         payTypeId: 0)));
                    // BlocProvider.of<DraftOrdersCubit>(context).addDraft(
                    //     SendableOrderModel(
                    //         comment: 'not init',
                    //         forConsignment: false,
                    //         orderDate: DateTime(0).toString(),
                    //         creditDate: DateTime(0).toString(),
                    //         orderSum: 0,
                    //         orderSumWithDiscount: 0,
                    //         dets: [],
                    //         customerId: 0,
                    //         payTypeId: 0));
                    context.read<DraftOrdersCubit>().addDraft(
                         );
                  },
                  child: Text('add order'))
            ],
          );
        },
      ),
    );
  }
}
