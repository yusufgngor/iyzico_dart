import 'package:iyzico/iyzipackage.dart';

class BasketItemBuilder {
  final String _id = 'BI101';
  final String _name = 'Binocular';
  final String _category1 = 'Collectibles';
  final String _category2 = 'Accessories';
  // String? _subMerchantKey;
  // String? _subMerchantPrice;
  final String _price = '0.0';

  BasketItem get basketItem => BasketItem(
        id: _id,
        category1: _category1,
        category2: _category2,
        itemType: BasketItemType.PHYSICAL,
        name: _name,
        price: _price,
        // subMerchantKey: _subMerchantKey,
        // subMerchantPrice: _subMerchantPrice,
      );

  List<BasketItem> buildDefaultBasketItems() {
    return <BasketItem>[
      basketItem.copyWith(price: '0.3', category2: null),
      basketItem.copyWith(price: '0.5'),
      basketItem.copyWith(price: '0.2'),
    ];
  }

  List<BasketItem> buildBasketItemsWithSubMerchantKey(String subMerchantKey) {
    var basketItems = <BasketItem>[
      basketItem.copyWith(
        price: '0.3',
        category2: null,
        // subMerchantKey: subMerchantKey,
        // subMerchantPrice: '0.27',
      ),
      basketItem.copyWith(
        price: '0.5',
        category2: null,
        // subMerchantKey: subMerchantKey,
        // subMerchantPrice: '0.42',
      ),
      basketItem.copyWith(
        price: '0.2',
        category2: null,
        // subMerchantKey: subMerchantKey,
        // subMerchantPrice: '0.18',
      ),
    ];
    return basketItems;
  }
}
