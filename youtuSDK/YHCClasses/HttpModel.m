//
//  HttpModel.m
//  youtuSDKDemo
//
//  Created by HeXue on 15/9/22.
//  Copyright © 2015年 Mony. All rights reserved.
//

#import "HttpModel.h"
#import "ConfigModel.h"
#import "AuthModel.h"
#import "Tools.h"
#import "YHCError/YHCErrorModels.h"

@implementation HttpModel

+(NSMutableDictionary *)requestHeaderFieldParams:(NSInteger)contentLength signStr:(NSString *)signStr {

    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    [params setObject:signStr forKey:@"Authorization"];
    [params setObject:@"text/json" forKey:@"Content-Type"];
    [params setObject:[NSString stringWithFormat:@"%lu",contentLength] forKey:@"Content-Length"];
    [params setObject:@"api.youtu.qq.com" forKey:@"Host"];
    return params;
}

+ (void)POST:(NSURL *)url
  parameters:(id)parameters
     success:(void (^)(NSURLSessionDataTask *task, NSData  *responseData, NSDictionary *dataDic))success
     failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    NSString *expired = [NSString stringWithFormat:@"%ld",[Tools getExpiredTime10Day]];
    NSString *signStr = [AuthModel appSignWithExpired:expired UserId:[ConfigModel sharedConfigModel].UserID];
    
    NSError *error;
    NSData *postDataJson = [NSJSONSerialization dataWithJSONObject:parameters options:(NSJSONWritingPrettyPrinted) error:&error];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"post";
    NSMutableDictionary *dict=[self requestHeaderFieldParams:postDataJson.length signStr:signStr];
    for (id key in dict) {
        [request setValue:[dict objectForKey:key] forHTTPHeaderField:key];
    }
    request.HTTPBody = postDataJson;
    request.timeoutInterval = 10;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            if (failure) {
                failure(nil,error);
            }
            
        }else
        {
            if (data) {
                NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSError *errorCode=[Tools getErrorCode:dataStr];
                if (errorCode!=nil) {
                    failure(nil,errorCode);
                    return ;
                }
            
                NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                NSNumber *errorCodeNo = dataDic[@"errorcode"];
                
                if (errorCodeNo.integerValue != 0) {
                    NSError *sdkError = [YHCErrorModels getWithErrorCode:errorCodeNo.stringValue];
                    failure(nil,sdkError);
                    return;
                }
//                NSLog(@"%@",dataDic);
                success(dataTask,data,dataDic);
            }
        }
        
    }];
    
    [dataTask resume];
}


@end
