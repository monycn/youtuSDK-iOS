//
//  AuthModel.m
//  youtuSDKDemo
//
//  Created by Mony on 15/9/21.
//  Copyright © 2015年 Mony. All rights reserved.
//

#import "AuthModel.h"
#import "ConfigModel.h"
#import "Tools.h"
//#import "NSString+Hash.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation AuthModel

+ (NSString *) appSignWithExpired:(NSString *)expired UserId:(NSString *)userId {
    ConfigModel *config = [ConfigModel sharedConfigModel];
    [config initConfigWithAppId];
    
    if (config.SecretID == nil || config.SecretKey == nil) {
        return AUTH_SECRET_ID_KEY_ERROR;
    }
    
    NSString *nowSp = [NSString stringWithFormat:@"%ld",[Tools getNowTime]];
    unsigned long random = arc4random() % 10000000000;

    /* 测试代码*/
//    NSString *nowSp = @"1427786065";
//    unsigned long random = 270494647;
//    expired = @"1432970065";
    
    
    NSString *orignal = [NSString stringWithFormat:@"u=%@&a=%@&k=%@&e=%@&t=%@&r=%lu&f=",config.UserID,config.APPID,config.SecretID,expired,nowSp,random];
    
    /*对orignal进行SHA1哈希编码*/
    const char *keyData = config.SecretKey.UTF8String;
    const char *strData = orignal.UTF8String;
    unichar buffer[CC_SHA1_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA1, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    /* 把哈希编码后的数据根据官方要求，追加字符串并进行base64编码 */
    NSMutableData *binData = [[NSMutableData alloc] initWithBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
    [binData appendBytes:strData length:strlen(strData)];

    NSString *signStr = [binData base64EncodedStringWithOptions:(NSDataBase64Encoding64CharacterLineLength)];
    
    /* 因为OC编码后的字符串会增加一些换行符，因此下方查找并删除换行符 */
    NSMutableString *sign = [NSMutableString stringWithString:signStr];
    NSRange substr = [sign rangeOfString:@"\r\n"];             //删除生成字符串中的换行符“\r\n”
    while (substr.location != NSNotFound) {
        [sign deleteCharactersInRange:substr];
        substr = [sign rangeOfString:@"\r\n"];
    }
    
//    NSLog(@"%@",sign);

    return sign;
}

@end
