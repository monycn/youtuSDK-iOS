//
//  ConfigModel.m
//  youtuSDKDemo
//
//  Created by Mony on 15/9/21.
//  Copyright © 2015年 Mony. All rights reserved.
//

#import "ConfigModel.h"

@implementation ConfigModel

+ (instancetype) sharedConfigModel {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ConfigModel alloc] init];
        [instance initConfigWithAppId];
    });
    return instance;
}

- (void) initConfigWithAppId {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Config.plist" ofType:nil];
    NSDictionary *config = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSString *appId = config[@"APPID"];
    NSString *secretId = config[@"SecretID"];
    NSString *secretKey = config[@"SecretKey"];
    NSString *userID = config[@"UserID"];
    
    NSAssert(appId != nil, @"appId不能为空，请在Config.plist中配置");
    NSAssert(secretId != nil, @"secretId不能为空，请在Config.plist中配置");
    NSAssert(secretKey != nil, @"secretKey不能为空，请在Config.plist中配置");
    NSAssert(userID != nil, @"userID不能为空，请在Config.plist中配置");
    
    self.APPID = appId;
    self.SecretID = secretId;
    self.SecretKey = secretKey;
    self.UserID = userID;
}

- (NSString *) getVersion {
    return SDK_VERSION;
}

@end
