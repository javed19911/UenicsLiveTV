import 'package:unics_live_tv/data/models/mChannel.dart';

class mCategory {
  late int _id;
  late String _name;
  List<mChannel> _channels = [];

  mCategory();

  List<mChannel> get channels => _channels;

  set channels(List<mChannel> value) {
    _channels = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  mCategory.fromJson(Map<String, dynamic> json) {
    //print(json);
    _id = json["id"];
    _name = json["name"];
    if (json['channels'] != null) {
      _channels = new List<mChannel>.empty(growable: true);
      json['channels'].forEach((v) {
        _channels.add(new mChannel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data["id"] = _id;
    data["name"] = _name;
    if (this._channels != null) {
      data['channels'] = this._channels.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
