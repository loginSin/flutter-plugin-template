package com.example.hello_flutter_plugin;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** HelloFlutterPlugin */
public class HelloFlutterPlugin implements MethodCallHandler {
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "hello_flutter_plugin");
    channel.setMethodCallHandler(new HelloFlutterPlugin());
    HelloFlutterWrapper.getInstance().saveMethodChannel(channel);
    registrar.platformViewRegistry().registerViewFactory("template_view",new HelloFlutterViewFactory(registrar.messenger()));
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    HelloFlutterWrapper.getInstance().onWrapperMethodCall(call,result);
  }
}
