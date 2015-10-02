//
//  AuthModel.h
//  youtuSDKDemo
//
//  Created by Mony on 15/9/21.
//  Copyright © 2015年 Mony. All rights reserved.
//

#import <Foundation/Foundation.h>
#define AUTH_URL_FORMAT_ERROR @"-1"
#define AUTH_SECRET_ID_KEY_ERROR @"-2"

@interface AuthModel : NSObject

/**
 获得授权签名
 
 @param expired expired 过期时间的时间戳
 @param userId  userId 用户标识
 
 @return 签名字符串
 */
+ (NSString *) appSignWithExpired:(NSString *)expired UserId:(NSString *)userId;

@end
