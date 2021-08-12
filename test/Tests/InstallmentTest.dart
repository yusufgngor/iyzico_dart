// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:iyzico/iyzico.dart';

import '../MyConstants.dart';
import 'package:test/test.dart';

// RUN TEST WITH FLOWWING CODE
// flutter pub run test test/Tests/Installment.dart
// TO RUN ALL TEST
// flutter pub run test test/Tests/

void main() {
  test('Should_Retrieve_Installments', () async {
    final a = Iyzico.fromConfig(configuration: options);

    final installmentInfo = await a.retrieveInstallmentInfoRequest(
        price: 100, binNumber: '554960', conversationId: '123456789');

    // print(installmentInfo);

    expect(installmentInfo.status, equals('success'));
    expect(installmentInfo.locale!.toLowerCase(), equals('tr'));
    expect(installmentInfo.conversationId, equals('123456789'));
    expect(installmentInfo.installmentDetails, isNotNull);
    expect(installmentInfo.installmentDetails!.first, isNotNull);
    expect(
        installmentInfo.installmentDetails!.first.binNumber, equals('554960'));
    expect(installmentInfo.installmentDetails!.first.price, equals(100));
    expect(installmentInfo.installmentDetails!.first.cardType,
        equals('CREDIT_CARD'));
    expect(installmentInfo.installmentDetails!.first.cardAssociation,
        equals('MASTER_CARD'));
    expect(installmentInfo.installmentDetails!.first.cardFamilyName,
        equals('Bonus'));
    expect(installmentInfo.installmentDetails!.first.commercial, equals(0));

    expect(
        installmentInfo.installmentDetails!.first.installmentPrices!.first!
            .installmentNumber,
        isNotNull);
    expect(
        installmentInfo
            .installmentDetails!.first.installmentPrices!.first!.totalPrice,
        isNotNull);
    expect(
        installmentInfo.installmentDetails!.first.installmentPrices!.first!
            .installmentPrice,
        isNotNull);

    expect(installmentInfo.systemTime, isNotNull);
    expect(installmentInfo.errorCode, isNull);
    expect(installmentInfo.errorMessage, isNull);

    expect(installmentInfo.installmentDetails!.isEmpty, isFalse);
  });
}
