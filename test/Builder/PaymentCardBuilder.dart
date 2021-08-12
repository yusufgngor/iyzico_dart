import 'package:iyzico/iyzico.dart';

class PaymentCardBuilder {
  final String _cardHolderName = 'John Doe';
  final String _cardNumber = '5528790000000008';
  final String _expireYear = '2030';
  final String _expireMonth = '12';
  final String _cvc = '123';
  final int _registerCard = 0;
  // String _cardAlias = "card alias";
  // String? _cardToken;
  // String? _cardUserKey;

  PaymentCard get paymentcard => PaymentCard(
        cardHolderName: _cardHolderName,
        cardNumber: _cardNumber,
        expireMonth: _expireMonth,
        expireYear: _expireYear,
        registerCard: _registerCard,
        cvc: _cvc,
      );
}
