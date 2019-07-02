package com.example.hello_flutter_plugin;

import android.util.Log;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class HelloFlutterWrapper {

    private MethodChannel methodChannel;

    private HelloFlutterWrapper() {

    }

    private static class SingleHolder {
        static HelloFlutterWrapper instance = new HelloFlutterWrapper();
    }

    public static HelloFlutterWrapper getInstance() {
        return SingleHolder.instance;
    }

    public void saveMethodChannel(MethodChannel methodChannel) {
        this.methodChannel = methodChannel;
    }

    public void onWrapperMethodCall(MethodCall call, MethodChannel.Result result) {
        if(call.method.equalsIgnoreCase(HelloMethodKey.Init)) {
            initWithAppkey(call.arguments);
        }else if(call.method.equalsIgnoreCase(HelloMethodKey.GetCurrentUserPhone)) {
            getCurrentUserPhone(call.arguments,result);
        }else if(call.method.equalsIgnoreCase(HelloMethodKey.FetchUserInfo)) {
            fetchUserInfo(call.arguments);
        }else {
            result.notImplemented();
        }
    }

    private void initWithAppkey(Object arg) {
        //不用给 flutter 处理了结果
        if(arg instanceof String) {
            String appkey = String.valueOf(arg);
            //可以按照业务需求处理 appkey
            //此处仅打印了 appkey 的内容
            Log.i("Android","init 接收的 appkey 为 "+appkey);
        }
    }

    private void getCurrentUserPhone(Object arg,MethodChannel.Result result) {
        //通过 result 返回结果给 flutter
        if(arg instanceof String) {
            String userId = String.valueOf(arg);
            Map map = new HashMap();
            map.put("userId",userId);
            map.put("phone","18512345678");
            Log.i("Android","getCurrentUserPhone 通过 result 返回结果给 flutter 内容为"+map.toString());
            result.success(map);
        }
    }

    private void fetchUserInfo(Object arg) {
        //通过 methodchannel 返回结果给 flutter
        if(arg instanceof String) {
            String userId = String.valueOf(arg);
            Map map = new HashMap();
            map.put("userId",userId);
            map.put("name","AndroidUserName");
            Log.i("Android","fetchUserInfo 通过 methodchannel 返回结果给 flutter 内容为 "+map.toString());
            methodChannel.invokeMethod(HelloMethodKey.FetchUserInfoCallBack,map);
        }
    }
}
