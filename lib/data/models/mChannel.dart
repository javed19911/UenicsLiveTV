class mChannel {
  late int _id;
  late String _name;
  late String _thumbnail;
  late String _deeplink;

  mChannel();

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  String get deeplink => _deeplink;

  set deeplink(String value) {
    _deeplink = value;
  }

  String get thumbnail => _thumbnail;

  set thumbnail(String value) {
    _thumbnail = value;
  }

  set name(String value) {
    _name = value;
  }

  mChannel.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _thumbnail = json["thumbnail"];
    _deeplink = json["deeplink"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["thumbnail"] = _thumbnail;
    map["deeplink"] = _deeplink;

    return map;
  }
}
