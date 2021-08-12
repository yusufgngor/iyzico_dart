import 'RequestStringConvertible.dart';
import 'ToStringRequestBuilder.dart';

class BaseRequest extends RequestStringConvertible {
  final String? locale;
  final String? conversationId;

  BaseRequest(this.locale, this.conversationId);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (locale != null) data['locale'] = locale;
    if (conversationId != null) data['conversationId'] = conversationId;

    return data;
  }

  @override
  String toPKIRequestString() {
    return ToStringRequestBuilder.newInstance()
        .append('locale', locale)
        .append('conversationId', conversationId)
        .getRequestString();
  }
}
