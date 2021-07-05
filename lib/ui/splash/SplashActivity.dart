import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unics_live_tv/ui/base/BaseActivity.dart';
import 'package:unics_live_tv/ui/splash/iSplash.dart';
import 'package:unics_live_tv/ui/splash/vmSplash.dart';

class SplashActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _splashPage();
}

class _splashPage extends BaseActivity<SplashActivity, vmSplash>
    implements iSplash {
  @override
  void initState() {
    super.initState();
  }

  // @override
  // Future<bool> onBackPressed() async {
  //   return false;
  // }

  @override
  void onCreate() {
    // TODO: implement onCreate
    super.onCreate();
    var view_model = getViewModel();
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (view_model != null) {
        view_model.navigator = this;
        //view_model.generateOTP(context, "nekm-test3", "362016");
        openDashBoardActivity();
      }
    });
  }

  @override
  Widget getWidget(BuildContext context, vmSplash? view_model) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'lib/res/drawable/logo_icon.png',
                height: 64,
              ),
              SizedBox(
                height: 4,
              ),
              Text("UEnics Live TV".toUpperCase(),
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              SizedBox(
                height: 4,
              ),
              Center(
                child: new CircularProgressIndicator(),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void openDashBoardActivity() {
    replaceNamedActivity("/dashboard");
  }

  @override
  void openLoginActivity() {
    replaceNamedActivity("/login");
  }
}
