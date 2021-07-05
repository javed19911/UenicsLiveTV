import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:unics_live_tv/multiLanguage/lanuages/language.dart';
import 'package:unics_live_tv/ui/base/BaseActivity.dart';
import 'package:unics_live_tv/ui/login/vmLogin.dart';
import 'package:unics_live_tv/utils/progessDialog.dart';

import '../../main.dart';
import 'iLogin.dart';

import 'dart:io' show Platform, exit;
import 'package:flutter/services.dart';

/*import 'dart:ui' as ui;
import 'dart:html' as html;
import 'dart:js' as js;*/

class LoginActivity extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseActivity<LoginActivity, vmLogin>
    implements iLogin {
  vmLogin? view_model;
  var progress;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ipController = TextEditingController();

  @override
  void onCreate() async {
    super.onCreate();
    var view_model = getViewModel();
    if (view_model != null) {
      view_model.navigator = this;
      view_model.checkIfAlreadyLoggedIn();
    }
  }

  @override
  Widget getWidget(BuildContext buildContext, vmLogin? vm) {
    this.view_model = vm;
    //vm.checkIfAlreadyLoggedIn();
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return AnimatedContainer(
          duration: Duration(milliseconds: 500),
          color: Colors.white,
          padding: constraints.maxWidth < 500
              ? EdgeInsets.zero
              : const EdgeInsets.all(30.0),
          child: Stack(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 96.0),
                  child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                      Center(
                          child: Image.asset(
                        'lib/res/drawable/intellologo.png',
                        height: 64,
                      )),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Center(
                          child: Text(
                              "Welcome to Intello Labs - Produce Tracker",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 16.0))),
                      Container(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: Language.of(context).userLabel),
                              validator: checkEmptyValidation,
                              controller: _usernameController,
                              /*onChanged: (text) {
                                if (button_enabled != text.length >= 10) {
                                  setState(() {
                                    button_enabled = text.length >= 10;
                                  });
                                }
                              },*/
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText:
                                      Language.of(context).passwordLabel),
                              validator: checkEmptyValidation,
                              controller: _passwordController,
                              obscureText: true,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: MaterialButton(
                                color: HexColor.fromHex("#2A654E"),
                                textColor: Colors.white,
                                onPressed: () {
                                  if (!vm!.mIsLoading) {
                                    vm.validateUser(
                                        buildContext,
                                        _usernameController.text,
                                        _passwordController.text);
                                  }
                                },
                                child: Text(Language.of(context).loginLabel),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  )),
              Center(
                child: vm!.mIsLoading ? new CircularProgressIndicator() : null,
              )
            ],
          ));
    }));
  }

  String? checkEmptyValidation(value) {
    if (value.isEmpty) {
      return Language.of(context).requiredWarningText;
    }
    return null;
  }

  @override
  void openHomeActivity() {
    replaceNamedActivity("/home");
  }

  // @override
  // void scaningLocalServer() {
  //   progress = showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context) {
  //         return ProgressDialog(
  //           description: "Scanning for Local Server\nPlease wait..",
  //         );
  //       });
  // }
}
