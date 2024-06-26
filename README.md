### NOT ACTIVELY MAINTAINED ###

make a pr to update 

A library for Dart developers.

## Usage

A simple usage example:


Set up your iyzico configurations and Create an iyzico object
```dart
import 'package:iyzico/iyzico.dart';

  const iyziConfig = IyziConfig(
      '****************************************',
      '****************************************',
      'https://sandbox-api.iyzipay.com');

    //Create an iyzico object
   final iyzico = Iyzico.fromConfig(configuration: iyziConfig);
```

Requesting bin number
```dart
  final binResult = await iyzico.retrieveBinNumberRequest(binNumber: '542119');
  print(binResult);
```


Requesting Installment Info
```dart
  final installmentResult =
      await iyzico.retrieveInstallmentInfoRequest(price: 10);
  print(installmentResult);
 // OR 
  final installmentResult2 = await iyzico.retrieveInstallmentInfoRequest(
      price: 10, binNumber: '542119');
  print(installmentResult2);
```

Create Payment Request
```dart
  final double price = 1;
  final double paidPrice = 1.1;

  final paymentCard = PaymentCard(
    cardHolderName: 'John Doe',
    cardNumber: '5528790000000008',
    expireYear: '2030',
    expireMonth: '12',
    cvc: '123',
  );

  final shippingAddress = Address(
      address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
      contactName: 'Jane Doe',
      zipCode: '34742',
      city: 'Istanbul',
      country: 'Turkey');
  final billingAddress = Address(
      address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
      contactName: 'Jane Doe',
      city: 'Istanbul',
      country: 'Turkey');

  final buyer = Buyer(
      id: 'BY789',
      name: 'John',
      surname: 'Doe',
      identityNumber: '74300864791',
      email: 'email@email.com',
      registrationAddress: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
      city: 'Istanbul',
      country: 'Turkey',
      ip: '85.34.78.112');

  final basketItems = <BasketItem>[
    BasketItem(
        id: 'BI101',
        price: '0.3',
        name: 'Binocular',
        category1: 'Collectibles',
        category2: 'Accessories',
        itemType: BasketItemType.PHYSICAL),
    BasketItem(
        id: 'BI102',
        price: '0.5',
        name: 'Game code',
        category1: 'Game',
        category2: 'Online Game Items',
        itemType: BasketItemType.VIRTUAL),
    BasketItem(
        id: 'BI103',
        price: '0.2',
        name: 'Usb',
        category1: 'Electronics',
        category2: 'Usb / Cable',
        itemType: BasketItemType.PHYSICAL),
  ];
  final paymentResult = await iyzico.CreatePaymentRequest(
      price: 1.0,
      paidPrice: 1.1,
      paymentCard: paymentCard,
      buyer: buyer,
      shippingAddress: shippingAddress,
      billingAddress: billingAddress,
      basketItems: basketItems);

  print(paymentResult);
```

Initialize 3DS PAYMENT REQUEST
```dart
  final initializeThreeds = await iyzico.initializeThreedsPaymentRequest(
    price: price,
    paidPrice: paidPrice,
    paymentCard: paymentCard,
    buyer: buyer,
    shippingAddress: shippingAddress,
    billingAddress: billingAddress,
    basketItems: basketItems,
    callbackUrl: 'www.marufmarket.com',
  );
  print(initializeThreeds);
```

Create 3DS payment requesr
  ```dart
  final createThreedsRequest = await iyzico.createThreedsPaymentRequest(
      paymentConversationId: '123456789');
  print(createThreedsRequest);
```

Init Checkout Form
```dart
  final initChecoutForm = await iyzico.initializeCheoutForm(
      price: price,
      paidPrice: paidPrice,
      paymentCard: paymentCard,
      buyer: buyer,
      shippingAddress: shippingAddress,
      billingAddress: billingAddress,
      basketItems: basketItems,
      callbackUrl: 'www.test.com',
      enabledInstallments: []);
  print(initChecoutForm);

  final retrieveCheckoutForm =
      await iyzico.retrieveCheckoutForm(token: 'token');
  print(retrieveCheckoutForm);

```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/yusufgngor/iyzico_dart
# iyzico_dart
