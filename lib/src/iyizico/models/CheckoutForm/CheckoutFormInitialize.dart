import '../Error.dart';

class CheckoutFormInitialize extends IyziError {
  String checkoutFormContent;
  String token;
  int tokenExpireTime;
  String paymentPageUrl;
  String cardHolderName;

  CheckoutFormInitialize(
      {required this.cardHolderName,
      required this.checkoutFormContent,
      required this.token,
      required this.tokenExpireTime,
      required this.paymentPageUrl,
      json})
      : super.fromJson(json);
  factory CheckoutFormInitialize.fromJson(Map<String, dynamic> json) {
    return CheckoutFormInitialize(
      cardHolderName: json['cardHolderName']?.toString() ?? '',
      checkoutFormContent: json['checkoutFormContent']?.toString() ?? '',
      tokenExpireTime: json['tokenExpireTime']?.toInt() ?? 0,
      paymentPageUrl: json['paymentPageUrl']?.toString() ?? '',
      token: json['token']?.toString() ?? '',
      json: json,
    );
  }
  @override
  Map<String, dynamic> toJson() {
    if (status != 'success') return super.toJson();

    final data = <String, dynamic>{};
    data['cardHolderName'] = cardHolderName;
    data['checkoutFormContent'] = checkoutFormContent;
    data['token'] = token;
    data['paymentPageUrl'] = paymentPageUrl;
    data['tokenExpireTime'] = tokenExpireTime;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
