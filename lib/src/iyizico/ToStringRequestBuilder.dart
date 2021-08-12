import 'RequestFormatter.dart';
import 'RequestStringConvertible.dart';

class ToStringRequestBuilder {
  late String _requestString;

  ToStringRequestBuilder(String requestString) {
    _requestString = requestString;
  }

  static ToStringRequestBuilder newInstance([String requestString = '']) {
    return ToStringRequestBuilder(requestString);
  }

  ToStringRequestBuilder appendSuper(String? superRequestString) {
    if (superRequestString != null) {
      superRequestString = superRequestString.substring(1);
      superRequestString =
          superRequestString.substring(0, superRequestString.length - 1);

      if (superRequestString.isNotEmpty) {
        _requestString = _requestString + superRequestString + ',';
      }
    }
    return this;
  }

  ToStringRequestBuilder append(String key, [final value]) {
    if (value != null) {
      if (value is RequestStringConvertible) {
        appendKeyValue(key, value.toPKIRequestString());
      } else {
        appendKeyValue(key, value.toString());
      }
    }
    return this;
  }

  ToStringRequestBuilder appendPrice(String key, Object? value) {
    if (value != null) {
      if (value is double || value is String) {
        final price = value.toString();
        appendKeyValue(key, RequestFormatter.formatPrice(price));
      } else {
        throw Exception('Price must be double or String');
      }
    }
    return this;
  }

  ToStringRequestBuilder appendList<T>(String key, List? list) {
    if (list != null) {
      var appendedValue = '';

      if (list is List<RequestStringConvertible>) {
        list.forEach((RequestStringConvertible element) => appendedValue =
            appendedValue + element.toPKIRequestString() + ', ');
      } else if (list is List<int>) {
        list.forEach((element) {
          appendedValue = appendedValue + element.toString() + ', ';
        });
      }
      appendKeyValueArray(key, appendedValue);
    }
    return this;
  }

  ToStringRequestBuilder appendKeyValue(String key, String? value) {
    if (value != null) {
      _requestString = _requestString + key + '=' + value + ',';
    }
    return this;
  }

  ToStringRequestBuilder appendKeyValueArray(String key, String? value) {
    if (value != null) {
      value = value.substring(0, value.length - 2);
      _requestString = _requestString + key + '=[' + value + '],';
    }
    return this;
  }

  ToStringRequestBuilder appendPrefix() {
    _requestString = '[' + _requestString + ']';
    return this;
  }

  ToStringRequestBuilder removeTrailingComma() {
    if (_requestString.isNotEmpty) {
      _requestString = _requestString.substring(0, _requestString.length - 1);
    }
    return this;
  }

  String getRequestString() {
    removeTrailingComma();
    appendPrefix();
    return _requestString;
  }
}
