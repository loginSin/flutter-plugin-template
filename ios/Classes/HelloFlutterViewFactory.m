//
//  HelloFlutterViewFactory.m
//  hello_flutter_plugin
//
//  Created by Sin on 2019/7/2.
//

#import "HelloFlutterViewFactory.h"
#import "HelloFlutterTemplateViewControl.h"

@implementation HelloFlutterViewFactory{
    NSObject<FlutterBinaryMessenger>*_messenger;
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger> *)messager{
    self = [super init];
    if (self) {
        _messenger = messager;
    }
    return self;
}

-(NSObject<FlutterMessageCodec> *)createArgsCodec{
    return [FlutterStandardMessageCodec sharedInstance];
}

-(NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args{
    NSLog(@"%s",__func__);
    NSLog(@"ios 获取原生view 参数为 %@",args);
    HelloFlutterTemplateViewControl *activity = [[HelloFlutterTemplateViewControl alloc] initWithWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    return activity;
}

@end
