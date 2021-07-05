import 'package:flutter/material.dart';
import 'package:unics_live_tv/data/models/ChannelResponse.dart';
import 'package:unics_live_tv/data/models/mCategory.dart';
import 'package:unics_live_tv/ui/base/BaseViewModel.dart';
import 'package:unics_live_tv/ui/dashboard/iDashboard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class vmDashboard extends BaseViewModel<iDashboard> {
  List<mCategory> categoryList = [];

  List<mCategory> getCategories(BuildContext context) {
    mIsLoading = true;
    notifyListeners();

    dataManager.getChannelList().then((response) {
      print(response);
      if (response.success) {
        categoryList = response.categories;
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
    /*categoryList = ChannelResponse().getCategories();
    notifyListeners();
    //openChannel();*/
    return categoryList;
  }

  openChannel() async {
    var url = "https://www.hotstar.com/in/channels/starplus";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch ${url}';
    }
  }

  String formatDate(DateTime date) =>
      DateFormat("yyyy-MM-dd hh:mm:ss").format(date);
}
