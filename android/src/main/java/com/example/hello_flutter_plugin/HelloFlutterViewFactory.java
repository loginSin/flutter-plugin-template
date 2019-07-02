package com.example.hello_flutter_plugin;

import android.content.Context;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class HelloFlutterViewFactory extends PlatformViewFactory {

    private final BinaryMessenger messenger;

    public HelloFlutterViewFactory(BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
    }

    @Override
    public PlatformView create(Context context, int viewId, Object args) {
        return new HelloFlutterTemplateViewControl(context,this.messenger,viewId,args);
    }
}
