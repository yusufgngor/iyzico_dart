import '../../models/Payment/PaymentResource.dart';

class CheckoutForm extends PaymentResource {
  String token;
  String callBack;

  CheckoutForm({required this.callBack, required this.token, required json})
      : super.fromJson(json);

  CheckoutForm.fromJson(Map<String, dynamic> json)
      : token = json['token']?.toString() ?? ' ',
        callBack = json['callBack']?.toString() ?? ' ',
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    if (status != 'success') return super.toJson();

    final data = <String, dynamic>{};
    data['token'] = token;
    data['callBack'] = callBack;
    data.addAll(super.toJson());
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
