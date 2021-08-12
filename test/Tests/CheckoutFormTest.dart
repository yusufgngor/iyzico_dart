// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:iyzico/iyzipackage.dart';

import '../MyConstants.dart';
import 'package:test/test.dart';

import '../Builder/AddressBuilder.dart';
import '../Builder/BasketItemBuilder.dart';
import '../Builder/BuyerBuilder.dart';

// RUN TEST WITH FLOWWING CODE
// flutter pub run test test/Tests/CheckOutFormTest.dart
// TO RUN ALL TEST
// flutter pub run test test/Tests/

void main() {
  test('Should_Initialize_Checkout_Form', () async {
    print('started');
    var request = CreateCheckoutFormInitializeRequest(
        callbackUrl: 'https://marufmarket.com/api/iyzi.html',
        conversationId: '123456789',
        currency: Currency.TRY.value,
        basketItems: BasketItemBuilder().buildDefaultBasketItems(),
        buyer: BuyerBuilder().buyer,
        // paymentCard: PaymentCardBuilder().paymentcard,
        shippingAddress: AddressBuilder().shippingAddress,
        enabledInstallments: [1, 2, 3, 6, 9],
        billingAddress: AddressBuilder().billingAddress,
        // installment: 1,
        paidPrice: 1.1,
        price: 1.0);

    final result = await request.create(options);

    // print(result);
    expect(result.status, equals('success'));
    expect(result.locale!, equalsIgnoringCase('tr'));
    expect(result.conversationId, equals('123456789'));
    expect(result.systemTime, isNotNull);
    expect(result.errorCode, isNull);
    expect(result.errorMessage, isNull);
    expect(result.checkoutFormContent, isNotNull);
    expect(result.paymentPageUrl, isNotNull);
  });

  test('Should_Retrieve_Checkout_Form_Result', () async {
    final request = RetrieveCheckoutFormRequest(
        token: '077616ac-6f55-4c41-a6bd-b9a11153e0b7',
        conversationId: '123456789');
    final result = await request.create(options);

    // print(result);
    expect(result.status, equals('success'));
    expect(result.locale!, equalsIgnoringCase('tr'));
    expect(result.conversationId, equals('123456789'));
    expect(result.systemTime, isNotNull);
    expect(result.errorCode, isNull);
    expect(result.errorMessage, isNull);
  });
}
