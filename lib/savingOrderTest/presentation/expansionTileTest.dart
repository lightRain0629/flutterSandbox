import 'package:flutter/material.dart';
import 'package:flutter_bloc_tests/savingOrderTest/presentation/historyCard.dart';

class ExpansionTileListPage extends StatefulWidget {
  const ExpansionTileListPage({super.key});

  @override
  State<ExpansionTileListPage> createState() => _ExpansionTileListPageState();
}

class _ExpansionTileListPageState extends State<ExpansionTileListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expansion tile test'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemCount: 10,
              itemBuilder: (context, index) => HistoryCard(
                    bankName: 'bankName',
                    date: DateTime.now().toString(),
                    cash: index * 121,
                    currency: 'TMT',
                    remark: 'this is remark for history card',
                  )),
        )

        //  ListView.builder(itemBuilder: (context,index)=> ExpansionPanelList(
        // children: [
        //   ExpansionPanel(headerBuilder: (context, val)=> Text('data'), body: Text(index.toString()))
        // ],
        // ), itemCount: 5,),

        );
  }
}
