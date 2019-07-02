#import "HelloFlutterPlugin.h"
#import "HelloFlutterWrapper.h"
#import "HelloFlutterViewFactory.h"

@implementation HelloFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"hello_flutter_plugin"
            binaryMessenger:[registrar messenger]];
  HelloFlutterPlugin* instance = [[HelloFlutterPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
  [[HelloFlutterWrapper sharedInstance] saveMethodChannel:channel];
  [registrar registerViewFactory:[[HelloFlutterViewFactory alloc] initWithMessenger:registrar.messenger] withId:@"template_view"];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    [[HelloFlutterWrapper sharedInstance] wrapperHandleMethodCall:call result:result];
}

@end
