//key 由 flutter 触发，native 响应
class MethodKey {
  static const String Init = 'Init';
  static const String GetCurrentUserPhone = 'GetCurrentUserPhone';
  static const String FetchUserInfo = 'FetchUserInfo';
  static const String ChangeColor = 'ChangeColor';
}

//callback key 由 native 触发，flutter 响应
class MethodCallBackKey {
  static const String FetchUserInfo = 'FetchUserInfoCallBack';
}