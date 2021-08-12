class RequestFormatter {
  static String formatPrice(String price) {
    if (!price.contains('.')) {
      return price + '.0';
    }
    var subStrIndex = 0;
    var priceReversed = price.split('').reversed.join();
    for (var i = 0; i < priceReversed.length; i++) {
      if (priceReversed[i] == '0') {
        subStrIndex = i + 1;
      } else if (priceReversed[i] == '.') {
        priceReversed = '0' + priceReversed;
        break;
      } else {
        break;
      }
    }
    return priceReversed.substring(subStrIndex).split('').reversed.join();
  }
}
