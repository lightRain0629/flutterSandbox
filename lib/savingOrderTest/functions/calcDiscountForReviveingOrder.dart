

import '../models/discountsModel.dart';
import '../models/orderDetailsModel.dart';
import 'checkDate.dart';



bool evaluateConditionRev(String? condition, Det product, List<Det> orderList,
    int customerId, List<dynamic> exceptionList) {
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
    List<Det> orderList,
    int groupId,
    List<dynamic>
        exceptionList 
    ) {
  double result = 0;
  for (var product in orderList) {
    if (product.good.group.id == groupId &&
        !exceptionList.contains(product.good.invDetId)) {
      result += product.price * product.quantity;
    }
  }

  return result;
}

double getTypeSum(
    List<Det> orderList,
    int typeId,
    List<dynamic>
        exceptionList 
    ) {
  double result = 0;
  for (var product in orderList) {
    if (product.good.type.id == typeId &&
        !exceptionList.contains(product.good.invDetId)) {
      result += product.price * product.quantity;
    }
  }

  return result;
}

double getBrandSum(
    List<Det> orderList,
    int brandId,
    List<dynamic>
        exceptionList 
    ) {
  double result = 0;
  for (var product in orderList) {
    if (product.good.brand.id == brandId &&
        !exceptionList.contains(product.good.invDetId)) {
      result += product.price * product.quantity;
    }
  }

  return result;
}

double getLineSum(
  List<Det> orderList,
  int id,
) {
  double result = 0;
  for (var product in orderList) {
    if (product.good.id == id) {
      result += product.price * product.quantity;
    }
  }

  return result;
}

double getOrderSumRev(
  List<Det> orderList,
) {
  double result = 0;
  for (var product in orderList) {
    result += product.price * product.quantity;
  }

  return result;
}

double getTypeQuantityRev(
    List<Det> orderList, int typeId, List<dynamic> exceptionList) {
  double result = 0;
  for (var product in orderList) {
    if (product.good.type.id == typeId &&
        !exceptionList.contains(product.good.invDetId)) {
      result += product.quantity;
    }
  }

  return result;
}

double getBrandQuantityRev(
    List<Det> orderList, int brandId, List<dynamic> exceptionList) {
  double result = 0;
  for (var product in orderList) {
    if (product.good.brand.id == brandId &&
        !exceptionList.contains(product.good.invDetId)) {
      result += product.quantity;
    }
  }

  return result;
}

double getGroupQuantityRev(
    List<Det> orderList, int groupId, List<dynamic> exceptionList) {
  double result = 0;
  for (var product in orderList) {
    if (product.good.group.id == groupId &&
        !exceptionList.contains(product.good.invDetId)) {
      result += product.quantity;
    }
  }

  return result;
}

num _getFieldValue(String fieldName, Det product, List<Det> orderList,
    int customerId, List<dynamic> exceptionList) {
  switch (fieldName) {
    case 'group':
      return getGroupSum(orderList, product.good.group.id, exceptionList);
    case 'groupSum':
      return getGroupSum(orderList, product.good.id, exceptionList);
    case 'lineSum':
      return getLineSum(orderList, product.good.invDetId.toInt());
    case 'typeSum':
      return getTypeSum(orderList, product.good.type.id, exceptionList);
    case 'brand':
      return getBrandSum(orderList, product.good.brand.id, exceptionList);
    case 'brandSum':
      return getBrandSum(orderList, product.good.brand.id, exceptionList);
    case 'goodGroupID':
      return product.good.id.toDouble();
    case 'goodTypeID':
      return product.good.type.id.toDouble();
    case 'brandID':
      return product.good.brand.id.toDouble();
    case 'gidID':
      return product.good.invDetId.toDouble();
    case 'customerID':
      return customerId.toDouble();
    case 'price':
      return product.price;
    case 'quantity':
      return product.quantity.toDouble();
    case 'orderSum':
      return getOrderSumRev(orderList);
    case 'typeQuantity':
      return getTypeQuantityRev(orderList, product.good.type.id, exceptionList);
    case 'brandQuantity':
      return getBrandQuantityRev(
          orderList, product.good.brand.id, exceptionList);
    case 'groupQuantity':
      return getGroupQuantityRev(
          orderList, product.good.group.id, exceptionList);
    default:
      throw ArgumentError('Invalid field name: $fieldName');
  }
}


TotalWithAndWithoutDiscount calcDisForReviewingOrder(
    List<Det> products, List<dynamic> discounts, int customerId) {
  double totalWithDiscount = 0;
  double totalWithoutDiscount = 0;
  List<AppliedDiscount> appliedDiscounts = [];
  List<Det> discountedProductsList = [];
  Map<int, Det> discountedProducts = {};

  DateTime currentDate = DateTime.now(); // Получаем текущую дату

  for (var product in products) {
    double maxDiscount = 0;
    num maxDiscountSum = double.infinity;
    String disocuntType = '';
    int appliedDiscountId = -1;
    String description = '';
    for (var discount in discounts) {
      // Проверяем, начала ли скидка действовать

      DateTime beginDate = parseDate(discount.beginDate);
      if (currentDate.isBefore(beginDate)) {
        continue; // Скидка еще не началась, пропускаем ее
      }

      // check for excetpion if product in list this disocunt will be missed
      if (discount.exceptionList.contains(product.good.invDetId)) {
        continue;
      }

      if (discount.discountType == 'percent') {
        if (discount.customerId != null &&
            discount.customerId == customerId &&
            (discount.goodGroupId ?? product.good.group.id) ==
                product.good.group.id &&
            (discount.goodTypeId ?? product.good.type.id) ==
                product.good.type.id &&
            (discount.brandId ?? product.good.brand.id) ==
                product.good.brand.id &&
            (discount.gidId ?? product.good.invDetId) ==
                product.good.invDetId &&
            (discount.condition == ''
                ? true
                : evaluateConditionRev(discount.condition, product, products,
                    customerId, discount.exceptionList ?? []))) {
          maxDiscountSum =
              (product.price - (product.price * (discount.discount / 100))) *
                  product.quantity;
          maxDiscount = discount.discount.toDouble();
          appliedDiscountId = discount.id;
          description = discount.description;
          disocuntType = discount.discountType;
          break;
        } else if ((discount.goodGroupId ?? product.good.group.id) ==
                product.good.group.id &&
            (discount.goodTypeId ?? product.good.type.id) ==
                product.good.type.id &&
            (discount.brandId ?? product.good.brand.id) ==
                product.good.brand.id &&
            (discount.gidId ?? product.good.invDetId) ==
                product.good.invDetId &&
            evaluateConditionRev(discount.condition, product, products,
                customerId, discount.exceptionList ?? []) &&
            discount.customerId == null) {
          if ((product.price - (product.price * (discount.discount / 100))) *
                  product.quantity <
              maxDiscountSum) {
            maxDiscountSum =
                (product.price - (product.price * (discount.discount / 100))) *
                    product.quantity;
            maxDiscount = discount.discount.toDouble();
            appliedDiscountId = discount.id;
            description = discount.description;
            disocuntType = discount.discountType;
          }
        }
      } else if (discount.discountType == 'amount') {
        if (discount.customerId != null &&
            discount.customerId == customerId &&
            (discount.goodGroupId ?? product.good.group.id) ==
                product.good.group.id &&
            (discount.goodTypeId ?? product.good.type.id) ==
                product.good.type.id &&
            (discount.brandId ?? product.good.brand.id) ==
                product.good.brand.id &&
            (discount.gidId ?? product.good.invDetId) ==
                product.good.invDetId &&
            (discount.condition == ''
                ? true
                : evaluateConditionRev(discount.condition, product, products,
                    customerId, discount.exceptionList ?? []))) {
          maxDiscountSum =
              product.quantity * (product.price - discount.discount);
          maxDiscount = discount.discount.toDouble();
          appliedDiscountId = discount.id;
          description = discount.description;
          disocuntType = discount.discountType;
          break;
        } else if ((discount.goodGroupId ?? product.good.group.id) ==
                product.good.group.id &&
            (discount.goodTypeId ?? product.good.type.id) ==
                product.good.type.id &&
            (discount.brandId ?? product.good.brand.id) ==
                product.good.brand.id &&
            (discount.gidId ?? product.good.invDetId) ==
                product.good.invDetId &&
            evaluateConditionRev(discount.condition, product, products,
                customerId, discount.exceptionList ?? []) &&
            discount.customerId == null) {
          if (product.quantity * (product.price - discount.discount) <
              maxDiscountSum) {
            maxDiscountSum =
                product.quantity * (product.price - discount.discount);
            maxDiscount = discount.discount.toDouble();
            appliedDiscountId = discount.id;
            description = discount.description;
            disocuntType = discount.discountType;
          }
        }
      }
    }

    discountedProductsList.add(Det(
        uuid: product.uuid,
        id: product.id,
        good: product.good,
        quantity: product.quantity,
        stockQuantity: product.stockQuantity,
        price: product.price,
        discount: Discount(
            des: description,
            id: appliedDiscountId,
            sum: disocuntType == 'percent'
                ? ((product.price - (product.price * (maxDiscount / 100)))) *
                    product.quantity
                : product.quantity * (product.price - maxDiscount)),
        createdDate: product.createdDate,
        updatedDate: product.updatedDate,
        modifiedBy: product.modifiedBy,
        protocol: product.protocol));
    discountedProductsList.forEach((element) {
    });

    totalWithDiscount += disocuntType == 'percent'
        ? (product.price - (product.price * (maxDiscount / 100))) *
            product.quantity
        : product.quantity * (product.price - maxDiscount);
    totalWithoutDiscount += product.price * product.quantity;

    if (appliedDiscountId != -1) {
      appliedDiscounts.add(AppliedDiscount(
          discount: maxDiscount,
          id: appliedDiscountId,
          description: description));

      discountedProducts.addAll({
        ...discountedProducts,
        product.good.invDetId.toInt():
            // product
            (Det(
                uuid: product.uuid,
                id: product.id,
                good: product.good,
                quantity: product.quantity,
                stockQuantity: product.stockQuantity,
                price: product.price,
                discount: Discount(
                    des: description,
                    id: appliedDiscountId,
                    sum: disocuntType == 'percent'
                        ? ((product.price -
                                (product.price * (maxDiscount / 100)))) *
                            product.quantity
                        : product.quantity * (product.price - maxDiscount)),
                createdDate: product.createdDate,
                updatedDate: product.updatedDate,
                modifiedBy: product.modifiedBy,
                protocol: product.protocol))
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
