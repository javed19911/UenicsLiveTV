import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ProgressDialog extends StatelessWidget {
  String title;
  String description;
  List<Widget> actionWidget;
  Widget? extraContent;
  BuildContext? context;

  ProgressDialog(
      {this.title = '',
      this.description = 'Please Wait...',
      this.actionWidget = const <Widget>[],
      this.extraContent});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  title,
                  style: TextStyle(
                      color: HexColor.fromHex('353834'),
                      fontSize: 24,
                      fontWeight: FontWeight.w300),
                )),
                SizedBox(width: 5),
                GestureDetector(
                  child: Icon(
                    Icons.clear,
                    color: Colors.black54,
                  ),
                  onTap: () {
                    dismiss();
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 8),
          extraContent == null ? CircularProgressIndicator() : Container(),
          extraContent == null ? SizedBox(height: 16) : Container(),
          Text(
            description,
            style: TextStyle(
                color: HexColor.fromHex('353834'),
                fontSize: 15,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 8),
          extraContent ?? Container(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: actionWidget,
          )
        ],
      ),
    );
  }

  void dismiss() {
    Navigator.pop(context!);
  }
}
