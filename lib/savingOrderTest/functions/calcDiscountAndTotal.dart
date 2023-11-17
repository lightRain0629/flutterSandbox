
import '../models/discountsModel.dart';
import '../models/productModel.dart';
import 'checkDate.dart';



bool evaluateCondition(String? condition, ProductModel product,
    List<dynamic> orderList, int customerId, List<dynamic> exceptionList) {
  if (condition == null || condition.isEmpty) return true;

  List<String> conditions = condition.split('&&');

  for (var condition in conditions) {
    String fieldNameTest = condition.contains('>=')
        ? condition.split('>=').first.toString()
        : condition.contains('<=')
            ? condition.split('<=').first.toString()
            : condition.contains('==')
                ? condition.split('==').first.toString()
                : condition.contains('>')
                    ? condition.split('>').first.toString()
                    : condition.contains('<')
                        ? condition.split('<').first.toString()
                        : condition.split('==').first.toString();
    String operatorTest = condition.contains('>=')
        ? '>='
        : condition.contains('<=')
            ? '<='
            : condition.contains('==')
                ? '=='
                : condition.contains('>')
                    ? '>'
                    : condition.contains('<')
                        ? '<'
                        : '==';
    double fieldValueTest = condition.contains('>=')
        ? double.parse(condition.split('>=').last)
        : condition.contains('<=')
            ? double.parse(condition.split('<=').last)
            : condition.contains('==')
                ? double.parse(condition.split('==').last)
                : condition.contains('>')
                    ? double.parse(condition.split('>').last)
                    : condition.contains('<')
                        ? double.parse(condition.split('<').last)
                        : double.parse(condition.split('==').last);
    switch (operatorTest) {
      case '<=':
        if (_getFieldValue(
                fieldNameTest, product, orderList, customerId, exceptionList) <=
            fieldValueTest) {
          continue;
        }
        break;
      case '>=':
        if (_getFieldValue(
                fieldNameTest, product, orderList, customerId, exceptionList) >=
            fieldValueTest) {
          continue;
        }
        break;
      case '>':
        if (_getFieldValue(
                fieldNameTest, product, orderList, customerId, exceptionList) >
            fieldValueTest) {
          continue;
        }
        break;
      case '<':
        if (_getFieldValue(
                fieldNameTest, product, orderList, customerId, exceptionList) <
            fieldValueTest) {
          continue;
        }
        break;
      case '==':
        if (_getFieldValue(
                fieldNameTest, product, orderList, customerId, exceptionList) ==
            fieldValueTest) {
          continue;
        }
        break;
    }

    return false; // Если хотя бы одно условие не выполняется, возвращаем false
  }

  return true; // Если все условия выполняются, возвращаем true
}

double getGroupSum(
    List<dynamic> orderList, int groupId, List<dynamic> exceptionList) {
  double result = 0;
  for (var product in orderList) {
    if (product.groupId == groupId &&
        !exceptionList.contains(product.goodInvDetId)) {
      result += product.salePrice! * product.quantityToSold!;
    }
  }

  return result;
}

double getTypeSum(
    List<dynamic> orderList, int typeId, List<dynamic> exceptionList) {
  double result = 0;
  for (var product in orderList) {
    if (product.typeId == typeId &&
        !exceptionList.contains(product.goodInvDetId)) {
      result += product.salePrice! * product.quantityToSold!;
    }
  }

  return result;
}

double getBrandSum(
    List<dynamic> orderList, int brandId, List<dynamic> exceptionList) {
  double result = 0;
  for (var product in orderList) {
    if (product.brandId == brandId &&
        !exceptionList.contains(product.goodInvDetId)) {
      result += product.salePrice! * product.quantityToSold!;
    }
  }

  return result;
}

double getLineSum(
  List<dynamic> orderList,
  int id,
) {
  double result = 0;
  for (var product in orderList) {
    if (product.goodInvDetId == id) {
      result += product.salePrice! * product.quantityToSold!;
    }
  }

  return result;
}

double getOrderSum(
  List<dynamic> orderList,
) {
  double result = 0;
  for (var product in orderList) {
    result += product.salePrice! * product.quantityToSold!;
  }

  return result;
}

double getTypeQuantity(
    List<dynamic> orderList, int typeId, List<dynamic> exceptionList) {
  double result = 0;
  for (var product in orderList) {
    if (product.typeId == typeId &&
        !exceptionList.contains(product.goodInvDetId)) {
      result += product.quantityToSold!;
    }
  }

  return result;
}

double getBrandQuantity(
    List<dynamic> orderList, int brandId, List<dynamic> exceptionList) {
  double result = 0;
  for (var product in orderList) {
    if (product.brandId == brandId &&
        !exceptionList.contains(product.goodInvDetId)) {
      result += product.quantityToSold!;
    }
  }

  return result;
}

double getGroupQuantity(
    List<dynamic> orderList, int groupId, List<dynamic> exceptionList) {
  double result = 0;
  for (var product in orderList) {
    if (product.groupId == groupId &&
        !exceptionList.contains(product.goodInvDetId)) {
      result += product.quantityToSold!;
    }
  }

  return result;
}

num _getFieldValue(String fieldName, dynamic product, List<dynamic> orderList,
    int customerId, List<dynamic> exceptionList) {
  // ? ive added exceptionList for checking excepted products in orderList for calculate true disocunt
  switch (fieldName) {
    case 'group':
      return getGroupSum(orderList, product.groupId, exceptionList);
    case 'groupSum':
      return getGroupSum(orderList, product.groupId, exceptionList);
    case 'lineSum':
      return getLineSum(orderList, product.goodInvDetId!.toInt());
    case 'typeSum':
      return getTypeSum(orderList, product.typeId, exceptionList);
    case 'brand':
      return getBrandSum(orderList, product.brandId, exceptionList);
    case 'brandSum':
      return getBrandSum(orderList, product.brandId, exceptionList);
    case 'goodGroupID':
      return product.groupId.toDouble();
    case 'goodTypeID':
      return product.typeId.toDouble();
    case 'brandID':
      return product.brandId.toDouble();
    case 'gidID':
      return product.goodInvDetId!.toDouble();
    case 'customerID':
      return customerId.toDouble();
    case 'price':
      return product.salePrice!;
    case 'quantity':
      return product.quantityToSold!.toDouble();
    case 'orderSum':
      return getOrderSum(orderList);
    case 'typeQuantity':
      return getTypeQuantity(orderList, product.typeId, exceptionList);
    case 'brandQuantity':
      return getBrandQuantity(orderList, product.brandId, exceptionList);
    case 'groupQuantity':
      return getGroupQuantity(orderList, product.groupId, exceptionList);
    default:
      throw ArgumentError('Invalid field name: $fieldName');
  }
}

TotalWithAndWithoutDiscount calculateTotalWithAndWithoutDiscount(
    List<dynamic> products, List<dynamic> discounts, int customerId) {
  double totalWithDiscount = 0;
  double totalWithoutDiscount = 0;
  List<AppliedDiscount> appliedDiscounts = [];
  List<ProductModel> discountedProductsList = [];
  Map<int, ProductModel> discountedProducts = {};

  DateTime currentDate = DateTime.now(); // Получаем текущую дату

  for (var product in products) {
    double maxDiscount = 0;
    num maxDiscountSum = double.infinity;
    String discountType = '';
    int appliedDiscountId = -1;
    String description = '';

    for (var discount in discounts) {
      // Проверяем, начала ли скидка действовать

      DateTime beginDate = parseDate(discount.beginDate);
      if (currentDate.isBefore(beginDate)) {
        continue; // Скидка еще не началась, пропускаем ее
      }

      if (discount.exceptionList.contains(product.goodInvDetId)) {
        continue;
      }

      if (discount.discountType == 'percent') {
        if (discount.customerId != null &&
            discount.customerId == customerId &&
            (discount.goodGroupId ?? product.groupId) == product.groupId &&
            (discount.goodTypeId ?? product.typeId) == product.typeId &&
            (discount.brandId ?? product.brandId) == product.brandId &&
            (discount.gidId ?? product.goodInvDetId) == product.goodInvDetId &&
            (discount.condition == ""
                ? true
                : evaluateCondition(discount.condition, product, products,
                    customerId, discount.exceptionList ?? []))) {
          maxDiscountSum = (product.salePrice! -
                  (product.salePrice! * (discount.discount / 100))) *
              product.quantityToSold!;
          maxDiscount = discount.discount.toDouble();
          appliedDiscountId = discount.id;
          description = discount.description;
          discountType = discount.discountType;
          break;
        } else if ((discount.goodGroupId ?? product.groupId) ==
                product.groupId &&
            (discount.goodTypeId ?? product.typeId) == product.typeId &&
            (discount.brandId ?? product.brandId) == product.brandId &&
            (discount.gidId ?? product.goodInvDetId) == product.goodInvDetId &&
            (discount.condition == ""
                ? true
                : evaluateCondition(discount.condition, product, products,
                    customerId, discount.exceptionList ?? [])) &&
            discount.customerId == null) {
          if (((product.salePrice! -
                      (product.salePrice! * (discount.discount / 100))) *
                  product.quantityToSold!) <
              maxDiscountSum) {
            maxDiscountSum = (product.salePrice! -
                    (product.salePrice! * (discount.discount / 100))) *
                product.quantityToSold!;
            maxDiscount = discount.discount.toDouble();
            appliedDiscountId = discount.id;
            description = discount.description;
            discountType = discount.discountType;
          }
        }
      } else if (discount.discountType == 'amount') {
        if (discount.customerId != null &&
            discount.customerId == customerId &&
            (discount.goodGroupId ?? product.groupId) == product.groupId &&
            (discount.goodTypeId ?? product.typeId) == product.typeId &&
            (discount.brandId ?? product.brandId) == product.brandId &&
            (discount.gidId ?? product.goodInvDetId) == product.goodInvDetId &&
            (discount.condition == ""
                ? true
                : evaluateCondition(discount.condition, product, products,
                    customerId, discount.exceptionList ?? []))) {
          maxDiscountSum = product.quantityToSold! *
              (product.salePrice! - discount.discount);

          maxDiscount = discount.discount.toDouble();
          appliedDiscountId = discount.id;
          description = discount.description;
          discountType = discount.discountType;
          break;
        } else if ((discount.goodGroupId ?? product.groupId) ==
                product.groupId &&
            (discount.goodTypeId ?? product.typeId) == product.typeId &&
            (discount.brandId ?? product.brandId) == product.brandId &&
            (discount.gidId ?? product.goodInvDetId) == product.goodInvDetId &&
            (discount.condition == ""
                ? true
                : evaluateCondition(discount.condition, product, products,
                    customerId, discount.exceptionList ?? [])) &&
            discount.customerId == null) {
          if ((product.quantityToSold! *
                  (product.salePrice! - discount.discount)) <
              maxDiscountSum) {
            maxDiscountSum = product.quantityToSold! *
                (product.salePrice! - discount.discount);
            maxDiscount = discount.discount.toDouble();
            appliedDiscountId = discount.id;
            description = discount.description;
            discountType = discount.discountType;
          }
        }
      }
    }

    discountedProductsList.add(ProductModel(
        id: product.id,
        name: product.name,
        groupId: product.groupId,
        groupName: product.groupName,
        goodName: product.goodName,
        typeName: product.typeName,
        brandName: product.brandName,
        barcode: product.barcode,
        expireDate: product.expireDate,
        fullGoodName: product.fullGoodName,
        result: product.result,
        unitName: product.unitName,
        quantity: product.quantity,
        brandId: product.brandId,
        forSale: product.forSale,
        priceApproved: product.priceApproved,
        salePrice: product.salePrice,
        typeId: product.typeId,
        unitId: product.unitId,
        goodInvDetId: product.goodInvDetId,
        discount: appliedDiscountId,
        quantityToSold: product.quantityToSold,
        uuid: product.uuid,
        discountedSum: discountType == 'percent'
            ? (product.salePrice! -
                    (product.salePrice! * (maxDiscount / 100))) *
                product.quantityToSold!
            : product.quantityToSold! * (product.salePrice! - maxDiscount),
        discountDescription: description));

    totalWithDiscount += discountType == 'percent'
        ? (product.salePrice! - (product.salePrice! * (maxDiscount / 100))) *
            product.quantityToSold!
        : product.quantityToSold! * (product.salePrice! - maxDiscount);
    totalWithoutDiscount += product.salePrice! * product.quantityToSold!;

    if (appliedDiscountId != -1) {
      appliedDiscounts.add(AppliedDiscount(
        discount: maxDiscount,
        id: appliedDiscountId,
        description: description,
      ));

      discountedProducts.addAll({
        ...discountedProducts,
        product.goodInvDetId!.toInt(): ProductModel(
          id: product.id,
          name: product.name,
          groupId: product.groupId,
          groupName: product.groupName,
          goodName: product.goodName,
          typeName: product.typeName,
          brandName: product.brandName,
          barcode: product.barcode,
          expireDate: product.expireDate,
          fullGoodName: product.fullGoodName,
          result: product.result,
          quantityToSold: product.quantityToSold,
          unitName: product.unitName,
          quantity: product.quantity,
          brandId: product.brandId,
          forSale: product.forSale,
          priceApproved: product.priceApproved,
          salePrice: product.salePrice,
          typeId: product.typeId,
          unitId: product.unitId,
          goodInvDetId: product.goodInvDetId,
          discount: appliedDiscountId,
          discountDescription: description,
        )
      });
    }
  }

  return TotalWithAndWithoutDiscount(
      totalWithDiscount: totalWithDiscount,
      totalWithoutDiscount: totalWithoutDiscount,
      appliedDiscounts: appliedDiscounts,
      discountedProducts: discountedProducts,
      productList: discountedProductsList);
}
