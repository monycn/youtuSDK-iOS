//
//  Tools.m
//  youtuSDKDemo
//
//  Created by Mony on 15/9/21.
//  Copyright © 2015年 Mony. All rights reserved.
//

#import "Tools.h"
#import "ConfigModel.h"

@implementation Tools

/**
 获取当前时间的时间戳
 
 @return 返回10位时间戳
 */
+ (long) getNowTime {
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval sp = [date timeIntervalSince1970];
    return (long)sp;
}

/**
 获得过期时间时间戳
 
 @param delayDays delayDays 过期的天数
 
 @return 返回过期时间时间戳
 */
+ (long) getExpiredTimeWithDay:(int)delayDays {
    long dalaySecond = delayDays * 60 * 60 * 24;
    return [self getNowTime] + dalaySecond;
}

/**
 @return 返回过期时间为10天的时间戳
 */
+ (long) getExpiredTime10Day {
    long dalaySecond = 10 * 60 * 60 * 24;
    return [self getNowTime] + dalaySecond;
}

+ (NSURL *) getAPIUrlWithUrlStr:(NSString *)apiUrl isApiUrl:(BOOL)isApiUrl {
    NSString *hostUrl = [NSString string];
    if (isApiUrl) {
        hostUrl = API_YOUTU_URL;
    }
    else {
        hostUrl = API_TENCENTYUN_URL;
    }
//    NSString *urlStr = [NSString stringWithFormat:@"%@%@",hostUrl,apiUrl];
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",hostUrl,apiUrl]];
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",hostUrl,apiUrl]];
}
+(NSError *) getErrorCode:(NSString *)dataStr {
    
    if (![dataStr containsString:@"<title>"]) {
        return nil;
    }
    NSRange titleRange= [dataStr rangeOfString:@"<title>"] ;
    NSRange titleEndRange=[dataStr rangeOfString:@"</title>"];
    NSRange errorRange;
    errorRange.location=NSMaxRange(titleRange);
    errorRange.length=titleEndRange.location-NSMaxRange(titleRange);
    NSString *errorStr= [dataStr substringWithRange:errorRange];
    NSInteger errCode = [[errorStr substringToIndex:3] intValue];
    NSError *error =[[NSError alloc]initWithDomain:[NSString stringWithFormat:@"%zu错误",errCode] code:errCode userInfo:nil];
    return error;
}
@end
