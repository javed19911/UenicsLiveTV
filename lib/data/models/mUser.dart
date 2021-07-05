class mUser {
  int? _id;
  String? _email;
  String? _authenticationToken;
  String? _phoneNumber;
  String? _userType;

  int? get id => _id;

  String? get email => _email;

  String? get authenticationToken => _authenticationToken;

  String? get phoneNumber => _phoneNumber;

  String? get userType => _userType;

  mUser.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    if (json['email'] != null && json['email'] != "null")
      _email = json['email'];
    else
      _email = "";

    _authenticationToken = json['authentication_token'];

    if (json['phone_number'] != null && json['phone_number'] != "null")
      _phoneNumber = json['phone_number'];
    else
      _phoneNumber = "";

    if (json['user_type'] != null && json['user_type'] != "null")
      _userType = json['user_type'];
    else
      _userType = "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['email'] = this._email;
    data['authentication_token'] = this._authenticationToken;
    data['phone_number'] = this._phoneNumber;
    data['user_type'] = this._userType;
    return data;
  }
}
