import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import 'method_key.dart';

class TemplateViewController {
  TemplateViewController._(int id)
      : _channel = MethodChannel('template_view_$id');

  final MethodChannel _channel;

  void changeColor() {
    _channel.invokeMethod(MethodKey.ChangeColor);
  }
}

typedef void TemplateViewPageCreatedCallback(TemplateViewController controller);

class TemplateViewPage extends StatefulWidget {

  String userId;
  TemplateViewPageCreatedCallback onTemplateViewPageCreated;

  TemplateViewPage(String userId,TemplateViewPageCreatedCallback onTemplateViewPageCreated) {
    this.userId = userId;
    this.onTemplateViewPageCreated = onTemplateViewPageCreated;
  }

  @override
  State<StatefulWidget> createState() {
    return _TemplcateViewPageState(this.userId);
  }
}

class _TemplcateViewPageState extends State<TemplateViewPage> {
  String userId;

  _TemplcateViewPageState(String userId) {
    this.userId = userId;
  }

  @override
  Widget build(BuildContext context) {
    if(defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: "template_view",
        onPlatformViewCreated: _onPlatformViewCreated,
        creationParams: <String,dynamic>{
          "userId":userId,
        },
        creationParamsCodec: new StandardMessageCodec(),
      );
    }else if(defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: "template_view",
        onPlatformViewCreated:_onPlatformViewCreated,
        creationParams: <String,dynamic>{
          "userId":userId,
        },
        creationParamsCodec: new StandardMessageCodec(),
      );
    }
    return Text('TemplateViewPage 插件尚不支持$defaultTargetPlatform ');
  }

  void _onPlatformViewCreated(int id){
    if(widget.onTemplateViewPageCreated == null){
      return;
    }
    widget.onTemplateViewPageCreated(new TemplateViewController._(id));
  }
  
}