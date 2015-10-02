//
//  HttpModel.h
//  youtuSDKDemo
//
//  Created by HeXue on 15/9/22.
//  Copyright © 2015年 Mony. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    YHCMethodPost,
    YHCMethodGet
} YHCMethod;

@interface HttpModel : NSObject

@property (nonatomic,copy) NSString *url;

@property (nonatomic,assign) YHCMethod method;

@property (nonatomic,assign) int timeout;

@property (nonatomic,copy) NSString *data;

+(NSMutableDictionary *)requestHeaderFieldParams:(NSInteger)contentLength signStr:(NSString *)signStr;

+ (void)POST:(NSURL *)url
  parameters:(id)parameters
     success:(void (^)(NSURLSessionDataTask *task, NSData  *responseData, NSDictionary *dataDic))success
     failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
@end
