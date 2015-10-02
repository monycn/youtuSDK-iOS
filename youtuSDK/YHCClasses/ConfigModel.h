//
//  ConfigModel.h
//  youtuSDKDemo
//
//  Created by Mony on 15/9/21.
//  Copyright © 2015年 Mony. All rights reserved.
//

#import <Foundation/Foundation.h>
#define SDK_VERSION @"1.0.0"
#define API_YOUTU_URL @"http://api.youtu.qq.com/"
#define API_TENCENTYUN_URL @"https://youtu.api.qcloud.com/"

@interface ConfigModel : NSObject

/**
 平台添加应用后分配的AppId
 */
@property (nonatomic,copy) NSString *APPID;

/**
 平台添加应用后分配的SecretId
 */
@property (nonatomic,copy) NSString *SecretID;

/**
 平台添加应用后分配的SecretKey
 */
@property (nonatomic,copy) NSString *SecretKey;

/**
 接入业务自行定义的用户id，用于唯一标识一个用户
 */
@property (nonatomic,copy) NSString *UserID;

/**
 配置的信息单例
 
 @return 配置信息单例对象
 */
+ (instancetype) sharedConfigModel;

/**
 初始化配置信息。从Config.plist中获取配置
 */
- (void) initConfigWithAppId;

/**
 获取当前SDK版本号
 */
- (NSString *) getVersion;

@end
