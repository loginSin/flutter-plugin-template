//
//  HelloFlutterTemplateViewControl.m
//  hello_flutter_plugin
//
//  Created by Sin on 2019/7/2.
//

#import "HelloFlutterTemplateViewControl.h"

@implementation HelloFlutterTemplateViewControl{
    int64_t _viewId;
    FlutterMethodChannel* _channel;
    UIView * _templcateView;
}
- (instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        
        NSDictionary *dic = args;
        NSString *userId = dic[@"userId"];
        
        _templcateView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _templcateView.backgroundColor = [UIColor redColor];
        
        _viewId = viewId;
        NSString* channelName = [NSString stringWithFormat:@"template_view_%lld", viewId];
        _channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        __weak __typeof__(self) weakSelf = self;
        [_channel setMethodCallHandler:^(FlutterMethodCall *  call, FlutterResult  result) {
            [weakSelf onMethodCall:call result:result];
        }];
        
        
    }
    
    return self;
}

-(UIView *)view{
    return _templcateView;
}

-(void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result{
    //    if ([[call method] isEqualToString:@"start"]) {
    //        [_indicator startAnimating];
    //    }else
    //        if ([[call method] isEqualToString:@"stop"]){
    //            [_indicator stopAnimating];
    //        }
    //        else {
    //            result(FlutterMethodNotImplemented);
    //        }
}

@end
