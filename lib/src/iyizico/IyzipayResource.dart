import 'dart:convert';
import 'dart:math';

import 'BaseRequest.dart';
import 'HashGenerator.dart';
import 'models/IyziConfig.dart';

class IyzipayResource {
  static const String AUTHORIZATION = 'Authorization';
  static const String RANDOM_HEADER_NAME = 'x-iyzi-rnd';
  static const String CLIENT_VERSION_HEADER_NAME = 'x-iyzi-client-version';
  static const String IYZIWS_HEADER_NAME = 'IYZWS ';
  static const String COLON = ':';

  static String getRandString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  static Map<String, String> getHttpHeaders(
      BaseRequest request, IyziConfig options) {
    // String randomString = getRandString(8);
    var randomString = '123456789';

    var headers = <String, String>{};
    headers.addAll({'Content-Type': 'application/json'});
    headers.addAll({'Accept': 'application/json'});
    // headers.addAll({"x-iyzi-client-version": "iyzipay-php-2.0.50"});

    headers.addAll({RANDOM_HEADER_NAME: randomString});
    headers.addAll({
      AUTHORIZATION: prepareAuthorizationString(request, randomString, options)
    });
    return headers;
  }

  static String prepareAuthorizationString(
      BaseRequest request, String randomString, IyziConfig options) {
    final hash = HashGenerator.generateHash(
        options.apiKey, options.secretKey, randomString, request);

    return IYZIWS_HEADER_NAME + options.apiKey + COLON + hash;
  }
}
