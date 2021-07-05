class UtilFunctions {
  static int getCurrentUnixTimeStamp() {
    return (DateTime.now().toUtc().millisecondsSinceEpoch / 1000).round(); 
  }

  static int getUnixTimeStamp(DateTime date) {
    return (date.toUtc().millisecondsSinceEpoch / 1000).round();
  }

  static int getLocalTimezoneOffsetInSeconds(){
    return DateTime.now().timeZoneOffset.inSeconds;
  }
}
