package com.example.hello_flutter_plugin;

import android.content.Context;
import android.graphics.Color;
import android.util.Log;
import android.view.View;

import java.util.ArrayList;
import java.util.List;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

public class HelloFlutterTemplateViewControl implements PlatformView {

    MethodChannel channel = null;

    View templateView = null;

    HelloFlutterTemplateViewControl(Context context, BinaryMessenger messenger,int viewId, Object arg) {

        channel =  new MethodChannel(messenger, "template_view_"+viewId);
        channel.setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                onTemplateViewMethodCall(methodCall,result);
            }
        });

        templateView = new View(context);
        templateView.setBackgroundColor(Color.rgb(220,20,60));
    }

    @Override
    public View getView() {
        return templateView;
    }

    @Override
    public void dispose() {

    }

    private void onTemplateViewMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        if(HelloMethodKey.ChangeColor.equalsIgnoreCase(methodCall.method)) {
            changeColor();
        }
    }

    private void changeColor() {
        Log.i("Android","changeColor");
        List list = new ArrayList<>();
        list.add(new Integer(Color.rgb(0,250,154)));
        list.add(new Integer(Color.rgb(255,165,0)));
        list.add(new Integer(Color.rgb(192,192,192)));
        list.add(new Integer(Color.rgb(0,191,255)));
        list.add(new Integer(Color.rgb(75,0,130)));

        int index = (int)(Math.random() * 1000) % list.size();
        Integer color = (Integer)list.get(index);
        templateView.setBackgroundColor(color.intValue());

    }
}
