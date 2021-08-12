enum PaymentChannel {
  MOBILE,
  WEB,
  MOBILE_WEB,
  MOBILE_IOS,
  MOBILE_ANDROID,
  MOBILE_WINDOWS,
  MOBILE_TABLET,
  MOBILE_PHONE
}

extension ParseToString on PaymentChannel {
  String toShortString() {
    return toString().split('.').last;
  }
}
