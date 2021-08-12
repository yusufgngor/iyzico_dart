enum BasketItemType { PHYSICAL, VIRTUAL }

extension ParseToShortBasketString on BasketItemType {
  String toShortString() {
    return toString().split('.').last;
  }
}
