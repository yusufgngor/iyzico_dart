// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:iyzico/src/iyizico/ToStringRequestBuilder.dart';
import 'package:iyzico/src/iyizico/models/Locale.dart';
import 'package:test/test.dart';

// RUN TEST WITH FLOWWING CODE
// flutter pub run test test/Tests/RequesFormatterTest.dart
// TO RUN ALL TEST
// flutter pub run test test/Tests/

void main() {
  test('Should_Append_And_Convert_Object_To_String', () {
    final requestString = ToStringRequestBuilder.newInstance()
        .append('conversationId', '123456')
        .append('locale', Locale.TR.toString())
        .append('price', '1.0')
        .getRequestString();
    expect(
        '[conversationId=123456,locale=tr,price=1.0]', equals(requestString));
  });
  test('Should_Convert_To_Nothing', () {
    final requestString =
        ToStringRequestBuilder.newInstance().getRequestString();
    expect('[]', equals(requestString));
  });
}
