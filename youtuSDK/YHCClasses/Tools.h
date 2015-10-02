//
//  Tools.h
//  youtuSDKDemo
//
//  Created by Mony on 15/9/21.
//  Copyright © 2015年 Mony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject

/**
 获取当前时间的时间戳
 
 @return 返回10位时间戳
 */
+ (long) getNowTime;

/**
 获得过期时间时间戳
 
 @param delayDays delayDays 过期的天数
 
 @return 返回过期时间时间戳
 */
+ (long) getExpiredTimeWithDay:(int)delayDays;

/**
 @return 返回过期时间为10天的时间戳
 */
+ (long) getExpiredTime10Day;

/**
 获得实际发送的Url
 
 @param apiUrl   apiUrl 实际调用接口的相对地址
 @param isApiUrl isApiUrl 是否为API主机，否则为腾讯云主机
 
 @return 返回生成的URL
 */
+ (NSURL *) getAPIUrlWithUrlStr:(NSString *)apiUrl isApiUrl:(BOOL)isApiUrl;

/**
 获得过错误类型
 
 @param dataStr dataStr html解析
 
 @return 返回NSError错误 */

+(NSError *) getErrorCode:(NSString *)dataStr;
@end
