class Currency {
  final String value;

  static const Currency TRY = Currency('TRY');
  static const Currency EUR = Currency('EUR');
  static const Currency USD = Currency('USD');
  static const Currency GBP = Currency('GBP');
  static const Currency IRR = Currency('IRR');
  static const Currency NOK = Currency('NOK');
  static const Currency RUB = Currency('RUB');
  static const Currency CHF = Currency('CHF');

  const Currency(this.value);

  @override
  String toString() {
    return value;
  }
}
