import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'BaseRequest.dart';

class HashGenerator {
  static String generateHash(String apiKey, String secretKey,
      String randomString, BaseRequest request) {
    final hashStr =
        apiKey + randomString + secretKey + request.toPKIRequestString();
    final bytes = sha1.convert(Utf8Encoder().convert(hashStr));
    return Base64Encoder().convert(bytes.bytes);
  }

  // static String generateHash2(
  //     String apiKey, String secretKey, String randomString, String request) {
  //   String hashStr = apiKey + randomString + secretKey + request;
  //   final bytes = sha1.convert(Utf8Encoder().convert(hashStr));
  //   return base64Encode(bytes.bytes);
  // }
}
