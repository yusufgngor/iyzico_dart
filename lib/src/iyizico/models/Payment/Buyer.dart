import '../../RequestStringConvertible.dart';
import '../../ToStringRequestBuilder.dart';

class Buyer extends RequestStringConvertible {
  String id;
  String name;
  String surname;
  String identityNumber;
  String city;
  String country;
  String email;
  String? gsmNumber;
  String ip;
  String registrationAddress;
  String? zipCode;
  String? registrationDate;
  String? lastLoginDate;

  Buyer({
    required this.id,
    required this.name,
    required this.surname,
    required this.identityNumber,
    required this.email,
    this.gsmNumber,
    this.registrationDate,
    this.lastLoginDate,
    required this.registrationAddress,
    required this.city,
    required this.country,
    this.zipCode,
    required this.ip,
  });
  // Buyer.fromJson(Map<String, dynamic> json) {
  //   id = json["id"]?.toString();
  //   name = json["name"]?.toString();
  //   surname = json["surname"]?.toString();
  //   identityNumber = json["identityNumber"]?.toString();
  //   email = json["email"]?.toString();
  //   gsmNumber = json["gsmNumber"]?.toString();
  //   registrationDate = json["registrationDate"]?.toString();
  //   lastLoginDate = json["lastLoginDate"]?.toString();
  //   registrationAddress = json["registrationAddress"]?.toString();
  //   city = json["city"]?.toString();
  //   country = json["country"]?.toString();
  //   zipCode = json["zipCode"]?.toString();
  //   ip = json["ip"]?.toString();
  // }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['surname'] = surname;
    data['identityNumber'] = identityNumber;
    data['email'] = email;
    data['gsmNumber'] = gsmNumber;
    data['registrationDate'] = registrationDate;
    data['lastLoginDate'] = lastLoginDate;
    data['registrationAddress'] = registrationAddress;
    data['city'] = city;
    data['country'] = country;
    data['zipCode'] = zipCode;
    data['ip'] = ip;
    return data;
  }

  @override
  String toPKIRequestString() => ToStringRequestBuilder.newInstance()
      .append('id', id)
      .append('name', name)
      .append('surname', surname)
      .append('identityNumber', identityNumber)
      .append('email', email)
      .append('gsmNumber', gsmNumber)
      .append('registrationDate', registrationDate)
      .append('lastLoginDate', lastLoginDate)
      .append('registrationAddress', registrationAddress)
      .append('city', city)
      .append('country', country)
      .append('zipCode', zipCode)
      .append('ip', ip)
      .getRequestString();
}
