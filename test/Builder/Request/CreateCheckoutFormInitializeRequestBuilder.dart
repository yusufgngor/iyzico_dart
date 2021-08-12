import 'package:iyzico/iyzico.dart';
import 'package:iyzico/src/iyizico/models/Currency.dart';
import 'package:iyzico/src/iyizico/models/Payment/PaymentChannel.dart';
import 'package:iyzico/src/iyizico/models/Payment/PaymentGroup.dart';

import '../AddressBuilder.dart';
import '../BasketItemBuilder.dart';
import '../BuyerBuilder.dart';
import '../PaymentCardBuilder.dart';
import 'BaseRequestBuilder.dart';

class CreateCheckoutFormInitializeRequestBuilder extends BaseRequestBuilder {
  double price = 1;
  double paidPrice = 1.1;
  int installment = 1;
  String paymentChannel = PaymentChannel.WEB.toShortString();
  String basketId = 'B67832';
  String? paymentGroup = PaymentGroup.LISTING.toShortString();
  Buyer buyer = BuyerBuilder().buyer;
  Address shippingAddress = AddressBuilder().shippingAddress;
  final String _callbackUrl = '';
  Address billingAddress = AddressBuilder().billingAddress;
  final basketItems = BasketItemBuilder().buildDefaultBasketItems();
  String currency = Currency.TRY.toString();
  PaymentCard paymentCard = PaymentCardBuilder().paymentcard;
  var enabledInstallmets = <int>[1, 3, 6];

  CreateCheckoutFormInitializeRequest get request =>
      CreateCheckoutFormInitializeRequest(
        locale: locale,
        conversationId: conversationId,
        basketId: basketId,
        basketItems: basketItems,
        billingAddress: billingAddress,
        buyer: buyer,
        currency: currency,
        // installment: installment,
        paidPrice: paidPrice,
        callbackUrl: _callbackUrl,
        // paymentCard: paymentCard,
        paymentChannel: paymentChannel,
        enabledInstallments: enabledInstallmets,
        paymentGroup: paymentGroup,
        price: price,
        shippingAddress: shippingAddress,
      );
}
