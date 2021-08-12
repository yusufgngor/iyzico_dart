import 'dart:convert';
import 'package:http/http.dart' as http;

import '../BaseRequest.dart';
import '../IyzipayResource.dart';
import '../ToStringRequestBuilder.dart';
import '../models/BinNumber/BinNumber.dart';
import '../models/IyziConfig.dart';

class BinNumberRequest extends BaseRequest {
  String binNumber;
  BinNumberRequest(
      {required this.binNumber, String? locale, String? conversationId})
      : super(locale, conversationId);

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data.addAll(super.toJson());
    data['binNumber'] = binNumber;
    return data;
  }

  @override
  String toPKIRequestString() {
    return ToStringRequestBuilder.newInstance()
        .appendSuper(super.toPKIRequestString())
        .append('binNumber', binNumber)
        .getRequestString();
  }

  Future<BinNumber> retrieve(IyziConfig options) async {
    final result = await http.post(
      Uri.parse(options.baseUrl + '/payment/bin/check'),
      headers: IyzipayResource.getHttpHeaders(this, options),
      body: json.encode(toJson()),
    );
    final resultJson = json.decode(result.body);
    return BinNumber.fromJson(resultJson);
  }
}
