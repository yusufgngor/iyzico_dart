enum PaymentGroup { PRODUCT, LISTING, SUBSCRIPTION }

extension ParseTopaymentString on PaymentGroup {
  String toShortString() {
    return toString().split('.').last;
  }
}
