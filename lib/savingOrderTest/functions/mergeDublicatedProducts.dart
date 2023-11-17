
import '../models/productModel.dart';

List<ProductModel> mergeProducts(List<ProductModel> products) {
  Map<String, ProductModel> resultMap = {};

  for (var product in products) {
    DateTime prodExpDate = DateTime.parse(product.expireDate);
    String key = '${product.id}_${product.salePrice}';

    if (resultMap.containsKey(key)) {
      resultMap[key]!.quantity += product.quantity;

      if (prodExpDate.isBefore(DateTime.parse(resultMap[key]!.expireDate))) {
        resultMap[key]!.expireDate = product.expireDate;
      }
    } else {
      resultMap[key] = product;
    }
  }


  return resultMap.values.toList();
}
