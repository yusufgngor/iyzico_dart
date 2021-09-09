import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/IyziConfig.dart';
import '../models/Payment/PaymentCard.dart';
import '../models/Payment/Buyer.dart';
import '../models/Payment/Address.dart';
import '../models/Payment/BasketItem.dart';
import '../models/Threeds/ThreedsInitialize.dart';
import '../models/Currency.dart';

import '../IyzipayResource.dart';
import 'PaymentRequest.dart';

class InitializeThreedsPaymentRequest extends PaymentRequest {
  InitializeThreedsPaymentRequest({
    String? locale,
    String? conversationId,
    required double price,
    required double paidPrice,
    Currency? currency,
    int? installment,
    String? basketId,
    String? paymentChannel,
    String? paymentGroup,
    required PaymentCard paymentCard,
    required Buyer buyer,
    required Address billingAddress,
    required Address shippingAddress,
    required List<BasketItem> basketItems,
    required String? callbackUrl,
  }) : super(
            conversationId: conversationId,
            currency: currency,
            installment: installment,
            locale: locale,
            paidPrice: paidPrice,
            price: price,
            basketId: basketId,
            basketItems: basketItems,
            billingAddress: billingAddress,
            buyer: buyer,
            paymentCard: paymentCard,
            paymentChannel: paymentChannel,
            paymentGroup: paymentGroup,
            shippingAddress: shippingAddress,
            callbackUrl: callbackUrl);

  Future<ThreedsInitialize> initialize(IyziConfig options) async {
    final result = await http.post(
      Uri.parse(options.baseUrl + '/payment/3dsecure/initialize'),
      headers: IyzipayResource.getHttpHeaders(this, options),
      body: json.encode(toJson()),
    );
    // print(jsonEncode(toJson()));
    final resultJson = json.decode(result.body);
    return ThreedsInitialize.fromJson(resultJson);
  }
}
