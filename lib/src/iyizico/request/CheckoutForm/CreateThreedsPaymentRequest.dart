import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../models/IyziConfig.dart';
import '../../models/Payment/PaymentResource.dart';

import '../../BaseRequest.dart';
import '../../IyzipayResource.dart';
import '../../ToStringRequestBuilder.dart';

class CreateThreedsPaymentRequest extends BaseRequest {
  String? paymentId;
  String? paymentConversationId;

  CreateThreedsPaymentRequest({
    String? locale,
    String? conversationId,
    this.paymentId,
    this.paymentConversationId,
  })  : assert(paymentId != null || paymentConversationId != null,
            'At least one of paymentId or conversationId must be sent'),
        super(locale, conversationId);

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data.addAll(super.toJson());

    if (paymentId != null) data['paymentId'] = paymentId;
    if (paymentConversationId != null) {
      data['paymentConversationId'] = paymentConversationId;
    }

    return data;
  }

  @override
  String toPKIRequestString() {
    return ToStringRequestBuilder.newInstance()
        .appendSuper(super.toPKIRequestString())
        .append('paymentId', paymentId)
        .append('paymentConversationId', paymentConversationId)
        .getRequestString();
  }

  Future<PaymentResource> create(IyziConfig options) async {
    final result = await http.post(
      Uri.parse(options.baseUrl + '/payment/detail'),
      headers: IyzipayResource.getHttpHeaders(this, options),
      body: json.encode(toJson()),
    );
    final resultJson = json.decode(result.body);
    return PaymentResource.fromJson(resultJson);
  }
}
