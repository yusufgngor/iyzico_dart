// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:http/http.dart';
import 'package:iyzico/iyzico.dart';

import '../MyConstants.dart';
import 'package:test/test.dart';

import '../Builder/Request/CreateCheckoutFormInitializeRequestBuilder.dart';

// RUN TEST WITH FLOWWING CODE
// flutter pub run test test/Tests/RequesFormatterTest.dart
// TO RUN ALL TEST
// flutter pub run test test/Tests/

void main() {
  test('test_should_get_json_object', () async {
    final request = Iyzico.fromConfig(configuration: options);

    var paymentCard = PaymentCard(
      cardHolderName: 'John Doe',
      cardNumber: '5528790000000008',
      expireYear: '2030',
      expireMonth: '12',
      cvc: '123',
      cardAlias: 'alias',
      registerCard: 0,
      cardToken: 'token',
      cardUserKey: 'user key',
    );
    var buyer = Buyer(
        id: 'B2323',
        name: 'John',
        surname: 'Doe',
        identityNumber: '74300864791',
        email: 'email@email.com',
        registrationAddress:
            'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        city: 'Istanbul',
        country: 'Turkey',
        gsmNumber: '+905350000000',
        lastLoginDate: '2015-10-05 12:43:35',
        registrationDate: '2013-04-21 15:12:09',
        zipCode: '34732',
        ip: '85.34.78.112');

    var shippingAddress = Address(
      address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
      zipCode: '34742',
      contactName: 'Jane Doe',
      city: 'Istanbul',
      country: 'Turkey',
    );

    var billingAddress = Address(
      address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
      contactName: 'Jane Doe',
      city: 'Istanbul',
      country: 'Turkey',
    );
    var basketItems = <BasketItem>[
      BasketItem(
        id: 'BI101',
        price: '0.3',
        name: 'Binocular',
        category1: 'Collectibles',
        category2: 'Accessories',
        itemType: BasketItemType.PHYSICAL,
        subMerchantKey: 'sub merchant key',
        subMerchantPrice: '0.27',
      ),
    ];

    final res = InitializeThreedsPaymentRequest(
      price: 1,
      paidPrice: 1.1,
      paymentCard: paymentCard,
      buyer: buyer,
      locale: Locale.TR.toString(),
      currency: Currency.TRY,
      conversationId: '123456789',
      shippingAddress: shippingAddress,
      installment: 1,
      paymentChannel: PaymentChannel.WEB.toShortString(),
      paymentGroup: PaymentGroup.PRODUCT.toShortString(),
      billingAddress: billingAddress,
      basketItems: basketItems,
      callbackUrl: 'https://www.linkedin.com/in/yusufgngor/',
    );

    final req = await res.initialize(options);
    print(req);

    final jsonObject = res.toJson();

    expect(Locale.TR.toString(), equals(jsonObject['locale']));
    expect('123456789', equals(jsonObject['conversationId']));
    expect(1.0, equals(jsonObject['price']));
    expect(1.1, equals(jsonObject['paidPrice']));
    expect(Currency.TRY.toString(), equals(jsonObject['currency']));
    expect(1, equals(jsonObject['installment']));
    expect(PaymentChannel.WEB.toShortString(),
        equals(jsonObject['paymentChannel']));
    expect(PaymentGroup.PRODUCT.toShortString(),
        equals(jsonObject['paymentGroup']));
    expect('https://www.linkedin.com/in/yusufgngor/',
        equals(jsonObject['callbackUrl']));
    expect('alias', equals(jsonObject['paymentCard']['cardAlias']));
    expect('John Doe', equals(jsonObject['paymentCard']['cardHolderName']));
    expect('5528790000000008', equals(jsonObject['paymentCard']['cardNumber']));
    expect('12', equals(jsonObject['paymentCard']['expireMonth']));
    expect('2030', equals(jsonObject['paymentCard']['expireYear']));
    expect('123', equals(jsonObject['paymentCard']['cvc']));
    expect(0, equals(jsonObject['paymentCard']['registerCard']));
    expect('token', equals(jsonObject['paymentCard']['cardToken']));
    expect('user key', equals(jsonObject['paymentCard']['cardUserKey']));
    expect('B2323', equals(jsonObject['buyer']['id']));
    expect('John', equals(jsonObject['buyer']['name']));
    expect('Doe', equals(jsonObject['buyer']['surname']));
    expect('+905350000000', equals(jsonObject['buyer']['gsmNumber']));
    expect('email@email.com', equals(jsonObject['buyer']['email']));
    expect('74300864791', equals(jsonObject['buyer']['identityNumber']));
    expect('2015-10-05 12:43:35', equals(jsonObject['buyer']['lastLoginDate']));
    expect(
        '2013-04-21 15:12:09', equals(jsonObject['buyer']['registrationDate']));
    expect('Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        equals(jsonObject['buyer']['registrationAddress']));
    expect('85.34.78.112', equals(jsonObject['buyer']['ip']));
    expect('Istanbul', equals(jsonObject['buyer']['city']));
    expect('Turkey', equals(jsonObject['buyer']['country']));
    expect('34732', equals(jsonObject['buyer']['zipCode']));
    expect('Jane Doe', equals(jsonObject['shippingAddress']['contactName']));
    expect('Istanbul', equals(jsonObject['shippingAddress']['city']));
    expect('Turkey', equals(jsonObject['shippingAddress']['country']));
    expect('Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        equals(jsonObject['shippingAddress']['address']));
    expect('34742', equals(jsonObject['shippingAddress']['zipCode']));
    expect('Jane Doe', equals(jsonObject['billingAddress']['contactName']));
    expect('Istanbul', equals(jsonObject['billingAddress']['city']));
    expect('Turkey', equals(jsonObject['billingAddress']['country']));
    expect('Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        equals(jsonObject['billingAddress']['address']));
    expect('BI101', equals(jsonObject['basketItems'][0]['id']));
    expect('Binocular', equals(jsonObject['basketItems'][0]['name']));
    expect('Collectibles', equals(jsonObject['basketItems'][0]['category1']));
    expect('Accessories', equals(jsonObject['basketItems'][0]['category2']));
    expect(BasketItemType.PHYSICAL.toShortString(),
        equals(jsonObject['basketItems'][0]['itemType']));
    expect('0.3', equals(jsonObject['basketItems'][0]['price']));
    expect('0.27', equals(jsonObject['basketItems'][0]['subMerchantPrice']));
    expect('sub merchant key',
        equals(jsonObject['basketItems'][0]['subMerchantKey']));
  });
}
