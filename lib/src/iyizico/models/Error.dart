class IyziError {
  String status;
  String? errorCode;
  String? errorMessage;
  String? locale;
  int? systemTime;
  String? conversationId;

  IyziError({
    required this.status,
    this.errorCode,
    this.errorMessage,
    this.locale,
    this.systemTime,
    this.conversationId,
  });

  IyziError.fromJson(Map<String, dynamic> json)
      : status = json['status']?.toString() ?? '',
        errorCode = json['errorCode']?.toString(),
        errorMessage = json['errorMessage']?.toString(),
        locale = json['locale']?.toString(),
        systemTime = json['systemTime']?.toInt(),
        conversationId = json['conversationId']?.toString();
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (status != 'success') {
      data['status'] = status;
      data['errorCode'] = errorCode;
      data['errorMessage'] = errorMessage;
      data['locale'] = locale;
      data['systemTime'] = systemTime;
      data['conversationId'] = conversationId;
    }
    return data;
  }
}
