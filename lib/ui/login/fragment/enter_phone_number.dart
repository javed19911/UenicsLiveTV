import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unics_live_tv/res/string/Strings.dart';
import 'package:unics_live_tv/ui/base/BaseActivity.dart';

import '../vmLogin.dart';

class EnterPhoneNumber extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _enterPhoneNumberPage();
}

class _enterPhoneNumberPage extends BaseActivity<EnterPhoneNumber, vmLogin> {
  final TextEditingController _phone_controller = TextEditingController();

  @override
  Widget getWidget(BuildContext context, vmLogin? view_model) {
    return Column(children: <Widget>[
      Expanded(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset('lib/res/drawable/intellologo.png',
                  fit: BoxFit.cover),
            ),
            /* Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 5.0),
                                  //color: Colors.white,
                                  color : Color(0xbbffffff),
                                  child: Image.asset(
                                    'lib/res/drawable/logo.png',
                                  )),
                            ),*/
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  color: Color(0xaa444444),
                  child: Center(
                      child: Text(Strings.welcomeMessage,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18))),
                )),
          ],
        ),
      ),
      Expanded(
        child: Card(
            margin:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                height: 200,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("SIGN IN",
                              style: TextStyle(
                                  color: Colors.lightGreen,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline)),
                          Text(" WITH MOBILE NUMBER",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12)),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.lightGreen,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: TextField(
                          controller: _phone_controller,
                          keyboardType: TextInputType.phone,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            prefixIcon:
                                Image.asset('lib/res/drawable/india.png'),
                            border: InputBorder.none,
                            hintText: "+91 000 XXX XXXX",
                            /*labelText: "Mobile Number"*/
                          ),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: double.infinity,
                        child: MaterialButton(
                            color: Colors.lightGreen,
                            child: Text("SEND OTP",
                                style: TextStyle(color: Colors.black)),
                            onPressed: () {
                              /* view_model.generateOTP(
                                  context, _phone_controller.text);*/
                              //_phone_controller.clear();
                            }),
                      ),
                      /*MaterialButton(
                          color: null,
                          child: Text("Guest Log-In !!",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline,
                              )),
                          onPressed: () {
                            vm.dataManager.setCurrentUserName("Guest");
                            vm.dataManager
                                .setAccessToken("qGoqQbyg3AcsiH_u9Poc");
                            vm.dataManager.setCurrentUserLoggedInMode(
                                LoggedInMode.LOGGED_IN_MODE_GUEST);
                            vm.dataManager
                                .setCurrentUserEmail("Guest@guest.com");
                            openHomeActivity();
                          }),*/

                      /*Image.asset(
                        'lib/res/drawable/intellologo.png',
                        height: 40,
                      )*/
                    ]))),
      )
    ]);
  }
}
