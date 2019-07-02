import 'package:flutter/material.dart';

import 'package:hello_flutter_plugin/template_view.dart';

class NativeViewPage extends StatefulWidget {
  String userId;

  NativeViewPage(String userId) {
    this.userId = userId;
  }

  @override
  State<StatefulWidget> createState() {
    return _NativeViewPageState(this.userId);
  }
}

class _NativeViewPageState extends State<NativeViewPage> {
  String userId;

  _NativeViewPageState(String userId) {
    this.userId = userId;
  }

  TemplateViewController controller;

  void _onTemplateViewPageCreated(TemplateViewController _controller){
    controller = _controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Flutter QuickStart'),
        ),
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: <Widget>[
            new TemplateViewPage(this.userId, _onTemplateViewPageCreated,),
          ],
        ),
      ),
    );
  }
}