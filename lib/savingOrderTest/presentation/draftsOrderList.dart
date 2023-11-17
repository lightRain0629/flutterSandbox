import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubit/draft_orders_cubit.dart';

class DraftsOrderList extends StatelessWidget {
  const DraftsOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DraftOrdersCubit, DraftOrderState>(
      builder: (context, draftsState) {
        return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: Icon(Icons.repartition),
                  onPressed: () {
                    context.read<DraftOrdersCubit>().clearDrafts();
                  },
                )
              ],
              centerTitle: true,
              title: Text('Drafts'),
            ),
            body: ListView.builder(
                itemCount: draftsState.drafts.length,
                itemBuilder: (context, index) {
                  final draft = draftsState.drafts[index];
                  return ListTile(
                    title: Text(draft.customerId.toString()),
                  );
                }));
      },
    );
  }
}
