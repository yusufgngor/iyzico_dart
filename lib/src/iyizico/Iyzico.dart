import 'models/BinNumber/BinNumber.dart';
import 'models/CheckoutForm/CheckoutForm.dart';
import 'models/CheckoutForm/CheckoutFormInitialize.dart';
import 'models/Installment/InstallmentInfo.dart';
import 'models/IyziConfig.dart';
import 'models/Payment/Address.dart';
import 'models/Payment/BasketItem.dart';
import 'models/Payment/Buyer.dart';
import 'models/Payment/PaymentCard.dart';
import 'models/Payment/PaymentResource.dart';
import 'models/Threeds/ThreedsInitialize.dart';
import 'request/BinNumberRequest.dart';
import 'request/CreateCheckoutFormInitializeRequest.dart';
import 'request/CreateThreedsPaymentRequest.dart';
import 'request/InitializeThreedsPaymentRequest.dart';
import 'request/InstallmentInfoRequest.dart';
import 'request/PaymentRequest.dart';
import 'request/RetrieveCheckoutFormRequest.dart';

class Iyzico {
  final IyziConfig configuration;

  Iyzico(
      {required String apiKey,
      required String secretKey,
      required String baseUrl})
      : assert(apiKey.isNotEmpty),
        assert(secretKey.isNotEmpty),
        assert(baseUrl.isNotEmpty),
        configuration = IyziConfig(apiKey, secretKey, baseUrl);

  Iyzico.fromConfig({required this.configuration})
      : assert(configuration.apiKey.isNotEmpty),
        assert(configuration.secretKey.isNotEmpty),
        assert(configuration.baseUrl.isNotEmpty);

  Future<BinNumber> retrieveBinNumberRequest(
      {required String binNumber,
      String? conversationId,
      String? locale}) async {
    assert(binNumber.isNotEmpty);

    final b = BinNumberRequest(
        binNumber: binNumber, locale: locale, conversationId: conversationId);
    return await b.retrieve(configuration);
  }

  Future<InstallmentInfo> retrieveInstallmentInfoRequest(
      {required double price,
      String? binNumber,
      String? conversationId,
      String? locale}) async {
    final request = InstallmentInfoRequest(
      price: price,
      binNumber: binNumber,
      locale: locale,
      conversationId: conversationId,
    );
    return await request.retrieve(configuration);
  }

  Future<PaymentResource> CreatePaymentRequest({
    String? locale,
    String? conversationId,
    required price,
    required paidPrice,
    installment,
    paymentChannel,
    basketId,
    paymentGroup,
    required paymentCard,
    required buyer,
    required shippingAddress,
    required billingAddress,
    required basketItems,
    callbackUrl,
    currency,
  }) async {
    final request = PaymentRequest(
        price: price,
        paidPrice: paidPrice,
        paymentCard: paymentCard,
        buyer: buyer,
        shippingAddress: shippingAddress,
        billingAddress: billingAddress,
        basketItems: basketItems,
        currency: currency);
    return await request.create(configuration);
  }

  Future<ThreedsInitialize> initializeThreedsPaymentRequest({
    String? locale,
    String? conversationId,
    required price,
    required paidPrice,
    installment,
    paymentChannel,
    basketId,
    paymentGroup,
    required paymentCard,
    required buyer,
    required shippingAddress,
    required billingAddress,
    required basketItems,
    required callbackUrl,
    currency,
  }) async {
    final request = InitializeThreedsPaymentRequest(
        price: price,
        paidPrice: paidPrice,
        paymentCard: paymentCard,
        buyer: buyer,
        shippingAddress: shippingAddress,
        billingAddress: billingAddress,
        basketItems: basketItems,
        currency: currency,
        callbackUrl: callbackUrl);
    return await request.initialize(configuration);
  }

  Future<PaymentResource> createThreedsPaymentRequest({
    String? locale,
    String? conversationId,
    String? paymentId,
    String? paymentConversationId,
  }) async {
    final request = CreateThreedsPaymentRequest(
      locale: locale,
      conversationId: conversationId,
      paymentConversationId: paymentConversationId,
      paymentId: paymentId,
    );
    return await request.create(configuration);
  }

  Future<CheckoutFormInitialize> initializeCheoutForm({
    String? locale,
    String? conversationId,
    required double price,
    required double paidPrice,
    int? installment,
    String? paymentChannel,
    String? basketId,
    String? paymentGroup,
    required PaymentCard paymentCard,
    required Buyer buyer,
    required Address shippingAddress,
    required Address billingAddress,
    required List<BasketItem> basketItems,
    required String callbackUrl,
    required List<int> enabledInstallments,
    currency,
  }) async {
    final request = CreateCheckoutFormInitializeRequest(
        locale: locale,
        conversationId: conversationId,
        basketId: basketId,
        installment: installment,
        paymentChannel: paymentChannel,
        paymentGroup: paymentGroup,
        price: price,
        paidPrice: paidPrice,
        paymentCard: paymentCard,
        buyer: buyer,
        shippingAddress: shippingAddress,
        billingAddress: billingAddress,
        basketItems: basketItems,
        currency: currency,
        callbackUrl: callbackUrl,
        enabledInstallments:
            enabledInstallments.isEmpty ? <int>[1] : enabledInstallments);

    return await request.create(configuration);
  }

  Future<CheckoutForm> retrieveCheckoutForm({
    String? locale,
    String? conversationId,
    required String token,
  }) async {
    final request = RetrieveCheckoutFormRequest(
      token: token,
      locale: locale,
      conversationId: conversationId,
    );
    return await request.create(configuration);
  }
}
