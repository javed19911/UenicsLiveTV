import 'dart:convert';
import 'dart:ui';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:unics_live_tv/data/local/prefs/AppPreferencesHelper.dart';
import 'package:unics_live_tv/data/models/ChannelResponse.dart';
import 'package:unics_live_tv/data/models/default_response.dart';
import 'package:unics_live_tv/data/models/otp_reponse.dart';
import 'package:unics_live_tv/utils/UtilFunctions.dart';

import 'ApiHelper.dart';

class Webservice implements ApiHelper {
  //staging
  static String BASE_HOST_URL = "http://3.7.230.206:5000";

  //production
  //static final String BASE_HOST_URL = "http://staging.praman.ai" ;
  static String BASE_URL = BASE_HOST_URL + "/api/";

  Future<Map<String, String>> getHeader() async {
    Locale lang = await AppPreferencesHelper().getSelectedLanguage();
    return {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "lang": lang.languageCode
    };
  }

  Webservice();

  Future<bool> isInternet() async {
    if (BASE_HOST_URL.contains("192.168")) {
      return true;
    }
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  @override
  Future<OTP_Reponse> validateUser(String email, String password) async {
    if (!await isInternet()) {
      throw Exception("Check your Internet connection");
    }
    ;
    int timeZoneOffset = UtilFunctions.getLocalTimezoneOffsetInSeconds();

    Map data = {
      "email": "$email",
      "password": "$password",
      "device_token": "",
      "offset": timeZoneOffset
    };

    String body = json.encode(data);

    final response = await http.post(
        Uri.parse(BASE_URL + "users/login_with_otp"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: body);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return OTP_Reponse.fromJson(body);
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  @override
  Future<DefaultResponse> generateOTP(String phone_number) async {
    if (!await isInternet()) {
      throw Exception("Check your Internet connection");
    }

    Map data = {
      //'mobile': phone_number,
      'email': phone_number,
      'app_hashcode': "ktxrq+ZgQUQ" //release code
      //'app_hashcode': "bOT/9cpIF79" //javed's staging code
    };

    String body = json.encode(data);

    final response =
        await http.post(Uri.parse("${BASE_URL}v1/users/generate_otp"),
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json",
              'Access-Control-Allow-Origin': '*',
              'Access-Control-Allow-Headers': '*'
            },
            body: body);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return DefaultResponse.fromJson(body);
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  @override
  Future<OTP_Reponse> validateOTP(String phone_number, String OTP) async {
    if (!await isInternet()) {
      throw Exception("Check your Internet connection");
    }
    ;

    Map data = {
      //'mobile': phone_number,
      'email': phone_number,
      'otp': OTP
    };

    String body = json.encode(data);

    final response = await http.post(
        Uri.parse(BASE_URL + "v1/users/login_with_otp"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: body);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return OTP_Reponse.fromJson(body);
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  @override
  Future<ChannelResponse> getChannelList() async {
    if (!await isInternet()) {
      throw Exception("Check your Internet connection");
    }
    ;

    final response = await http.get(
        Uri.parse(
            "https://script.google.com/macros/s/AKfycbyW7QWh2-kHI6G7uAeCKKaJY7z9edl6LH33eGHbQ52eJ8Ps7MROsi4XVy2isE5-2xBX/exec"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        });

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return ChannelResponse.fromJson(body);
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
