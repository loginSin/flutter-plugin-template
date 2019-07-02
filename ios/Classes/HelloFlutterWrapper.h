//
//  HelloFlutterWrapper.h
//  hello_flutter_plugin
//
//  Created by Sin on 2019/7/2.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface HelloFlutterWrapper : NSObject
+ (instancetype)sharedInstance;
- (void)saveMethodChannel:(FlutterMethodChannel *)channel;
- (void)wrapperHandleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result;
@end

NS_ASSUME_NONNULL_END
