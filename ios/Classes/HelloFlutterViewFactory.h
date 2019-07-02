//
//  HelloFlutterViewFactory.h
//  hello_flutter_plugin
//
//  Created by Sin on 2019/7/2.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface HelloFlutterViewFactory : NSObject<FlutterPlatformViewFactory>
- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messager;
@end

NS_ASSUME_NONNULL_END
