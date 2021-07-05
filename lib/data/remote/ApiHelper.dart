import 'package:unics_live_tv/data/models/ChannelResponse.dart';
import 'package:unics_live_tv/data/models/default_response.dart';
import 'package:unics_live_tv/data/models/otp_reponse.dart';

abstract class ApiHelper {
  Future<DefaultResponse> generateOTP(String phone_number);

  Future<OTP_Reponse> validateOTP(String phone_number, String OTP);

  Future<OTP_Reponse> validateUser(String email, String password);

  Future<ChannelResponse> getChannelList();
}
