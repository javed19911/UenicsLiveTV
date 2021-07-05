import 'package:flutter/cupertino.dart';

import '../../DataManager.dart';

abstract class PreferencesHelper {
  Future<String?> getHostURL();

  Future<bool> setHostURL(String hostURL);

  Future<String?> getAccessToken();

  Future<bool> setAccessToken(String accessToken);

  Future<String?> getFirebaseToken();

  Future<bool> setFirebaseToken(String firebaseToken);

  Future<String?> getCurrentUserEmail();

  Future<bool> setCurrentUserEmail(String email);

  Future<String?> getPassword();

  Future<bool> setPassword(String password);

  Future<bool?> isRememberCredentials();

  Future<bool> setRememberCredentials(bool rememberCredentials);

  Future<int?> getCurrentUserId();

  Future<bool> setCurrentUserId(int userId);

  Future<LoggedInMode> getCurrentUserLoggedInMode();

  Future<bool> setCurrentUserLoggedInMode(LoggedInMode mode);

  Future<String?> getCurrentUserName();

  Future<bool> setCurrentUserName(String userName);

  Future<String?> getCurrentUserProfilePicUrl();

  Future<bool> setCurrentUserProfilePicUrl(String profilePicUrl);

  Future<String?> getCurrentUserMobileNo();

  Future<bool> setCurrentUserMobileNo(String mobile_no);

  Future<String?> getCurrentUserRole();

  Future<bool> setCurrentUserRole(String role);

  Future<LoggedInPlatform> getCurrentUserLoggedInPlatform();

  Future<bool> setCurrentUserLoggedInPlatform(LoggedInPlatform platform);

  Future<Locale> setLanguage(String languageCode);

  Future<Locale?> getSelectedLanguage();
}
