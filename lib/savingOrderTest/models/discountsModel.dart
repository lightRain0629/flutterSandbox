

class AppliedDiscount {
  String description;
  double discount;
  int id;

  AppliedDiscount({
    required this.discount,
    required this.id,
    required this.description,
  });
}

class TotalWithAndWithoutDiscount {
  num totalWithDiscount;
  num totalWithoutDiscount;
  List<AppliedDiscount> appliedDiscounts;
  Map<int, dynamic> discountedProducts;
  List <dynamic> productList;
 

  TotalWithAndWithoutDiscount(
      {required this.totalWithDiscount,
      required this.totalWithoutDiscount,
      required this.appliedDiscounts,
      required this.discountedProducts,
      required this.productList,
       });
}