import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../functions/formattedPriceFun.dart';

class ProductCardViewable extends StatelessWidget {
  // final bool isViewable;
  // final ProductModel product;
  // final List orderList;
  // final bool isReviewOrder;
  // final bool isDraftOrder;
  // final int draftOrderIndex;

  // const ProductCardViewable(
  //     {super.key,
  //     this.isViewable = true,
  //     // required this.product,
  //     this.isReviewOrder = false,
  //     this.isDraftOrder = false,
  //     this.orderList = const [],
  //     this.draftOrderIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        onTap: () {
          // isViewable
          //     ? Navigator.of(context)
          //         .pushNamed('/productPageViewable', arguments: {
          //         'product': product,
          //       })
          //     : Navigator.of(context).pushNamed('/productPage', arguments: {
          //         'product': product,
          //         'isEditable': false,
          //         'orderList': orderList,
          //         'isReviewOrder': isReviewOrder,
          //         'isDraftOrder': isDraftOrder,
          //         'draftOrderIndex': draftOrderIndex
          //       });
        },
        title: Row(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                    width: 68,
                    height: 68,
                    child: const Icon(Icons.image_outlined, size: 64)),
              ),
            ],
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                          child: Text(
                        
                            'Продукты питания Детское питание Similac',
                     
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        // product.expireDate == DateTime(0).toString()
                        //     ? '${AppLocalizations.of(context)!.expDate} - '
                        //     : '${AppLocalizations.of(context)!.expDate}${DateFormat('dd.MM.yyyy').format(DateTime.parse(product.expireDate))}',
                             'Date: ${DateFormat('dd.MM.yyyy').format(DateTime.now())}',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                         '4006581016825',
                      style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        //  product.salePrice == 0
                        //     ? '0.00'
                        //     : '${justSortPrice(product.salePrice!.toDouble())} TMT',
                       
                             '${justSortPrice(111)} TMT',
              
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        
                            'In stock 777',
                            style: TextStyle(fontSize: 12),                      
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
