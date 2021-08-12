import '../Error.dart';

class BinNumber extends IyziError {
  final String? binNumber;
  final String? cardType;
  final String? cardAssociation;
  final String? cardFamily;
  final String? bankName;
  final int? commercial;
  final int? bankCode;

  BinNumber(
      {this.binNumber,
      this.cardType,
      this.cardAssociation,
      this.cardFamily,
      this.bankName,
      this.bankCode,
      this.commercial,
      required json})
      : super.fromJson(json);

  factory BinNumber.fromJson(Map<String, dynamic> json) {
    return BinNumber(
      binNumber: json['binNumber'],
      cardType: json['cardType'],
      cardAssociation: json['cardAssociation'],
      cardFamily: json['cardFamily'],
      bankName: json['bankName'],
      bankCode: json['bankCode'],
      commercial: json['commercial'],
      json: json,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (status != 'success') {
      return super.toJson();
    } else {
      data['binNumber'] = binNumber;
      data['cardType'] = cardType;
      data['cardAssociation'] = cardAssociation;
      data['cardFamily'] = cardFamily;
      data['bankName'] = bankName;
      data['bankCode'] = bankCode;
      data['status'] = status;
      data['locale'] = locale;
      data['commercial'] = commercial;
      data['systemTime'] = systemTime;
      data['conversationId'] = conversationId;
    }
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
