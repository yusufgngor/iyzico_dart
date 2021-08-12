class InstallmentPrice {
/*
{
  "installmentPrice": 100,
  "totalPrice": 100,
  "installmentNumber": 1
} 
*/

  int? installmentPrice;
  int? totalPrice;
  int? installmentNumber;

  InstallmentPrice({
    this.installmentPrice,
    this.totalPrice,
    this.installmentNumber,
  });
  InstallmentPrice.fromJson(Map<String, dynamic> json) {
    installmentPrice = json['installmentPrice']?.toInt();
    totalPrice = json['totalPrice']?.toInt();
    installmentNumber = json['installmentNumber']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['installmentPrice'] = installmentPrice;
    data['totalPrice'] = totalPrice;
    data['installmentNumber'] = installmentNumber;
    return data;
  }
}
