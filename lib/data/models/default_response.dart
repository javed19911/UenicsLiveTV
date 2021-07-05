class DefaultResponse {
  bool _success = false;
  Error? _error;
  String? _message;
  String? _title;

  bool get success => _success;
  Error? get error => _error;
  String? get message => _message;
  String? get title => _title;

  DefaultResponse();

  DefaultResponse.fromJson(dynamic json) {
    _success = json["success"];
    _message = json["message"];
    _title = json["title"];
    if (json["error"] != null) {
      _error = Error.fromJson(json["error"]);
    } else {
      _error = Error();
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    map["message"] = _message;
    map["title"] = _title;
    map["error"] = _error?.toJson();
    return map;
  }
}

class Error {
  int? _code;
  String? _errorMessage;
  String? _type;

  Error();

  int? get code => _code;
  String? get errorMessage => _errorMessage;
  String? get type => _type;

  Error.fromJson(dynamic json) {
    _code = json["code"];
    _errorMessage = json["message"];
    _type = json["type"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["type"] = _type;
    map["message"] = _errorMessage;
    return map;
  }
}
