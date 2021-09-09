import '../Error.dart';

class Approval extends IyziError {
  final String? paymentTransactionId;

  Approval({this.paymentTransactionId, required json}) : super.fromJson(json);

  factory Approval.fromJson(Map<String, dynamic> json) {
    return Approval(
      paymentTransactionId: json['binNumber'],
      json: json,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (status != 'success') {
      return super.toJson();
    } else {
      data['paymentTransactionId'] = paymentTransactionId;
    }
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
