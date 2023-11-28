import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../functions/formattedPriceFun.dart';

class HistoryCard extends StatelessWidget {
  final String bankName;
  final String remark;
  final String date;
  final String currency;
  final num cash;
  const HistoryCard(
      {super.key,
      required this.bankName,
      required this.date,
      required this.cash,
      this.remark = '',
      required this.currency});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(10)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          
          onExpansionChanged: (bool val) {
            print(val.toString());
          },
           trailing: const SizedBox(),
          children: [
            ListTile(
              title: Text('Prdouct first'),
            ),
            ListTile(
              title: Text('Prdouct first'),
            ),
            ListTile(
              title: Text('Prdouct first'),
            ),
            ListTile(
              title: Text('Prdouct first'),
            ),
          ],
          title: Column(
            children: [
              Text(
                bankName,
                style: TextStyle(fontSize: 14),
              ),
              remark == ''
                  ? const SizedBox()
                  : Text(
                      remark,
                      style: TextStyle(fontSize: 14),
                    ),
              // const SizedBox(
              //   height: 10,
              // ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Date: ',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat('dd.MM.yyyy').format(DateTime.parse(date)),
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Cash',
                        style: TextStyle(
                            color: !cash.isNegative
                                ? Colors.green
                                : Theme.of(context).colorScheme.error,
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        cash != 0
                            ? ' ${justSortPrice(cash.toDouble())} $currency'
                            : ' 0.00 $currency',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
