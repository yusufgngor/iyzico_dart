import 'InstallmentPrice.dart';

class InstallmentDetails {
/*
{
  "binNumber": "542119",
  "price": 100,
  "cardType": "CREDIT_CARD",
  "cardAssociation": "MASTER_CARD",
  "cardFamilyName": "World",
  "force3ds": 0,
  "bankCode": 15,
  "bankName": "Vakıfbank",
  "forceCvc": 0,
  "commercial": 0,
  "installmentPrices": [
    {
      "installmentPrice": 100,
      "totalPrice": 100,
      "installmentNumber": 1
    }
  ]
} 
*/

  String? binNumber;
  int? price;
  String? cardType;
  String? cardAssociation;
  String? cardFamilyName;
  int? force3ds;
  int? bankCode;
  String? bankName;
  int? forceCvc;
  int? commercial;
  List<InstallmentPrice?>? installmentPrices;

  InstallmentDetails({
    this.binNumber,
    this.price,
    this.cardType,
    this.cardAssociation,
    this.cardFamilyName,
    this.force3ds,
    this.bankCode,
    this.bankName,
    this.forceCvc,
    this.commercial,
    this.installmentPrices,
  });
  InstallmentDetails.fromJson(Map<String, dynamic> json) {
    binNumber = json['binNumber']?.toString();
    price = json['price']?.toInt();
    cardType = json['cardType']?.toString();
    cardAssociation = json['cardAssociation']?.toString();
    cardFamilyName = json['cardFamilyName']?.toString();
    force3ds = json['force3ds']?.toInt();
    bankCode = json['bankCode']?.toInt();
    bankName = json['bankName']?.toString();
    forceCvc = json['forceCvc']?.toInt();
    commercial = json['commercial']?.toInt();
    if (json['installmentPrices'] != null) {
      final v = json['installmentPrices'];
      final arr0 = <InstallmentPrice>[];
      v.forEach((v) {
        arr0.add(InstallmentPrice.fromJson(v));
      });
      installmentPrices = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['binNumber'] = binNumber;
    data['price'] = price;
    data['cardType'] = cardType;
    data['cardAssociation'] = cardAssociation;
    data['cardFamilyName'] = cardFamilyName;
    data['force3ds'] = force3ds;
    data['bankCode'] = bankCode;
    data['bankName'] = bankName;
    data['forceCvc'] = forceCvc;
    data['commercial'] = commercial;
    if (installmentPrices != null) {
      final v = installmentPrices;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['installmentPrices'] = arr0;
    }
    return data;
  }
}
