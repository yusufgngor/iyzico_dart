import '../../RequestStringConvertible.dart';
import '../../ToStringRequestBuilder.dart';

class PaymentCard extends RequestStringConvertible {
  String cardNumber;
  String expireYear;
  String expireMonth;
  String cvc;
  String cardHolderName;
  int? registerCard;

  PaymentCard({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expireYear,
    required this.expireMonth,
    required this.cvc,
    this.registerCard,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cardHolderName'] = cardHolderName;
    data['cardNumber'] = cardNumber;
    data['expireYear'] = expireYear;
    data['expireMonth'] = expireMonth;
    data['cvc'] = cvc;
    data['registerCard'] = registerCard;

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
      .getRequestString();
}
