import '../Error.dart';
import 'ItemTransactions.dart';

class PaymentResource extends IyziError {
  double? price;
  double? paidPrice;
  int? installment;
  String? paymentId;
  int? fraudStatus;
  double? merchantCommissionRate;
  double? merchantCommissionRateAmount;
  double? iyziCommissionRateAmount;
  double? iyziCommissionFee;

  String? cardType;
  String? paymentStatus;
  String? cardAssociation;
  String? cardFamily;
  String? binNumber;
  String? lastFourDigits;
  String? basketId;
  String? currency;
  List<ItemTransactions>? itemTransactions;
  String? connectorName;
  String? authCode;
  String? phase;
  String? hostReference;

  PaymentResource(
      {this.price,
      this.paidPrice,
      this.installment,
      this.paymentId,
      this.fraudStatus,
      this.merchantCommissionRate,
      this.merchantCommissionRateAmount,
      this.iyziCommissionRateAmount,
      this.iyziCommissionFee,
      this.cardType,
      this.cardAssociation,
      this.cardFamily,
      this.binNumber,
      this.lastFourDigits,
      this.paymentStatus,
      this.basketId,
      this.currency,
      this.itemTransactions,
      this.connectorName,
      this.authCode,
      this.phase,
      this.hostReference,
      json})
      : super.fromJson(json);

  PaymentResource.fromJson(Map<String, dynamic> json)
      : price = json['price']?.toDouble(),
        paidPrice = json['paidPrice']?.toDouble(),
        installment = json['installment']?.toInt(),
        paymentId = json['paymentId']?.toString(),
        fraudStatus = json['fraudStatus']?.toInt(),
        merchantCommissionRate = json['merchantCommissionRate']?.toDouble(),
        merchantCommissionRateAmount =
            json['merchantCommissionRateAmount']?.toDouble(),
        iyziCommissionRateAmount = json['iyziCommissionRateAmount']?.toDouble(),
        iyziCommissionFee = json['iyziCommissionFee']?.toDouble(),
        cardType = json['cardType']?.toString(),
        cardAssociation = json['cardAssociation']?.toString(),
        paymentStatus = json['paymentStatus']?.toString(),
        cardFamily = json['cardFamily']?.toString(),
        binNumber = json['binNumber']?.toString(),
        lastFourDigits = json['lastFourDigits']?.toString(),
        basketId = json['basketId']?.toString(),
        currency = json['currency']?.toString(),
        connectorName = json['connectorName']?.toString(),
        authCode = json['authCode']?.toString(),
        phase = json['phase']?.toString(),
        hostReference = json['hostReference']?.toString(),
        super.fromJson(json) {
    List<ItemTransactions>? _itemTransactions;
    if (json['itemTransactions'] != null) {
      final v = json['itemTransactions'];
      final arr0 = <ItemTransactions>[];
      v.forEach((v) {
        arr0.add(ItemTransactions.fromJson(v));
      });
      _itemTransactions = arr0;
      itemTransactions = _itemTransactions;
    }
  }

  factory PaymentResource.fromJson2(Map<String, dynamic> json) {
    List<ItemTransactions>? _itemTransactions;
    if (json['itemTransactions'] != null) {
      final v = json['itemTransactions'];
      final arr0 = <ItemTransactions>[];
      v.forEach((v) {
        arr0.add(ItemTransactions.fromJson(v));
      });
      _itemTransactions = arr0;
    }
    return PaymentResource(
      price: json['price']?.toDouble(),
      paidPrice: json['paidPrice']?.toDouble(),
      installment: json['installment']?.toInt(),
      paymentId: json['paymentId']?.toString(),
      fraudStatus: json['fraudStatus']?.toInt(),
      merchantCommissionRate: json['merchantCommissionRate']?.toDouble(),
      merchantCommissionRateAmount:
          json['merchantCommissionRateAmount']?.toDouble(),
      iyziCommissionRateAmount: json['iyziCommissionRateAmount']?.toDouble(),
      iyziCommissionFee: json['iyziCommissionFee']?.toDouble(),
      cardType: json['cardType']?.toString(),
      cardAssociation: json['cardAssociation']?.toString(),
      paymentStatus: json['paymentStatus']?.toString(),
      cardFamily: json['cardFamily']?.toString(),
      binNumber: json['binNumber']?.toString(),
      lastFourDigits: json['lastFourDigits']?.toString(),
      basketId: json['basketId']?.toString(),
      currency: json['currency']?.toString(),
      connectorName: json['connectorName']?.toString(),
      itemTransactions: _itemTransactions,
      authCode: json['authCode']?.toString(),
      phase: json['phase']?.toString(),
      hostReference: json['hostReference']?.toString(),
      json: json,
    );
  }
  @override
  Map<String, dynamic> toJson() {
    if (status != 'success') return super.toJson();

    final data = <String, dynamic>{};
    data['status'] = status;
    data['locale'] = locale;
    data['systemTime'] = systemTime;
    data['conversationId'] = conversationId;
    data['price'] = price;
    data['paidPrice'] = paidPrice;
    data['installment'] = installment;
    data['paymentId'] = paymentId;
    data['fraudStatus'] = fraudStatus;
    data['merchantCommissionRate'] = merchantCommissionRate;
    data['merchantCommissionRateAmount'] = merchantCommissionRateAmount;
    data['iyziCommissionRateAmount'] = iyziCommissionRateAmount;
    data['iyziCommissionFee'] = iyziCommissionFee;
    data['cardType'] = cardType;
    data['cardAssociation'] = cardAssociation;
    data['cardFamily'] = cardFamily;
    data['binNumber'] = binNumber;
    data['lastFourDigits'] = lastFourDigits;
    if (paymentStatus != null) data['paymentStatus'] = paymentStatus;

    data['basketId'] = basketId;
    data['currency'] = currency;
    if (itemTransactions != null) {
      final v = itemTransactions;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v.toJson());
      });
      data['itemTransactions'] = arr0;
    }
    data['connectorName'] = connectorName;
    data['authCode'] = authCode;
    data['phase'] = phase;
    data['hostReference'] = hostReference;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
