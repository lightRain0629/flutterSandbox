import 'package:intl/intl.dart';


formatedPrice(double price) {
  String res = NumberFormat('#.00').format(price);

  return res;
}

justSortPrice(double price) {
  List priceString = NumberFormat('#.00').format(price).split('');
  List priceStringReversed = priceString.reversed.toList();
  for (var i = 0; i < priceStringReversed.length; i++) {
    if (priceStringReversed[1] == '.') {
      priceStringReversed.insert(i, '0');
    } else {
      if (priceStringReversed[2] == '.') {
        if (i == 6) {
          priceStringReversed.insert(i, ' ');
        } else if (i == 10) {
          priceStringReversed.insert(i, ' ');
        } else if (i == 14) {
          priceStringReversed.insert(i, ' ');
        } else if (i == 19) {
          priceStringReversed.insert(i, ' ');
        }
        ;
      } else if (priceStringReversed[i] != '.') {
        priceStringReversed.removeAt(i);
      }
    }
  }
  return (priceStringReversed.reversed.toList().join(''));
}