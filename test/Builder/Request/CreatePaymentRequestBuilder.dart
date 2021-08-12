import 'package:iyzico/iyzipackage.dart';

import '../AddressBuilder.dart';
import '../BasketItemBuilder.dart';
import '../BuyerBuilder.dart';
import '../PaymentCardBuilder.dart';
import 'BaseRequestBuilder.dart';

class CreatePaymentRequestBuilder extends BaseRequestBuilder {
  double price = 1;
  double paidPrice = 1.1;
  int installment = 1;
  String paymentChannel = PaymentChannel.WEB.toShortString();
  String basketId = 'B67832';
  String? paymentGroup;
  Buyer buyer = BuyerBuilder().buyer;
  Address shippingAddress = AddressBuilder().shippingAddress;
  Address billingAddress = AddressBuilder().billingAddress;
  List<BasketItem> basketItems = <BasketItem>[];
  PaymentCard paymentCard = PaymentCardBuilder().paymentcard;

  PaymentRequest get request => PaymentRequest(
        locale: locale,
        conversationId: conversationId,
        basketId: basketId,
        basketItems: basketItems,
        billingAddress: billingAddress,
        buyer: buyer,
        currency: Currency.TRY,
        installment: installment,
        paidPrice: paidPrice,
        paymentCard: paymentCard,
        paymentChannel: paymentChannel,
        paymentGroup: paymentGroup,
        price: price,
        shippingAddress: shippingAddress,
      );

  CreatePaymentRequestBuilder marketplacePayment(String subMerchantKey) {
    basketItems =
        BasketItemBuilder().buildBasketItemsWithSubMerchantKey(subMerchantKey);
    paymentGroup = PaymentGroup.PRODUCT.toShortString();
    return this;
  }

  CreatePaymentRequestBuilder standardListingPayment() {
    basketItems = BasketItemBuilder().buildDefaultBasketItems();
    paymentGroup = PaymentGroup.LISTING.toShortString();
    return this;
  }
}
