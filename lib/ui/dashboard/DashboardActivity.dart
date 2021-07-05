import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unics_live_tv/main.dart';
import 'package:unics_live_tv/res/color.dart';
import 'package:unics_live_tv/ui/base/ActivityResult.dart';
import 'package:unics_live_tv/ui/base/BaseActivity.dart';
import 'package:unics_live_tv/ui/dashboard/iDashboard.dart';
import 'package:unics_live_tv/ui/dashboard/vmDashboard.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardActivity extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends BaseActivity<DashboardActivity, vmDashboard>
    implements iDashboard {
  vmDashboard? view_model;

  @override
  void onCreate() {
    super.onCreate();
    view_model = getViewModel();
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (view_model != null) {
        view_model?.navigator = this;
        view_model?.getCategories(context);
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appLifecycleState) {
    super.didChangeAppLifecycleState(appLifecycleState);
    if (appLifecycleState == AppLifecycleState.resumed) {
      view_model?.getCategories(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget getWidget(BuildContext context, vmDashboard? view_model) {
    return Scaffold(
        backgroundColor: HexColor.fromHex("3D1848"),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("UEnics Live TV"),
        ),
        body: Stack(children: [
          ListView.builder(
            padding: EdgeInsets.all(10),
            scrollDirection: Axis.vertical,
            itemCount: view_model?.categoryList.length,
            itemBuilder: (context, index) {
              var category = view_model?.categoryList[index];
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(category!.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 15,
                        )),
                    SizedBox(height: 10),
                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                MediaQuery.of(context).size.width ~/ 110 - 1,
                            childAspectRatio: 1.6,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4),
                        itemCount: category.channels.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var channel = category.channels[index];
                          return Card(
                            child: MaterialButton(
                              elevation: 10,
                              focusElevation: 20,
                              focusColor: HexColor.fromHex("3C1F45"),
                              color: Colors.white, //HexColor.fromHex("3C1F45"),
                              highlightColor: Colors.lightGreen,
                              highlightElevation: 20,
                              hoverElevation: 20,
                              hoverColor: Colors.white,
                              splashColor: Colors.lightGreen,
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: channel.thumbnail,
                                placeholder:
                                    (BuildContext context, String url) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                },
                              ),
                              onPressed: () async {
                                print("clicked");
                                if (await canLaunch(channel.deeplink)) {
                                  await launch(channel.deeplink);
                                } else {
                                  throw 'Could not launch ${channel.deeplink}';
                                }
                              },
                            ),
                          );
                        }),
                  ],
                ),
              );
              /* ElevatedButton(
                      onPressed: () {
                        print("clicked");
                      },
                      child: Text(category!.name));*/
            },
          ),
          Center(
            child:
                view_model!.mIsLoading ? new CircularProgressIndicator() : null,
          )
        ]));
  }

  @override
  void onActivityResult(int result_code, ActivityResult result) {
    print("onActivityResult : $result_code $result");
  }
}
