import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/IyziConfig.dart';
import '../models/Payment/PaymentCard.dart';
import '../models/Payment/Buyer.dart';
import '../models/Payment/Address.dart';
import '../models/Payment/BasketItem.dart';
import '../models/Currency.dart';
import '../models/Payment/PaymentResource.dart';

import '../BaseRequest.dart';
import '../IyzipayResource.dart';
import '../ToStringRequestBuilder.dart';

class PaymentRequest extends BaseRequest {
  double price;
  double paidPrice;
  Currency? currency;
  int? installment;
  String? basketId;
  String? paymentChannel;
  String? paymentGroup;
  PaymentCard paymentCard;
  Buyer buyer;
  Address billingAddress;
  Address shippingAddress;
  List<BasketItem> basketItems;
  String? callbackUrl;

  PaymentRequest({
    String? locale,
    String? conversationId,
    required this.price,
    required this.paidPrice,
    this.installment,
    this.paymentChannel,
    this.basketId,
    this.paymentGroup,
    required this.paymentCard,
    required this.buyer,
    required this.shippingAddress,
    required this.billingAddress,
    required this.basketItems,
    this.callbackUrl,
    this.currency,
  }) : super(locale, conversationId);

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data.addAll(super.toJson());
    data['price'] = price;
    data['paidPrice'] = paidPrice;
    if (installment != null) data['installment'] = installment;
    if (paymentChannel != null) data['paymentChannel'] = paymentChannel;
    if (basketId != null) data['basketId'] = basketId;
    if (paymentGroup != null) data['paymentGroup'] = paymentGroup;
    data['paymentCard'] = paymentCard.toJson();
    data['buyer'] = buyer.toJson();
    data['shippingAddress'] = shippingAddress.toJson();
    data['billingAddress'] = billingAddress.toJson();
    final v = basketItems;
    final arr0 = [];
    v.forEach((v) {
      arr0.add(v.toJson());
    });
    data['basketItems'] = arr0;
    if (currency != null) data['currency'] = currency!.value;
    ;
    if (callbackUrl != null) data['callbackUrl'] = callbackUrl;
    return data;
  }

  @override
  String toPKIRequestString() {
    return ToStringRequestBuilder.newInstance()
        .appendSuper(super.toPKIRequestString())
        .appendPrice('price', price)
        .appendPrice('paidPrice', paidPrice)
        .append('installment', installment)
        .append('paymentChannel', paymentChannel)
        .append('basketId', basketId)
        .append('paymentGroup', paymentGroup)
        .append('paymentCard', paymentCard)
        .append('buyer', buyer)
        .append('shippingAddress', shippingAddress)
        .append('billingAddress', billingAddress)
        .appendList('basketItems', basketItems)
        .append('currency', currency)
        .append('callbackUrl', callbackUrl)
        .getRequestString();
  }

  Future<PaymentResource> create(IyziConfig options) async {
    final result = await http.post(
      Uri.parse(options.baseUrl + '/payment/auth'),
      headers: IyzipayResource.getHttpHeaders(this, options),
      body: json.encode(toJson()),
    );
    final resultJson = json.decode(result.body);
    return PaymentResource.fromJson(resultJson);
  }
}
