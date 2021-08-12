// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:iyzico/src/iyizico/RequestFormatter.dart';
import 'package:test/test.dart';

// RUN TEST WITH FLOWWING CODE
// flutter pub run test test/Tests/RequesFormatterTest.dart
// TO RUN ALL TEST
// flutter pub run test test/Tests/

void main() {
  test('Should_Generate_Hash', () {
    expect('0.0', equals(RequestFormatter.formatPrice('0')));
    expect('0.0', equals(RequestFormatter.formatPrice('0.0')));
    expect('1.0', equals(RequestFormatter.formatPrice('1')));
    expect('1.0', equals(RequestFormatter.formatPrice('1.0')));
    expect('1.0', equals(RequestFormatter.formatPrice('1.000')));
    expect('-1.0', equals(RequestFormatter.formatPrice('-1')));
    expect('-1.0', equals(RequestFormatter.formatPrice('-1.0')));
    expect('-1.0', equals(RequestFormatter.formatPrice('-1.000')));
    expect('0.3', equals(RequestFormatter.formatPrice('0.3')));
    expect('-0.3', equals(RequestFormatter.formatPrice('-0.3')));
    expect('10000.0', equals(RequestFormatter.formatPrice('10000')));
    expect('-10000.0', equals(RequestFormatter.formatPrice('-10000')));
    expect(
        '99999999999999999999999999.99999999999999999999999',
        equals(RequestFormatter.formatPrice(
            '99999999999999999999999999.99999999999999999999999')));
    expect(
        '-99999999999999999999999999.99999999999999999999999',
        equals(RequestFormatter.formatPrice(
            '-99999999999999999999999999.99999999999999999999999')));
  });
}
