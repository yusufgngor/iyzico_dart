// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:iyzico/src/iyizico/BaseRequest.dart';
import 'package:iyzico/src/iyizico/HashGenerator.dart';
import 'package:test/test.dart';

// RUN TEST WITH FLOWWING CODE
// flutter pub run test test/Tests/HashGeneratorTest.dart
// TO RUN ALL TEST
// flutter pub run test test/Tests/
class TestRequest extends BaseRequest {
  TestRequest(String locale, String conversationId)
      : super(locale, conversationId);

  @override
  String toPKIRequestString() {
    return '[data=value]';
  }
}

void main() {
  test('Should_Generate_Hash', () {
    final expectedHash = 'Cy84UuLZpfGhI7oaPD0Ckx1M0mo=';
    final generatedHash = HashGenerator.generateHash(
        'apiKey', 'secretKey', 'random', TestRequest('', ''));

    expect(expectedHash, equals(generatedHash));
  });
}
