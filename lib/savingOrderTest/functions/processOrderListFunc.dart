

import '../models/productModel.dart';
import 'calcDiscountAndTotal.dart';

List<dynamic> processOrderList(
    List<dynamic> orderList,
    List<dynamic> notMergedProductList,
    List<dynamic> disocunts,
    int customerId) {
  List<dynamic> processedList = [];

  final sortedListByExpDate = sortProductsByExpireDate(notMergedProductList);

  for (var product in orderList) {
    var remainingQuantity = product.quantityToSold!;

    for (var mergedProduct in sortedListByExpDate) {
      if (product.id == mergedProduct.id &&
          product.salePrice == mergedProduct.salePrice) {
        var availableQuantity = mergedProduct.quantity;

        if (availableQuantity >= remainingQuantity) {
          processedList.add(
            ProductModel(
                goodName: mergedProduct.goodName,
                result: mergedProduct.result,
                id: mergedProduct.id,
                name: mergedProduct.name,
                goodInvDetId: mergedProduct.goodInvDetId,
                groupId: mergedProduct.groupId,
                quantity: mergedProduct.quantity,
                brandId: mergedProduct.brandId,
                barcode: mergedProduct.barcode,
                groupName: mergedProduct.groupName,
                typeName: mergedProduct.typeName,
                fullGoodName: mergedProduct.fullGoodName,
                unitId: mergedProduct.unitId,
                typeId: mergedProduct.typeId,
                salePrice: mergedProduct.salePrice,
                brandName: mergedProduct.barcode,
                unitName: mergedProduct.unitName,
                forSale: mergedProduct.forSale,
                priceApproved: mergedProduct.priceApproved,
                quantityToSold: remainingQuantity,
                expireDate: mergedProduct.expireDate,
                discount: product.discount,
                discountDescription: product.discountDescription,
                discountedSum: product.discountedSum),
          );
          remainingQuantity = 0;
          break;
        } else {
          processedList.add(
            ProductModel(
                goodName: mergedProduct.goodName,
                result: mergedProduct.result,
                id: mergedProduct.id,
                name: mergedProduct.name,
                goodInvDetId: mergedProduct.goodInvDetId,
                groupId: mergedProduct.groupId,
                quantity: mergedProduct.quantity,
                brandId: mergedProduct.brandId,
                barcode: mergedProduct.barcode,
                groupName: mergedProduct.groupName,
                typeName: mergedProduct.typeName,
                fullGoodName: mergedProduct.fullGoodName,
                unitId: mergedProduct.unitId,
                typeId: mergedProduct.typeId,
                salePrice: mergedProduct.salePrice,
                brandName: mergedProduct.barcode,
                unitName: mergedProduct.unitName,
                forSale: mergedProduct.forSale,
                priceApproved: mergedProduct.priceApproved,
                quantityToSold: availableQuantity,
                expireDate: mergedProduct.expireDate,
                discount: product.discount,
                discountDescription: product.discountDescription,
                discountedSum: product.discountedSum),
          );
          remainingQuantity -= availableQuantity;
        }
      }
    }
  }

  final res = calculateTotalWithAndWithoutDiscount(
      processedList, disocunts, customerId);
  return res.productList;
}

List<dynamic> sortProductsByExpireDate(List<dynamic> productList) {
  productList.sort((a, b) => a.expireDate.compareTo(b.expireDate));
  return productList;
}
