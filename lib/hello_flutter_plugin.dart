import 'dart:async';

import 'package:flutter/services.dart';
import 'method_key.dart';

class HelloFlutterPlugin {
  static const MethodChannel _channel =
      const MethodChannel('hello_flutter_plugin');
  
  static void init(String appkey) {
    _channel.invokeMethod(MethodKey.Init,appkey);
  }

  static Future<Map> getCurrentUserPhone(String curUserid) async {
    Map map = await _channel.invokeMethod(MethodKey.GetCurrentUserPhone,curUserid);
    return map;
  }

  static void fetchUserInfo(String userid) {
      _channel.invokeMethod(MethodKey.FetchUserInfo,userid);
  }

  static void setNativeMethodCallHandler(Future<dynamic> handler(MethodCall call)) {
    _channel.setMethodCallHandler(handler);
  }

}
