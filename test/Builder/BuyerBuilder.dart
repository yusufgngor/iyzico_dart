import 'package:iyzico/iyzico.dart';

class BuyerBuilder {
  final String id = 'BY789';
  final String name = 'John';
  final String surname = 'Doe';
  final String identityNumber = '74300864791';
  final String email = 'email@email.com';
  final String gsmNumber = '+905350000000';
  final String registrationDate = '2013-04-21 15:12:09';
  final String lastLoginDate = '2015-10-05 12:43:35';
  final String registrationAddress =
      'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1';
  final String city = 'Istanbul';
  final String country = 'Turkey';
  final String zipCode = '34732';
  final String ip = '85.34.78.112';

  Buyer get buyer => Buyer(
        city: city,
        country: country,
        email: email,
        gsmNumber: gsmNumber,
        id: id,
        identityNumber: identityNumber,
        ip: ip,
        lastLoginDate: lastLoginDate,
        name: name,
        registrationAddress: registrationAddress,
        registrationDate: registrationDate,
        surname: surname,
        zipCode: zipCode,
      );
}
