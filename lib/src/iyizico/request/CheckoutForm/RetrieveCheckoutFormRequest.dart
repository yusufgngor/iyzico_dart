import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../models/IyziConfig.dart';
import '../../models/CheckoutForm/CheckoutForm.dart';

import '../../BaseRequest.dart';
import '../../IyzipayResource.dart';
import '../../ToStringRequestBuilder.dart';

class RetrieveCheckoutFormRequest extends BaseRequest {
  String token;

  RetrieveCheckoutFormRequest(
      {required this.token, json, locale, conversationId})
      : super(locale, conversationId);

  factory RetrieveCheckoutFormRequest.fromJson(Map<String, dynamic> json) {
    return RetrieveCheckoutFormRequest(
      token: json['token']?.toString() ?? '',
      json: json,
    );
  }
  @override
  Map<String, dynamic> toJson() {
    final superData = super.toJson();

    final data = <String, dynamic>{};
    data['token'] = token;
    superData.addAll(data);
    return superData;
  }

  @override
  String toPKIRequestString() {
    return ToStringRequestBuilder.newInstance()
        .appendSuper(super.toPKIRequestString())
        .append('token', token)
        .getRequestString();
  }

  Future<CheckoutForm> create(IyziConfig options) async {
    final result = await http.post(
      Uri.parse(
          options.baseUrl + '/payment/iyzipos/checkoutform/auth/ecom/detail'),
      headers: IyzipayResource.getHttpHeaders(this, options),
      body: json.encode(toJson()),
    );
    final resultJson = json.decode(result.body);
    return CheckoutForm.fromJson(resultJson);
  }
}
