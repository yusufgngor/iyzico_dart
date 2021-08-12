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
// flutter pub run test test/Test/BinNumberTest.dart
// TO RUN ALL TEST
// flutter pub run test test/Tests/

void main() {
  test('Should_Retrieve_Bin', () async {
    final a = Iyzico.fromConfig(configuration: options);
    final result = await a.retrieveBinNumberRequest(
        binNumber: '554960', conversationId: '123456789');
    // print(result);
    expect(result.status, equals('success'));
    expect(result.locale!.toLowerCase(), equals('tr'));
    expect(result.conversationId, equals('123456789'));
    expect(result.systemTime, isNotNull);
    expect(result.errorCode, isNull);
    expect(result.errorMessage, isNull);
    expect(result.binNumber, equals('554960'));
    expect(result.cardType, equals('CREDIT_CARD'));
    expect(result.cardAssociation, equals('MASTER_CARD'));
    expect(result.cardFamily, equals('Bonus'));
    expect(result.bankName, equals('Garanti Bankası'));
    expect(result.commercial, equals(0));
    expect(result.bankCode, equals(62));
  });

  test('Should_Retrieve_Bin_With_Commercial_One', () async {
    final a = Iyzico.fromConfig(configuration: options);

    final result = await a.retrieveBinNumberRequest(
        binNumber: '552659', conversationId: '123456789');

    // print(result);
    expect(result.status, equals('success'));
    expect(result.locale!.toLowerCase(), equals('tr'));
    expect(result.conversationId, equals('123456789'));
    expect(result.systemTime, isNotNull);
    expect(result.errorCode, isNull);
    expect(result.errorMessage, isNull);
    expect(result.binNumber, equals('552659'));
    expect(result.cardType, equals('CREDIT_CARD'));
    expect(result.cardAssociation, equals('MASTER_CARD'));
    expect(result.cardFamily, equals('World'));
    expect(result.bankName, equals('Yapı Kredi Bankası'));
    expect(result.commercial, equals(1));
    expect(result.bankCode, equals(67));
  });
}
