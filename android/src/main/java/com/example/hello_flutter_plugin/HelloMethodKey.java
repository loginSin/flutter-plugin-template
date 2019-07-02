package com.example.hello_flutter_plugin;

public class HelloMethodKey {
    //key 由 flutter 触发，native 响应
    static String Init = "Init";
    static String GetCurrentUserPhone = "GetCurrentUserPhone";
    static String FetchUserInfo = "FetchUserInfo";

    //callback key 由 native 触发，flutter 响应
    static String FetchUserInfoCallBack = "FetchUserInfoCallBack";
}
