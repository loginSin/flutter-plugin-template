//
//  HelloMethodKey.h
//  hello_flutter_plugin
//
//  Created by Sin on 2019/7/2.
//

#ifndef HelloMethodKey_h
#define HelloMethodKey_h

//key 由 flutter 触发，native 响应
static NSString *HelloMethodKeyInit = @"Init";
static NSString *HelloMethodKeyGetCurrentUserPhone = @"GetCurrentUserPhone";
static NSString *HelloMethodKeyFetchUserInfo = @"FetchUserInfo";


//callback key 由 native 触发，flutter 响应
static NSString *HelloMethodCallBackKeyFetchUserInfo = @"FetchUserInfoCallBack";

#endif /* HelloMethodKey_h */
