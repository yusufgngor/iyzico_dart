import '../../RequestStringConvertible.dart';
import '../../ToStringRequestBuilder.dart';

class PaymentCard extends RequestStringConvertible {
  String? cardAlias;
  String cardNumber;
  String expireYear;
  String expireMonth;
  String cvc;
  String cardHolderName;
  int? registerCard;
  String? cardToken;
  String? cardUserKey;

  PaymentCard({
    this.cardAlias,
    required this.cardHolderName,
    required this.cardNumber,
    required this.expireYear,
    required this.expireMonth,
    required this.cvc,
    this.registerCard,
    this.cardToken,
    this.cardUserKey,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (cardAlias != null) data['cardAlias'] = cardAlias;
    data['cardHolderName'] = cardHolderName;
    data['cardNumber'] = cardNumber;
    data['expireYear'] = expireYear;
    data['expireMonth'] = expireMonth;
    data['cvc'] = cvc;
    if (registerCard != null) data['registerCard'] = registerCard;
    if (cardToken != null) data['cardToken'] = cardToken;
    if (cardUserKey != null) data['cardUserKey'] = cardUserKey;

    return data;
  }

  @override
  String toPKIRequestString() => ToStringRequestBuilder.newInstance()
      .append('cardHolderName', cardHolderName)
      .append('cardNumber', cardNumber)
      .append('expireYear', expireYear)
      .append('expireMonth', expireMonth)
      .append('cvc', cvc)
      .append('registerCard', registerCard)
      .append('cardAlias', cardAlias)
      .append('cardToken', cardToken)
      .append('cardUserKey', cardUserKey)
      .getRequestString();
}
