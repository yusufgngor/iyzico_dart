import 'package:iyzico/src/iyizico/models/Payment/Address.dart';

class AddressBuilder {
  final String _address = 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1';
  final String? _zipCode = '34742';
  final String _contactName = 'Jane Doe';
  final String _city = 'Istanbul';
  final String _country = 'Turkey';

  Address get billingAddress => Address(
        address: _address,
        city: _city,
        contactName: _contactName,
        country: _country,
        zipCode: null,
      );
  Address get shippingAddress => Address(
        address: _address,
        city: _city,
        contactName: _contactName,
        country: _country,
        zipCode: _zipCode,
      );
}
