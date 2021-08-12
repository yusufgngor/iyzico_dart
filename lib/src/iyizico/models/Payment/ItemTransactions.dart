import 'ConvertedPayout.dart';

class ItemTransactions {
  String? itemId;
  String? paymentTransactionId;
  int? transactionStatus;
  double? price;
  double? paidPrice;
  int? merchantCommissionRate;
  double? merchantCommissionRateAmount;
  double? iyziCommissionRateAmount;
  double? iyziCommissionFee;
  int? blockageRate;
  int? blockageRateAmountMerchant;
  int? blockageRateAmountSubMerchant;
  String? blockageResolvedDate;
  int? subMerchantPrice;
  int? subMerchantPayoutRate;
  int? subMerchantPayoutAmount;
  double? merchantPayoutAmount;
  ConvertedPayout? convertedPayout;

  ItemTransactions({
    this.itemId,
    this.paymentTransactionId,
    this.transactionStatus,
    this.price,
    this.paidPrice,
    this.merchantCommissionRate,
    this.merchantCommissionRateAmount,
    this.iyziCommissionRateAmount,
    this.iyziCommissionFee,
    this.blockageRate,
    this.blockageRateAmountMerchant,
    this.blockageRateAmountSubMerchant,
    this.blockageResolvedDate,
    this.subMerchantPrice,
    this.subMerchantPayoutRate,
    this.subMerchantPayoutAmount,
    this.merchantPayoutAmount,
    this.convertedPayout,
  });
  ItemTransactions.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId']?.toString();
    paymentTransactionId = json['paymentTransactionId']?.toString();
    transactionStatus = json['transactionStatus']?.toInt();
    price = json['price']?.toDouble();
    paidPrice = json['paidPrice']?.toDouble();
    merchantCommissionRate = json['merchantCommissionRate']?.toInt();
    merchantCommissionRateAmount =
        json['merchantCommissionRateAmount']?.toDouble();
    iyziCommissionRateAmount = json['iyziCommissionRateAmount']?.toDouble();
    iyziCommissionFee = json['iyziCommissionFee']?.toDouble();
    blockageRate = json['blockageRate']?.toInt();
    blockageRateAmountMerchant = json['blockageRateAmountMerchant']?.toInt();
    blockageRateAmountSubMerchant =
        json['blockageRateAmountSubMerchant']?.toInt();
    blockageResolvedDate = json['blockageResolvedDate']?.toString();
    subMerchantPrice = json['subMerchantPrice']?.toInt();
    subMerchantPayoutRate = json['subMerchantPayoutRate']?.toInt();
    subMerchantPayoutAmount = json['subMerchantPayoutAmount']?.toInt();
    merchantPayoutAmount = json['merchantPayoutAmount']?.toDouble();
    convertedPayout = (json['convertedPayout'] != null)
        ? ConvertedPayout.fromJson(json['convertedPayout'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['itemId'] = itemId;
    data['paymentTransactionId'] = paymentTransactionId;
    data['transactionStatus'] = transactionStatus;
    data['price'] = price;
    data['paidPrice'] = paidPrice;
    data['merchantCommissionRate'] = merchantCommissionRate;
    data['merchantCommissionRateAmount'] = merchantCommissionRateAmount;
    data['iyziCommissionRateAmount'] = iyziCommissionRateAmount;
    data['iyziCommissionFee'] = iyziCommissionFee;
    data['blockageRate'] = blockageRate;
    data['blockageRateAmountMerchant'] = blockageRateAmountMerchant;
    data['blockageRateAmountSubMerchant'] = blockageRateAmountSubMerchant;
    data['blockageResolvedDate'] = blockageResolvedDate;
    data['subMerchantPrice'] = subMerchantPrice;
    data['subMerchantPayoutRate'] = subMerchantPayoutRate;
    data['subMerchantPayoutAmount'] = subMerchantPayoutAmount;
    data['merchantPayoutAmount'] = merchantPayoutAmount;
    if (convertedPayout != null) {
      data['convertedPayout'] = convertedPayout!.toJson();
    }
    return data;
  }
}
