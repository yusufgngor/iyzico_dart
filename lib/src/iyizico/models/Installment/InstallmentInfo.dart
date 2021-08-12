import '../Error.dart';
import 'InstallmentDetail.dart';

class InstallmentInfo extends IyziError {
  List<InstallmentDetails>? installmentDetails;

  InstallmentInfo({this.installmentDetails, json}) : super.fromJson(json);

  factory InstallmentInfo.fromJson(Map<String, dynamic> json) {
    List<InstallmentDetails>? _installmentDetails;
    if (json['installmentDetails'] != null) {
      final v = json['installmentDetails'];
      final arr0 = <InstallmentDetails>[];
      v.forEach((v) {
        arr0.add(InstallmentDetails.fromJson(v));
      });
      _installmentDetails = arr0;
    }

    return InstallmentInfo(installmentDetails: _installmentDetails, json: json);
  }

  @override
  Map<String, dynamic> toJson() {
    if (status != 'success') return super.toJson();

    final data = <String, dynamic>{};
    if (installmentDetails != null) {
      final v = installmentDetails;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v.toJson());
      });
      data['installmentDetails'] = arr0;
    }

    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
