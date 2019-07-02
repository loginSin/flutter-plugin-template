//
//  HelloFlutterWrapper.m
//  hello_flutter_plugin
//
//  Created by Sin on 2019/7/2.
//

#import "HelloFlutterWrapper.h"
#import "HelloMethodKey.h"

@interface HelloFlutterWrapper ()
@property(nonatomic, strong) FlutterMethodChannel* channel;
@end

@implementation HelloFlutterWrapper
+ (instancetype)sharedInstance {
    static HelloFlutterWrapper *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)saveMethodChannel:(FlutterMethodChannel *)channel {
    self.channel = channel;
}

- (void)wrapperHandleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([HelloMethodKeyInit isEqualToString:call.method]) {
        [self initWithAppkey:call.arguments];
    }else if([HelloMethodKeyGetCurrentUserPhone isEqualToString:call.method]) {
        [self getCurrentUserPhone:call.arguments result:result];
    }else if([HelloMethodKeyFetchUserInfo isEqualToString:call.method]) {
        [self fetchUserInfo:call.arguments];
    } else {
        result(FlutterMethodNotImplemented);
    }
}


#pragma mark -

- (void)initWithAppkey:(id)arg {
    //不用给 flutter 处理了结果
    if([arg isKindOfClass:[NSString class]]) {
        NSString *appkey = (NSString *)arg;
        //可以按照业务需求处理 appkey
        //此处仅打印了 appkey 的内容
        NSLog(@"iOS init 接收的 appkey 为 %@",appkey);
    }
}

- (void)getCurrentUserPhone:(id)arg result:(FlutterResult)result{
    //通过 result 返回结果给 flutter
    if([arg isKindOfClass:[NSString class]]) {
        NSString *userId = (NSString *)arg;
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setObject:userId forKey:@"userId"];
        [dic setObject:@"18512345678" forKey:@"phone"];
        NSLog(@"iOS getCurrentUserPhone 通过 result 返回结果给 flutter 内容为 %@",dic);
        result(dic);
    }
}

- (void)fetchUserInfo:(id)arg {
    //通过 methodchannel 返回结果给 flutter
    if([arg isKindOfClass:[NSString class]]) {
        NSString *userId = (NSString *)arg;
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setObject:userId forKey:@"userId"];
        [dic setObject:@"iosUserName" forKey:@"name"];
        NSLog(@"iOS fetchUserInfo 通过 methodchannel 返回结果给 flutter 内容为 %@",dic);
        [self.channel invokeMethod:HelloMethodCallBackKeyFetchUserInfo arguments:dic];
    }
}
@end
