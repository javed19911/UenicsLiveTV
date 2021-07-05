import 'default_response.dart';
import 'mUser.dart';

/// status : "success"
/// status_code : 200
/// id : 12
/// mobile_number : "8287733567"
/// authentication_token : "yVyzfMhw6mx2pwBGcRNR"
/// role : "trader"

class OTP_Reponse extends DefaultResponse {
  mUser? _user;

  // int _id;
  // String _mobileNumber;
  // String _authenticationToken;
  // String _role;
  // String _email;
  // String _username;
  // String _platform_type;
  //
  // int get id => _id;
  // String get mobileNumber => _mobileNumber;
  // String get authenticationToken => _authenticationToken;
  // String get role => _role;
  // String get email => _email;
  // String get username => _username;
  // String get platform_type => _platform_type;

  mUser? get user => _user;

  OTP_Reponse.fromJson(dynamic json) : super.fromJson(json) {
    _user = mUser.fromJson(json["data"]);

    // _id = json["user_id"];
    // _mobileNumber = json["mobile_number"] == null ? "" : json["mobile_number"];
    // _authenticationToken = json["auth_token"];
    // _role = json["role"] == null ? "" : json["role"];
    // _username = json["username"] == null ? "" : json["username"];
    // _email = json["email"] == null ? "" : json["email"];
    // _platform_type = json["platform_type"] == null ? "" : json["platform_type"];
  }

  Map<String, dynamic> toJson() {
    var map = super.toJson();
    map["data"] = _user?.toJson();

    // map["user_id"] = _id;
    // map["mobile_number"] = _mobileNumber;
    // map["auth_token"] = _authenticationToken;
    // map["role"] = _role;
    // map["email"] = _email;
    // map["username"] = _username;
    // map["platform_type"] = _platform_type;
    return map;
  }
}
