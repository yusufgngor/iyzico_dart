// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:iyzico/src/iyizico/models/Locale.dart';

import '../MyConstants.dart';
import 'package:test/test.dart';

import '../Builder/Request/CreatePaymentRequestBuilder.dart';

// RUN TEST WITH FLOWWING CODE
// flutter pub run test test/Tests/PaymentTest.dart
// TO RUN ALL TEST
// flutter pub run test test/Tests/

void main() {
  test('Should_Create_Listing_Payment', () async {
    var request =
        CreatePaymentRequestBuilder().standardListingPayment().request;
    final payment = await request.create(options);
    // print(payment);

    expect(payment.connectorName, isNull);
    expect(Locale.TR.toString().toLowerCase(), equals(payment.locale));
    expect(payment.status, equals('success'));
    expect(payment.systemTime, isNotNull);
    expect(payment.errorCode, isNull);
    expect(payment.errorMessage, isNull);
    expect(payment.paymentId, isNotNull);
    expect(payment.basketId, isNotNull);
    expect(payment.price, equals(1));
    expect(payment.paidPrice, equals(1.1));

    expect(payment.iyziCommissionRateAmount!, closeTo(.028875, .1));
    expect(payment.iyziCommissionFee!, closeTo(.25, .1));
    expect(payment.merchantCommissionRate!, closeTo(10, .1));
    expect(payment.merchantCommissionRateAmount!, closeTo(.1, .1));
  });
}
