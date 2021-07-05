import 'dart:convert';
import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

import '../../DataManager.dart';
import 'PreferencesHelper.dart';

class AppPreferencesHelper implements PreferencesHelper {
  static final String PREF_KEY_HOST_URL = "PREF_KEY_HOST_URL";

  static final String PREF_KEY_ACCESS_TOKEN = "PREF_KEY_ACCESS_TOKEN";

  static final String PREF_KEY_FIREBASE_TOKEN = "PREF_KEY_FIREBASE_TOKEN";

  static final String PREF_KEY_CURRENT_USER_EMAIL =
      "PREF_KEY_CURRENT_USER_EMAIL";

  static final String PREF_KEY_CURRENT_USER_ID = "PREF_KEY_CURRENT_USER_ID";

  static final String PREF_KEY_CURRENT_USER_NAME = "PREF_KEY_CURRENT_USER_NAME";

  static final String PREF_KEY_CURRENT_USER_PROFILE_PIC_URL =
      "PREF_KEY_CURRENT_USER_PROFILE_PIC_URL";

  static final String PREF_KEY_USER_LOGGED_IN_MODE =
      "PREF_KEY_USER_LOGGED_IN_MODE";

  static final String PREF_KEY_USER_PASSWORD = "PREF_KEY_USER_PASSWORD";

  static final String PREF_KEY_REMEMBER_CREDENTIALS =
      "PREF_KEY_REMEMBER_CREDENTIALS";

  static final String PREF_KEY_CURRENT_USER_MOBILE =
      "PREF_KEY_CURRENT_USER_MOBILE";

  static final String PREF_KEY_CURRENT_USER_ROLE = "PREF_KEY_CURRENT_USER_ROLE";

  static final String PREF_KEY_CURRENT_USER_STORES =
      "PREF_KEY_CURRENT_USER_STORES";

  static final String PREF_KEY_CURRENT_USER_PLATFORM =
      "PREF_KEY_CURRENT_USER_PLATFORM";

  static final String PREF_KEY_SELECTED_LANGUAGE = "PREF_KEY_SELECTED_LANGUAGE";

  late SharedPreferences mPrefs;

  AppPreferencesHelper() {
    SharedPreferences.getInstance().then((prefs) => this.mPrefs = prefs);
  }

  @override
  Future<String?> getHostURL() async {
    mPrefs = await SharedPreferences.getInstance();
    return mPrefs.getString(PREF_KEY_HOST_URL);
  }

  @override
  Future<String?> getAccessToken() async {
    mPrefs = await SharedPreferences.getInstance();
    return mPrefs.getString(PREF_KEY_ACCESS_TOKEN);
    // return "SVt4yF26VkjQExTqwcgn";
  }

  @override
  Future<String?> getCurrentUserEmail() async {
    mPrefs = await SharedPreferences.getInstance();
    return mPrefs.getString(PREF_KEY_CURRENT_USER_EMAIL);
  }

  @override
  Future<int?> getCurrentUserId() async {
    return mPrefs.getInt(PREF_KEY_CURRENT_USER_ID);
  }

  @override
  Future<LoggedInMode> getCurrentUserLoggedInMode() async {
    return LoggedInMode
        .values[await mPrefs.getInt(PREF_KEY_USER_LOGGED_IN_MODE) ?? 0];
  }

  @override
  Future<String?> getCurrentUserName() async {
    mPrefs = await SharedPreferences.getInstance();
    return mPrefs.getString(PREF_KEY_CURRENT_USER_NAME);
  }

  @override
  Future<String?> getCurrentUserProfilePicUrl() async {
    return mPrefs.getString(PREF_KEY_CURRENT_USER_PROFILE_PIC_URL);
  }

  @override
  Future<String?> getFirebaseToken() async {
    return mPrefs.getString(PREF_KEY_FIREBASE_TOKEN);
  }

  @override
  Future<String?> getPassword() async {
    return mPrefs.getString(PREF_KEY_USER_PASSWORD);
  }

  @override
  Future<bool?> isRememberCredentials() async {
    mPrefs = await SharedPreferences.getInstance();
    return mPrefs.getBool(PREF_KEY_REMEMBER_CREDENTIALS);
  }

  @override
  Future<String?> getCurrentUserMobileNo() async {
    mPrefs = await SharedPreferences.getInstance();
    return mPrefs.getString(PREF_KEY_CURRENT_USER_MOBILE);
  }

  @override
  Future<String?> getCurrentUserRole() async {
    mPrefs = await SharedPreferences.getInstance();
    return mPrefs.getString(PREF_KEY_CURRENT_USER_ROLE);
  }

  @override
  Future<bool> setHostURL(String hostURL) {
    return mPrefs.setString(PREF_KEY_HOST_URL, hostURL);
  }

  @override
  Future<bool> setAccessToken(String accessToken) async {
    return mPrefs.setString(PREF_KEY_ACCESS_TOKEN, accessToken);
  }

  @override
  Future<bool> setCurrentUserEmail(String email) async {
    return mPrefs.setString(PREF_KEY_CURRENT_USER_EMAIL, email);
  }

  @override
  Future<bool> setCurrentUserId(int userId) async {
    return mPrefs.setInt(PREF_KEY_CURRENT_USER_ID, userId);
  }

  @override
  Future<bool> setCurrentUserName(String userName) async {
    return mPrefs.setString(PREF_KEY_CURRENT_USER_NAME, userName);
  }

  @override
  Future<bool> setCurrentUserProfilePicUrl(String profilePicUrl) async {
    return mPrefs.setString(
        PREF_KEY_CURRENT_USER_PROFILE_PIC_URL, profilePicUrl);
  }

  @override
  Future<bool> setFirebaseToken(String firebaseToken) async {
    return mPrefs.setString(PREF_KEY_FIREBASE_TOKEN, firebaseToken);
  }

  @override
  Future<bool> setPassword(String password) async {
    return mPrefs.setString(PREF_KEY_USER_PASSWORD, password);
  }

  @override
  Future<bool> setRememberCredentials(bool rememberCredentials) async {
    return mPrefs.setBool(PREF_KEY_REMEMBER_CREDENTIALS, rememberCredentials);
  }

  @override
  Future<bool> setCurrentUserLoggedInMode(LoggedInMode mode) async {
    //mPrefs = await SharedPreferences.getInstance();
    return mPrefs.setInt(PREF_KEY_USER_LOGGED_IN_MODE, mode.index);
  }

  @override
  Future<bool> setCurrentUserRole(String role) async {
    mPrefs = await SharedPreferences.getInstance();
    return mPrefs.setString(PREF_KEY_CURRENT_USER_ROLE, role);
  }

  @override
  Future<bool> setCurrentUserMobileNo(String mobile_no) async {
    mPrefs = await SharedPreferences.getInstance();
    return mPrefs.setString(PREF_KEY_CURRENT_USER_MOBILE, mobile_no);
  }

  @override
  Future<LoggedInPlatform> getCurrentUserLoggedInPlatform() async {
    mPrefs = await SharedPreferences.getInstance();
    //return mPrefs.setString(PREF_KEY_CURRENT_USER_PLATFORM, role);
    return LoggedInPlatform
        .values[await mPrefs.getInt(PREF_KEY_CURRENT_USER_PLATFORM) ?? 0];
  }

  @override
  Future<bool> setCurrentUserLoggedInPlatform(LoggedInPlatform platform) async {
    mPrefs = await SharedPreferences.getInstance();
    return mPrefs.setInt(PREF_KEY_CURRENT_USER_PLATFORM, platform.index);
  }

  @override
  Future<Locale> setLanguage(String languageCode) async {
    mPrefs = await SharedPreferences.getInstance();
    mPrefs.setString(PREF_KEY_SELECTED_LANGUAGE, languageCode);
    return _locale(languageCode);
  }

  @override
  Future<Locale> getSelectedLanguage() async {
    mPrefs = await SharedPreferences.getInstance();
    var languageCode = mPrefs.getString(PREF_KEY_SELECTED_LANGUAGE) ?? "en";
    return _locale(languageCode);
  }

  Locale _locale(String languageCode) {
    return languageCode != null && languageCode.isNotEmpty
        ? Locale(languageCode, '')
        : Locale('en', '');
  }
}
