import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:hello_flutter_plugin/hello_flutter_plugin.dart';

import 'native_view_page.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new IndexState();
  }

}

class IndexState extends State<IndexPage> {


  onGetCurrentUserPhone() async {
    Map map = await HelloFlutterPlugin.getCurrentUserPhone("flutter_currentUserId");
    print("get current user phone from native " + map.toString());
  }

  onFetchUserInfo() {
    HelloFlutterPlugin.fetchUserInfo("flutter_userId");
    print("fetch user info from native start ");
  }

  onPushPlatformView() {
    if(defaultTargetPlatform == TargetPlatform.iOS)  {
      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => 
          new NativeViewPage("flutter_userId")
        ));
    }else if(defaultTargetPlatform == TargetPlatform.android) {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter QuickStart'),
        ),
        body: Center(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 400,
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              onPressed: () => onGetCurrentUserPhone(),
                              child: Text("onGetCurrentUserPhone"),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                            ),
                          )
                        ],
                        
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              onPressed: () => onFetchUserInfo(),
                              child: Text("onFetchUserInfo"),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                            ),
                          )
                        ],
                        
                      )
                    ),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              onPressed: () => onPushPlatformView(),
                              child: Text("onPushPlatformView"),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                            ),
                          )
                        ],
                      )
                    )
                ],
              )
              ),
        )
        );
  }

  }