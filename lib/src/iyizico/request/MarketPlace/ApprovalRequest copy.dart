import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../BaseRequest.dart';
import '../../IyzipayResource.dart';
import '../../ToStringRequestBuilder.dart';
import '../../models/BinNumber/BinNumber.dart';
import '../../models/IyziConfig.dart';

class ApprovalRequest extends BaseRequest {
  String paymentTransactionId;
  ApprovalRequest(
      {required this.paymentTransactionId,
      String? locale,
      String? conversationId})
      : super(locale, conversationId);

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data.addAll(super.toJson());
    data['paymentTransactionId'] = paymentTransactionId;
    return data;
  }

  @override
  String toPKIRequestString() {
    return ToStringRequestBuilder.newInstance()
        .appendSuper(super.toPKIRequestString())
        .append('paymentTransactionId', paymentTransactionId)
        .getRequestString();
  }

  Future<BinNumber> retrieve(IyziConfig options) async {
    final result = await http.post(
      Uri.parse(options.baseUrl + '/payment/iyzipos/item/approve'),
      headers: IyzipayResource.getHttpHeaders(this, options),
      body: json.encode(toJson()),
    );
    final resultJson = json.decode(result.body);
    return BinNumber.fromJson(resultJson);
  }
}
