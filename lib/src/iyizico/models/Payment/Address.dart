import '../../RequestStringConvertible.dart';
import '../../ToStringRequestBuilder.dart';

class Address extends RequestStringConvertible {
  String contactName;
  String city;
  String country;
  String address;
  String? zipCode;

  Address({
    required this.address,
    this.zipCode,
    required this.contactName,
    required this.city,
    required this.country,
  });
  // Address.fromJson(Map<String, dynamic> json) {
  //   address = json["address"]?.toString();
  //   zipCode = json["zipCode"]?.toString();
  //   contactName = json["contactName"]?.toString();
  //   city = json["city"]?.toString();
  //   country = json["country"]?.toString();
  // }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['address'] = address;
    if (zipCode != null) data['zipCode'] = zipCode;
    data['contactName'] = contactName;
    data['city'] = city;
    data['country'] = country;
    return data;
  }

  @override
  String toPKIRequestString() {
    return ToStringRequestBuilder.newInstance()
        .append('address', address)
        .append('zipCode', zipCode)
        .append('contactName', contactName)
        .append('city', city)
        .append('country', country)
        .getRequestString();
  }
}
