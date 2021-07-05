class ActivityResult<T> {
  ActivityResultCode _code = ActivityResultCode.ACTIVITY_CANCEL;
  late T _result;

  ActivityResult();

  ActivityResult.codeResult(this._code, this._result);
  ActivityResult.Result(this._result);
  ActivityResult.code(this._code);

  ActivityResultCode get code => _code;

  set code(ActivityResultCode value) {
    _code = value;
  }

  T get result => _result;

  set result(T value) {
    _result = value;
  }
}

enum ActivityResultCode { ACTIVITY_OK, ACTIVITY_CANCEL }
