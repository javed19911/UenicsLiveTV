import 'dart:ui';

import 'package:unics_live_tv/data/models/ChannelResponse.dart';
import 'package:unics_live_tv/data/remote/webservice.dart';

import 'DataManager.dart';
import 'local/prefs/AppPreferencesHelper.dart';
import 'local/prefs/PreferencesHelper.dart';
import 'models/default_response.dart';
import 'models/otp_reponse.dart';

class AppDataManager implements DataManager {
  late Webservice webservice;

  late PreferencesHelper mPreferencesHelper;

  AppDataManager() {
    mPreferencesHelper = AppPreferencesHelper();
    webservice = Webservice();
    /* getHostURL().then((value) {
      if (value != null && value.isNotEmpty && value != "null") {
        Webservice.BASE_HOST_URL = value;
        Webservice.BASE_URL = value + "/api/";
      }
    });*/
  }

  @override
  Future<String?> getHostURL() {
    return mPreferencesHelper.getHostURL();
  }

  @override
  Future<String?> getAccessToken() {
    return mPreferencesHelper.getAccessToken();
  }

  @override
  Future<String?> getCurrentUserEmail() {
    return mPreferencesHelper.getCurrentUserEmail();
  }

  @override
  Future<int?> getCurrentUserId() {
    return mPreferencesHelper.getCurrentUserId();
  }

  @override
  Future<LoggedInMode> getCurrentUserLoggedInMode() {
    return mPreferencesHelper.getCurrentUserLoggedInMode();
  }

  @override
  Future<String?> getCurrentUserName() {
    return mPreferencesHelper.getCurrentUserName();
  }

  @override
  Future<String?> getCurrentUserProfilePicUrl() {
    return mPreferencesHelper.getCurrentUserProfilePicUrl();
  }

  @override
  Future<String?> getFirebaseToken() {
    return mPreferencesHelper.getFirebaseToken();
  }

  @override
  Future<String?> getPassword() {
    return mPreferencesHelper.getPassword();
  }

  @override
  Future<bool?> isRememberCredentials() {
    return mPreferencesHelper.isRememberCredentials();
  }

  @override
  Future<bool> setHostURL(String hostURL) {
    return mPreferencesHelper.setHostURL(hostURL);
  }

  @override
  Future<bool> setAccessToken(String accessToken) {
    return mPreferencesHelper.setAccessToken(accessToken);
  }

  @override
  Future<bool> setCurrentUserEmail(String email) {
    return mPreferencesHelper.setCurrentUserEmail(email);
  }

  @override
  Future<bool> setCurrentUserId(int userId) {
    return mPreferencesHelper.setCurrentUserId(userId);
  }

  @override
  Future<bool> setCurrentUserLoggedInMode(LoggedInMode mode) {
    return mPreferencesHelper.setCurrentUserLoggedInMode(mode);
  }

  @override
  Future<bool> setCurrentUserName(String userName) {
    return mPreferencesHelper.setCurrentUserName(userName);
  }

  @override
  Future<bool> setCurrentUserProfilePicUrl(String profilePicUrl) {
    return mPreferencesHelper.setCurrentUserProfilePicUrl(profilePicUrl);
  }

  @override
  Future<bool> setFirebaseToken(String firebaseToken) {
    return mPreferencesHelper.setFirebaseToken(firebaseToken);
  }

  @override
  Future<bool> setPassword(String password) {
    return mPreferencesHelper.setPassword(password);
  }

  @override
  Future<bool> setRememberCredentials(bool rememberCredentials) {
    return mPreferencesHelper.setRememberCredentials(rememberCredentials);
  }

  @override
  Future<String?> getCurrentUserMobileNo() {
    return mPreferencesHelper.getCurrentUserMobileNo();
  }

  @override
  Future<String?> getCurrentUserRole() {
    return mPreferencesHelper.getCurrentUserRole();
  }

  @override
  Future<bool> setCurrentUserMobileNo(String mobile_no) {
    return mPreferencesHelper.setCurrentUserMobileNo(mobile_no);
  }

  @override
  Future<bool> setCurrentUserRole(String role) {
    return mPreferencesHelper.setCurrentUserRole(role);
  }

  @override
  Future<LoggedInPlatform> getCurrentUserLoggedInPlatform() {
    return mPreferencesHelper.getCurrentUserLoggedInPlatform();
  }

  @override
  Future<bool> setCurrentUserLoggedInPlatform(LoggedInPlatform platform) {
    return mPreferencesHelper.setCurrentUserLoggedInPlatform(platform);
  }

  @override
  Future<Locale?> getSelectedLanguage() {
    return mPreferencesHelper.getSelectedLanguage();
  }

  @override
  Future<Locale> setLanguage(String languageCode) {
    return mPreferencesHelper.setLanguage(languageCode);
  }

  @override
  Future<OTP_Reponse> validateUser(String email, String password) {
    return webservice.validateUser(email, password);
  }

  @override
  Future<DefaultResponse> generateOTP(String phone_number) {
    return webservice.generateOTP(phone_number);
  }

  @override
  Future<OTP_Reponse> validateOTP(String phone_number, String OTP) {
    return webservice.validateOTP(phone_number, OTP);
  }

  @override
  Future<ChannelResponse> getChannelList() {
    return webservice.getChannelList();
  }
}
