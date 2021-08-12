import '../Error.dart';

class ThreedsInitialize extends IyziError {
  String threeDSHtmlContent;

  ThreedsInitialize({required this.threeDSHtmlContent, json})
      : super.fromJson(json);

  factory ThreedsInitialize.fromJson(Map<String, dynamic> json) {
    assert(json['threeDSHtmlContent'] != null);

    return ThreedsInitialize(
      threeDSHtmlContent: json['threeDSHtmlContent']?.toString() ?? ' ',
      json: json,
    );
  }
  @override
  Map<String, dynamic> toJson() {
    if (status != 'success') return super.toJson();

    final data = <String, dynamic>{};
    data['threeDSHtmlContent'] = threeDSHtmlContent;

    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
