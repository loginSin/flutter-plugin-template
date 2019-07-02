//
//  HelloFlutterTemplateViewControl.h
//  hello_flutter_plugin
//
//  Created by Sin on 2019/7/2.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface HelloFlutterTemplateViewControl : NSObject<FlutterPlatformView>
- (instancetype)initWithWithFrame:(CGRect)frame
                   viewIdentifier:(int64_t)viewId
                        arguments:(id _Nullable)args
                  binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;

@end

NS_ASSUME_NONNULL_END
