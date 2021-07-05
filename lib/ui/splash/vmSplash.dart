import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unics_live_tv/data/DataManager.dart';
import 'package:unics_live_tv/ui/base/BaseViewModel.dart';
import 'package:unics_live_tv/ui/splash/iSplash.dart';

class vmSplash extends BaseViewModel<iSplash> {
  String? phoneNumber;

  void checkIfAlreadyLoggedIn() {
    dataManager.isRememberCredentials().then((value) {
      if (value != null && value) {
        if (navigator != null) {
          navigator.openDashBoardActivity();
          //notifyListeners();
        }
      } else {
        if (navigator != null) {
          navigator.openLoginActivity();
          //notifyListeners();
        }
      }
    });
  }

  void generateOTP(BuildContext context, String phone_number, String otp) {
    /* if(!terms_of_use_and_privacy_policy){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please agree to Terms of Use and Privacy Policy'),
        duration: Duration(seconds: 3),
      ));
      return;
    }*/
    print("generateOTP");
    if (phone_number.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter valid Username...'),
        duration: Duration(seconds: 3),
      ));
      return;
    }
    phone_number = phone_number + "@intellolabs.com";

    mIsLoading = true;
    notifyListeners();

    dataManager.generateOTP(phone_number).then((response) {
      if (response.success) {
        phoneNumber = phone_number;
        validateOTP(context, otp);
      } else {
        throw Exception(response.error?.errorMessage);
      }
    }).catchError((e) {
      print("Got error: ${e.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          e.toString().replaceAll("Exception: ", ""),
        ),
        duration: Duration(seconds: 3),
      ));
    }).whenComplete(() {
      mIsLoading = false;
      notifyListeners();
    });
  }

  void validateOTP(BuildContext context, String otp) {
    print("validateOTP");
    if (otp.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter valid password...'),
        duration: Duration(seconds: 3),
      ));
      return;
    }

    mIsLoading = true;
    notifyListeners();
    dataManager.validateOTP(phoneNumber!, otp).then((response) {
      if (response.success) {
        dataManager.setRememberCredentials(true);
        dataManager.setCurrentUserId(response.user!.id!);
        dataManager.setCurrentUserName(response.user!.email!);
        dataManager.setAccessToken(response.user!.authenticationToken!);
        dataManager
            .setCurrentUserLoggedInMode(LoggedInMode.LOGGED_IN_MODE_SERVER);
        if (response.user!.userType!.toLowerCase() == "auction") {
          dataManager.setCurrentUserLoggedInPlatform(
              LoggedInPlatform.LOGGED_IN_PLATFORM_AUCTIONER);
        } else {
          dataManager.setCurrentUserLoggedInPlatform(
              LoggedInPlatform.LOGGED_IN_PLATFORM_TRADER);
        }
        dataManager.setCurrentUserEmail(response.user!.email!);
        dataManager.setCurrentUserMobileNo(response.user!.phoneNumber!);
        dataManager.setCurrentUserRole(response.user!.userType!);

        if (navigator != null) {
          navigator.openDashBoardActivity();
        }
      } else {
        throw Exception(response.error!.errorMessage);
      }
    }).catchError((e) {
      print("Got error: ${e.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString().replaceAll("Exception: ", "")),
        duration: Duration(seconds: 3),
      ));
    }).whenComplete(() {
      mIsLoading = false;
      notifyListeners();
    });
  }
}
