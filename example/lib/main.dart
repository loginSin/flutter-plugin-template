import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:hello_flutter_plugin/hello_flutter_plugin.dart';
import 'package:hello_flutter_plugin/method_key.dart';

import 'index_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    
    String appKey = "flutter_appKey";
    HelloFlutterPlugin.init(appKey);

    HelloFlutterPlugin.setNativeMethodCallHandler(_handler);

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {

    });
  }

  Future<dynamic> _handler(MethodCall methodCall) {
    if (MethodCallBackKey.FetchUserInfo == methodCall.method) {
      Map map = methodCall.arguments;
      print("fetch user info from native result " + map.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexPage(),
    );
  }
}
