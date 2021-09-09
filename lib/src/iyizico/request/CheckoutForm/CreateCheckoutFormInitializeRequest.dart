import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../models/IyziConfig.dart';
import '../../models/Payment/PaymentCard.dart';
import '../../models/Payment/Buyer.dart';
import '../../models/Payment/Address.dart';
import '../../models/Payment/BasketItem.dart';
import '../../models/CheckoutForm/CheckoutFormInitialize.dart';

import '../../BaseRequest.dart';
import '../../IyzipayResource.dart';
import '../../ToStringRequestBuilder.dart';

class CreateCheckoutFormInitializeRequest extends BaseRequest {
  double price;
  double paidPrice;
  String? basketId;
  String? currency;
  String? paymentGroup;
  int? installment;
  String? paymentChannel;
  PaymentCard? paymentCard;
  Buyer buyer;
  Address billingAddress;
  Address shippingAddress;
  List<BasketItem> basketItems;
  String callbackUrl;
  List<int> enabledInstallments;

  CreateCheckoutFormInitializeRequest(
      {String? locale,
      String? conversationId,
      required this.price,
      required this.paidPrice,
      this.installment,
      this.paymentChannel,
      this.basketId,
      this.paymentGroup,
      this.paymentCard,
      required this.buyer,
      required this.shippingAddress,
      required this.billingAddress,
      required this.basketItems,
      required this.callbackUrl,
      this.currency,
      required this.enabledInstallments})
      : super(locale, conversationId);

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
    if (paymentCard != null) {
      data['paymentCard'] = paymentCard!.toJson();
    }
    data['buyer'] = buyer.toJson();
    data['shippingAddress'] = shippingAddress.toJson();
    data['billingAddress'] = billingAddress.toJson();
    final v = basketItems;
    final arr0 = [];
    v.forEach((v) {
      arr0.add(v.toJson());
    });
    data['basketItems'] = arr0;
    if (currency != null) data['currency'] = currency;
    data['callbackUrl'] = callbackUrl;
    data['enabledInstallments'] = enabledInstallments;
    return data;
  }

  @override
  String toPKIRequestString() {
    return ToStringRequestBuilder.newInstance()
        .appendSuper(super.toPKIRequestString())
        .appendPrice('price', price.toString())
        .append('basketId', basketId)
        .append('paymentGroup', paymentGroup)
        .append('buyer', buyer)
        .append('shippingAddress', shippingAddress)
        .append('billingAddress', billingAddress)
        .appendList('basketItems', basketItems)
        .append('callbackUrl', callbackUrl)
        .append('currency', currency)
        .appendPrice('paidPrice', paidPrice.toString())
        .appendList('enabledInstallments', enabledInstallments)
        .getRequestString();
  }

  Future<CheckoutFormInitialize> create(IyziConfig options) async {
    final result = await http.post(
      Uri.parse(options.baseUrl +
          '/payment/iyzipos/checkoutform/initialize/auth/ecom'),
      headers: IyzipayResource.getHttpHeaders(this, options),
      body: json.encode(toJson()),
    );
    final resultJson = json.decode(result.body);
    return CheckoutFormInitialize.fromJson(resultJson);
  }
}
