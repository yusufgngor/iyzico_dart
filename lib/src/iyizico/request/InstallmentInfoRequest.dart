import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/IyziConfig.dart';
import '../models/Installment/InstallmentInfo.dart';

import '../BaseRequest.dart';
import '../IyzipayResource.dart';
import '../ToStringRequestBuilder.dart';

class InstallmentInfoRequest extends BaseRequest {
  String? binNumber;
  double price;
  InstallmentInfoRequest(
      {this.binNumber,
      required this.price,
      String? locale,
      String? conversationId})
      : super(locale, conversationId);

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data.addAll(super.toJson());
    data['price'] = price;
    data['binNumber'] = binNumber;
    return data;
  }

  @override
  String toPKIRequestString() {
    return ToStringRequestBuilder.newInstance()
        .appendSuper(super.toPKIRequestString())
        .append('binNumber', binNumber)
        .appendPrice('price', price)
        .getRequestString();
  }

  Future<InstallmentInfo> retrieve(IyziConfig options) async {
    final result = await http.post(
      Uri.parse(options.baseUrl + '/payment/iyzipos/installment'),
      headers: IyzipayResource.getHttpHeaders(this, options),
      body: json.encode(toJson()),
    );
    final resultJson = json.decode(result.body);
    return InstallmentInfo.fromJson(resultJson);
  }
}
