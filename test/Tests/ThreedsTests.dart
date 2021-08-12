// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import '../MyConstants.dart';
import 'package:test/test.dart';

import '../Builder/Request/CreateCheckoutFormInitializeRequestBuilder.dart';

// RUN TEST WITH FLOWWING CODE
// flutter pub run test test/Tests/RequesFormatterTest.dart
// TO RUN ALL TEST
// flutter pub run test test/Tests/

void main() {
  test('Should_Generate_Hash', () {
    var request = CreateCheckoutFormInitializeRequestBuilder().request;

    request.create(options);
  });
}
