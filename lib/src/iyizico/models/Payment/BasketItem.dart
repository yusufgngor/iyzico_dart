import '../../RequestStringConvertible.dart';
import '../../ToStringRequestBuilder.dart';
import 'BasketItemType.dart';

class BasketItem extends RequestStringConvertible {
  String id;
  BasketItemType itemType;
  String name;
  String category1;
  String? category2;
  String price;
  String? subMerchantKey;
  String? subMerchantPrice;

  // BasketItem copyWith({
  //   String? id,
  //   String? price,
  //   String? name,
  //   String? category1,
  //   String? category2,
  //   BasketItemType? itemType,
  //   String? subMerchantKey,
  //   String? subMerchantPrice,
  // }) {
  //   return BasketItem(
  //     id: id ?? this.id,
  //     price: price ?? this.price,
  //     name: name ?? this.name,
  //     category1: category1 ?? this.category1,
  //     category2: category2 ?? this.category2,
  //     itemType: itemType ?? this.itemType,
  //     subMerchantKey: subMerchantKey,
  //     subMerchantPrice: subMerchantPrice ?? this.subMerchantPrice,
  //   );
  // }

  BasketItem({
    required this.id,
    required this.price,
    required this.name,
    required this.category1,
    this.category2,
    required this.itemType,
    this.subMerchantKey,
    this.subMerchantPrice,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['name'] = name;
    data['category1'] = category1;
    data['category2'] = category2;
    data['itemType'] = itemType.toShortString();
    data['subMerchantKey'] = subMerchantKey;
    data['subMerchantPrice'] = subMerchantPrice;

    return data;
  }

  @override
  String toPKIRequestString() => ToStringRequestBuilder.newInstance()
      .append('id', id)
      .appendPrice('price', price)
      .append('name', name)
      .append('category1', category1)
      .append('category2', category2)
      .append('itemType', itemType.toShortString())
      .append('subMerchantKey', subMerchantKey)
      .appendPrice('subMerchantPrice', subMerchantPrice)
      .getRequestString();

  BasketItem copyWith({
    String? id,
    String? name,
    String? category1,
    String? category2,
    BasketItemType? itemType,
    String? price,
    String? subMerchantKey,
    String? subMerchantPrice,
  }) {
    return BasketItem(
      id: id ?? this.id,
      name: name ?? this.name,
      category1: category1 ?? this.category1,
      category2: category2 ?? this.category2,
      itemType: itemType ?? this.itemType,
      price: price ?? this.price,
      subMerchantKey: subMerchantKey ?? this.subMerchantKey,
      subMerchantPrice: subMerchantPrice ?? this.subMerchantPrice,
    );
  }
}
