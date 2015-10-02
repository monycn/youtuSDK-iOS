//
//  YHCErrorModels.m
//  youtuSDKDemo
//
//  Created by 远孚 陈 on 15/9/22.
//  Copyright © 2015年 Mony. All rights reserved.
//

#import "YHCErrorModels.h"

@interface YHCErrorModels ()

@end
@implementation YHCErrorModels
- (NSArray *)Errors{
    if (_Errors == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Error" ofType:@"plist"];
        _Errors = [NSArray arrayWithContentsOfFile:path];
    }
    return _Errors;
}
+ (NSError *)getWithErrorCode:(NSString *)code{
    YHCErrorModels *models = [[YHCErrorModels alloc]init];
    NSInteger ercode = [code integerValue];
     NSString *Domain = @"YHCYouTuSDK";
   __block NSString *totlecode = @"NULL";
    __block NSString *massage = @"未知错误";
    [models.Errors enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSInteger objcode = [[obj objectForKey:@"errorCode"] integerValue];
        if (ercode == objcode) {
            totlecode = [obj objectForKey:@"errorTotalCode"];
            massage = [obj objectForKey:@"errorMassage"];
        }
    }];
    NSDictionary *dict = @{@"errorMassage":massage,@"Errorcode":totlecode};
    NSError *error = [[NSError alloc]initWithDomain:Domain code:ercode userInfo:dict];
    return error;
}


@end
