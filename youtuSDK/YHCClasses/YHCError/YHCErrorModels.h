//
//  YHCErrorModels.h
//  youtuSDKDemo
//
//  Created by 远孚 陈 on 15/9/22.
//  Copyright © 2015年 Mony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHCErrorModels : NSObject
@property(nonatomic,strong)NSArray *HttpRespons;
@property(nonatomic,strong)NSArray *ProtocolEorrorCodes;
@property(nonatomic,strong)NSArray *Errors;

+ (NSError *)getWithErrorCode:(NSString *)code;
@end
