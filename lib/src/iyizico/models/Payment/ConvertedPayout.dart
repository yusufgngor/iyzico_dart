class ConvertedPayout {
  double? paidPrice;
  double? iyziCommissionRateAmount;
  double? iyziCommissionFee;
  int? blockageRateAmountMerchant;
  int? blockageRateAmountSubMerchant;
  int? subMerchantPayoutAmount;
  double? merchantPayoutAmount;
  int? iyziConversionRate;
  int? iyziConversionRateAmount;
  String? currency;

  ConvertedPayout({
    this.paidPrice,
    this.iyziCommissionRateAmount,
    this.iyziCommissionFee,
    this.blockageRateAmountMerchant,
    this.blockageRateAmountSubMerchant,
    this.subMerchantPayoutAmount,
    this.merchantPayoutAmount,
    this.iyziConversionRate,
    this.iyziConversionRateAmount,
    this.currency,
  });
  ConvertedPayout.fromJson(Map<String, dynamic> json) {
    paidPrice = json['paidPrice']?.toDouble();
    iyziCommissionRateAmount = json['iyziCommissionRateAmount']?.toDouble();
    iyziCommissionFee = json['iyziCommissionFee']?.toDouble();
    blockageRateAmountMerchant = json['blockageRateAmountMerchant']?.toInt();
    blockageRateAmountSubMerchant =
        json['blockageRateAmountSubMerchant']?.toInt();
    subMerchantPayoutAmount = json['subMerchantPayoutAmount']?.toInt();
    merchantPayoutAmount = json['merchantPayoutAmount']?.toDouble();
    iyziConversionRate = json['iyziConversionRate']?.toInt();
    iyziConversionRateAmount = json['iyziConversionRateAmount']?.toInt();
    currency = json['currency']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['paidPrice'] = paidPrice;
    data['iyziCommissionRateAmount'] = iyziCommissionRateAmount;
    data['iyziCommissionFee'] = iyziCommissionFee;
    data['blockageRateAmountMerchant'] = blockageRateAmountMerchant;
    data['blockageRateAmountSubMerchant'] = blockageRateAmountSubMerchant;
    data['subMerchantPayoutAmount'] = subMerchantPayoutAmount;
    data['merchantPayoutAmount'] = merchantPayoutAmount;
    data['iyziConversionRate'] = iyziConversionRate;
    data['iyziConversionRateAmount'] = iyziConversionRateAmount;
    data['currency'] = currency;
    return data;
  }
}
