//
//  YouTu.m
//  youtuSDKDemo
//
//  Created by Mony on 15/9/22.
//  Copyright © 2015年 Mony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YouTu.h"
#import "Tools.h"
#import "ConfigModel.h"
#import "HttpModel.h"

@implementation YouTu

/**
 @author Mony
 人脸检测（detectface）
 
 @param imagePath   图片在设备中的位置，与图片链接二选一，如都存在，以链接为准
 @param imageUrlStr 图片链接，与图片在设备中的位置二选一，如都存在，以链接为准
 @param isBigFace   是否是大脸模式，Yes大脸，No多脸
 @param success     成功回调，返回Json串
 @param failure     失败回调，返回NSError
 */
+ (void)detectfaceWithImagePath:(NSString *)imagePath ImageUrlStr:(NSString *)imageUrlStr
                      IsBigFace:(BOOL)isBigFace
                        success:(void (^)(NSDictionary  *responseDict))success
                        failure:(void (^)(NSError *error))failure {
    
    NSData *imageData = [NSData dataWithContentsOfFile:imagePath];

    NSAssert((imageData != nil || imageUrlStr != nil), @"图片数据与图片链接至少有一个！具体报错位置请部署全局断点查看。");

    NSURL *postURLStr = [Tools getAPIUrlWithUrlStr:@"youtu/api/detectface" isApiUrl:YES];
    
    NSMutableDictionary *postData = [NSMutableDictionary dictionary];
    postData[@"app_id"] = [ConfigModel sharedConfigModel].APPID;
    imageData = [imageData base64EncodedDataWithOptions:(NSDataBase64Encoding64CharacterLineLength)];
    if (imageData != nil) {
        postData[@"image"] = [[NSString alloc] initWithData:imageData encoding:NSUTF8StringEncoding];
    }
    
    if (imageUrlStr != nil) {
        postData[@"url"] = imageUrlStr;
    }
    
    postData[@"mode"] = isBigFace ? @(1) : @(0);
 
    [HttpModel POST:postURLStr parameters:postData  success:^(NSURLSessionDataTask *task, id responseData, NSDictionary *jsonDict) {
        if (success) {
            success(jsonDict);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 @author Mony
 人脸定位（faceshape）
 
 @param imagePath   图片在设备中的位置，与图片链接二选一，如都存在，以链接为准
 @param imageUrlStr 图片链接，与图片在设备中的位置二选一，如都存在，以链接为准
 @param isBigFace   是否是大脸模式，Yes大脸，No多脸
 @param success     成功回调，返回Json串
 @param failure     失败回调，返回NSError
 */
+ (void)faceshapeWithImagePath:(NSString *)imagePath ImageUrlStr:(NSString *)imageUrlStr
                     IsBigFace:(BOOL)isBigFace
                       success:(void (^)(NSDictionary  *responseDict))success
                       failure:(void (^)(NSError *error))failure {
    
    NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
    
    NSAssert((imageData != nil || imageUrlStr != nil), @"图片数据与图片链接至少有一个！具体报错位置请部署全局断点查看。");
    
    NSURL *postURLStr = [Tools getAPIUrlWithUrlStr:@"youtu/api/faceshape" isApiUrl:YES];
    
    NSMutableDictionary *postData = [NSMutableDictionary dictionary];
    postData[@"app_id"] = [ConfigModel sharedConfigModel].APPID;
    imageData = [imageData base64EncodedDataWithOptions:(NSDataBase64Encoding64CharacterLineLength)];
    if (imageData != nil) {
        postData[@"image"] = [[NSString alloc] initWithData:imageData encoding:NSUTF8StringEncoding];
    }
    
    if (imageUrlStr != nil) {
        postData[@"url"] = imageUrlStr;
    }
    
    postData[@"mode"] = isBigFace ? @(1) : @(0);
    
    [HttpModel POST:postURLStr parameters:postData  success:^(NSURLSessionDataTask *task, id responseData, NSDictionary *jsonDict) {
        if (success) {
            success(jsonDict);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 @author Mony
 人脸对比（facecompare）
 
 @param imageAPath  图片A在设备中的位置，与图片链接二选一，如都存在，以链接为准
 @param imageBPath  图片B在设备中的位置，与图片链接二选一，如都存在，以链接为准
 @param imageUrlStr 图片A链接，与图片在设备中的位置二选一，如都存在，以链接为准
 @param imageUrlStr 图片B链接，与图片在设备中的位置二选一，如都存在，以链接为准
 @param success     成功回调，返回Json串
 @param failure     失败回调，返回NSError
 */
+ (void)facecompareWithImageAPath:(NSString *)imageAPath ImageBPath:(NSString *)imageBPath
                     ImageAUrlStr:(NSString *)imageAUrlStr
                     ImageBUrlStr:(NSString *)imageBUrlStr
                          success:(void (^)(NSDictionary  *responseDict))success
                          failure:(void (^)(NSError *error))failure {
    
    NSData *imageAData = [NSData dataWithContentsOfFile:imageAPath];
    NSData *imageBData = [NSData dataWithContentsOfFile:imageBPath];
    
    NSAssert((imageAData != nil || imageAUrlStr != nil), @"图片A数据与图片A链接至少有一个！具体报错位置请部署全局断点查看。");
    NSAssert((imageBData != nil || imageBUrlStr != nil), @"图片A数据与图片A链接至少有一个！具体报错位置请部署全局断点查看。");
    
    NSURL *postURLStr = [Tools getAPIUrlWithUrlStr:@"youtu/api/facecompare" isApiUrl:YES];
    
    NSMutableDictionary *postData = [NSMutableDictionary dictionary];
    postData[@"app_id"] = [ConfigModel sharedConfigModel].APPID;
    imageAData = [imageAData base64EncodedDataWithOptions:(NSDataBase64Encoding64CharacterLineLength)];
    if (imageAData != nil) {
        postData[@"imageA"] = [[NSString alloc] initWithData:imageAData encoding:NSUTF8StringEncoding];
    }
    
    if (imageAUrlStr != nil) {
        postData[@"urlA"] = imageAUrlStr;
    }
    
    imageBData = [imageBData base64EncodedDataWithOptions:(NSDataBase64Encoding64CharacterLineLength)];
    if (imageBData != nil) {
        postData[@"imageB"] = [[NSString alloc] initWithData:imageBData encoding:NSUTF8StringEncoding];
    }
    
    if (imageBUrlStr != nil) {
        postData[@"urlB"] = imageAUrlStr;
    }
    
    [HttpModel POST:postURLStr parameters:postData  success:^(NSURLSessionDataTask *task, id responseData, NSDictionary *jsonDict) {
        if (success) {
            success(jsonDict);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 @author Mony
 人脸识别（faceidentify）
 
 @param imagePath   图片在设备中的位置，与图片链接二选一，如都存在，以链接为准
 @param imageUrlStr 图片链接，与图片在设备中的位置二选一，如都存在，以链接为准
 @param groupId     候选人组id
 @param success     成功回调，返回Json串
 @param failure     失败回调，返回NSError
 */
+ (void)faceidentifyWithImagePath:(NSString *)imagePath ImageUrlStr:(NSString *)imageUrlStr
                          GroupId:(NSString *)groupId
                          success:(void (^)(NSDictionary  *responseDict))success
                          failure:(void (^)(NSError *error))failure {
    
    NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
    
    NSAssert((imageData != nil || imageUrlStr != nil), @"图片数据与图片链接至少有一个！具体报错位置请部署全局断点查看。");
    
    NSURL *postURLStr = [Tools getAPIUrlWithUrlStr:@"youtu/api/faceidentify" isApiUrl:YES];
    
    NSMutableDictionary *postData = [NSMutableDictionary dictionary];
    postData[@"app_id"] = [ConfigModel sharedConfigModel].APPID;
    imageData = [imageData base64EncodedDataWithOptions:(NSDataBase64Encoding64CharacterLineLength)];
    if (imageData != nil) {
        postData[@"image"] = [[NSString alloc] initWithData:imageData encoding:NSUTF8StringEncoding];
    }
    
    if (imageUrlStr != nil) {
        postData[@"url"] = imageUrlStr;
    }
    
    NSAssert(groupId != nil, @"组别ID为必传参数！具体报错位置请部署全局断点查看。");
    if (groupId != nil) {
        postData[@"group_id"] = groupId;
    }
    
    [HttpModel POST:postURLStr parameters:postData  success:^(NSURLSessionDataTask *task, id responseData, NSDictionary *jsonDict) {
        if (success) {
            success(jsonDict);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 @author Mony
 人脸验证（faceverify）
 
 @param imagePath   图片在设备中的位置，与图片链接二选一，如都存在，以链接为准
 @param imageUrlStr 图片链接，与图片在设备中的位置二选一，如都存在，以链接为准
 @param personId    待验证的Person
 @param success     成功回调，返回Json串
 @param failure     失败回调，返回NSError
 */
+ (void)faceverifyWithImagePath:(NSString *)imagePath ImageUrlStr:(NSString *)imageUrlStr
                       PersonId:(NSString *)personId
                        success:(void (^)(NSDictionary  *responseDict))success
                        failure:(void (^)(NSError *error))failure {
    
    NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
    
    NSAssert((imageData != nil || imageUrlStr != nil), @"图片数据与图片链接至少有一个！具体报错位置请部署全局断点查看。");
    
    NSURL *postURLStr = [Tools getAPIUrlWithUrlStr:@"youtu/api/faceverify" isApiUrl:YES];
    
    NSMutableDictionary *postData = [NSMutableDictionary dictionary];
    postData[@"app_id"] = [ConfigModel sharedConfigModel].APPID;
    imageData = [imageData base64EncodedDataWithOptions:(NSDataBase64Encoding64CharacterLineLength)];
    if (imageData != nil) {
        postData[@"image"] = [[NSString alloc] initWithData:imageData encoding:NSUTF8StringEncoding];
    }
    
    if (imageUrlStr != nil) {
        postData[@"url"] = imageUrlStr;
    }
    
    NSAssert(personId != nil, @"人员ID为必传参数！具体报错位置请部署全局断点查看。");
    if (personId != nil) {
        postData[@"person_id"] = personId;
    }
    
    [HttpModel POST:postURLStr parameters:postData  success:^(NSURLSessionDataTask *task, id responseData, NSDictionary *jsonDict) {
        if (success) {
            success(jsonDict);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 @author Hexue
 个体创建（newperson）
 
 @param imagePath   图片在设备中的位置，与图片链接二选一，如都存在，以链接为准
 @param imageUrlStr 图片链接，与图片在设备中的位置二选一，如都存在，以链接为准
 @param personId    指定的个体id
 @param groupIds    加入到组的列表
 @param personName  个体名字（可选）
 @param tag         备注信息（可选）
 @param success     成功回调，返回Json串
 @param failure     失败回调，返回NSError
 */
+ (void)newpersonWithImagePath:(NSString *)imagePath ImageUrlStr:(NSString *)imageUrlStr
                      PersonId:(NSString *)personId
                      GroupIds:(NSArray<NSString *> *)groupIds
                    PersonName:(NSString *)personName
                           Tag:(NSString *)tag
                       success:(void (^)(NSDictionary  *responseDict))success
                       failure:(void (^)(NSError *error))failure {
    
    NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
    
    NSAssert((imageData != nil || imageUrlStr != nil), @"图片数据与图片链接至少有一个！具体报错位置请部署全局断点查看。");
    
    NSURL *postURLStr = [Tools getAPIUrlWithUrlStr:@"youtu/api/newperson" isApiUrl:YES];
    
    NSMutableDictionary *postData = [NSMutableDictionary dictionary];
    postData[@"app_id"] = [ConfigModel sharedConfigModel].APPID;
    imageData = [imageData base64EncodedDataWithOptions:(NSDataBase64Encoding64CharacterLineLength)];
    if (imageData != nil) {
        postData[@"image"] = [[NSString alloc] initWithData:imageData encoding:NSUTF8StringEncoding];
    }
    
    if (imageUrlStr != nil) {
        postData[@"url"] = imageUrlStr;
    }
    
    NSAssert(groupIds != nil, @"人员ID为必传参数！具体报错位置请部署全局断点查看。");
    if (groupIds != nil) {
        postData[@"group_ids"] = groupIds;
    }
    
    NSAssert(personId != nil, @"人员ID为必传参数！具体报错位置请部署全局断点查看。");
    if (personId != nil) {
        postData[@"person_id"] = personId;
    }
    
    if (personName != nil) {
        postData[@"person_name"] = personName;
    }
    
    if (tag != nil) {
        postData[@"tag"] = tag;
    }
    
    [HttpModel POST:postURLStr parameters:postData  success:^(NSURLSessionDataTask *task, id responseData, NSDictionary *jsonDict) {
        if (success) {
            success(jsonDict);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 @author Hexue
 删除一个Person（delperson）
 
 @param personId 待删除个体ID
 @param success  成功回调，返回Json串
 @param failure  失败回调，返回NSError
 */
+ (void)delpersonWithPersonId:(NSString *)personId
                      success:(void (^)(NSDictionary  *responseDict))success
                      failure:(void (^)(NSError *error))failure {
    
    NSURL *postURLStr = [Tools getAPIUrlWithUrlStr:@"youtu/api/delperson" isApiUrl:YES];
    
    NSMutableDictionary *postData = [NSMutableDictionary dictionary];
    postData[@"app_id"] = [ConfigModel sharedConfigModel].APPID;
    
    NSAssert(personId != nil, @"人员ID为必传参数！具体报错位置请部署全局断点查看。");
    if (personId != nil) {
        postData[@"person_id"] = personId;
    }
    
    [HttpModel POST:postURLStr parameters:postData  success:^(NSURLSessionDataTask *task, id responseData, NSDictionary *jsonDict) {
        if (success) {
            success(jsonDict);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 @author Hexue
 添加人脸（addface）
 
 @param imagePath   图片在设备中的位置，与图片链接二选一，如都存在，以链接为准
 @param imageUrlStr 图片链接，与图片在设备中的位置二选一，如都存在，以链接为准
 @param personId    待增加人脸的个体id
 @param tag         备注信息
 @param success     成功回调，返回Json串
 @param failure     失败回调，返回NSError
 */
+ (void)addfaceWithImagePath:(NSString *)imagePath ImageUrlStr:(NSString *)imageUrlStr
                    PersonId:(NSString *)personId
                         Tag:(NSString *)tag
                     success:(void (^)(NSDictionary  *responseDict))success
                     failure:(void (^)(NSError *error))failure {
    
    NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
    
    NSAssert((imageData != nil || imageUrlStr != nil), @"图片数据与图片链接至少有一个！具体报错位置请部署全局断点查看。");
    
    NSURL *postURLStr = [Tools getAPIUrlWithUrlStr:@"youtu/api/addface" isApiUrl:YES];
    
    NSMutableDictionary *postData = [NSMutableDictionary dictionary];
    postData[@"app_id"] = [ConfigModel sharedConfigModel].APPID;
    imageData = [imageData base64EncodedDataWithOptions:(NSDataBase64Encoding64CharacterLineLength)];
    if (imageData != nil) {
        postData[@"image"] = [[NSString alloc] initWithData:imageData encoding:NSUTF8StringEncoding];
    }
    
    if (imageUrlStr != nil) {
        postData[@"url"] = imageUrlStr;
    }
    
    if (personId != nil) {
        postData[@"person_id"] = personId;
    }
    
    if (tag != nil) {
        postData[@"tag"] = tag;
    }
    
    [HttpModel POST:postURLStr parameters:postData  success:^(NSURLSessionDataTask *task, id responseData, NSDictionary *jsonDict) {
        if (success) {
            success(jsonDict);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 @author Hexue
 删除人脸（delface）
 
 @param personId 待删除人脸的person ID
 @param faceIds  删除人脸id的列表
 @param success  成功回调，返回Json串
 @param failure  失败回调，返回NSError
 */
+ (void)delfaceWithPersonId:(NSString *)personId
                    FaceIds:(NSArray<NSString *> *)faceIds
                    success:(void (^)(NSDictionary  *responseDict))success
                    failure:(void (^)(NSError *error))failure {
    
    NSURL *postURLStr = [Tools getAPIUrlWithUrlStr:@"youtu/api/delface" isApiUrl:YES];
    
    NSMutableDictionary *postData = [NSMutableDictionary dictionary];
    postData[@"app_id"] = [ConfigModel sharedConfigModel].APPID;
    
    NSAssert(personId != nil, @"人员ID为必传参数！具体报错位置请部署全局断点查看。");
    if (personId != nil) {
        postData[@"person_id"] = personId;
    }
    
    NSAssert(faceIds != nil, @"人脸ID为必传参数！具体报错位置请部署全局断点查看。");
    if (faceIds != nil) {
        postData[@"face_ids"] = faceIds;
    }
    
    [HttpModel POST:postURLStr parameters:postData  success:^(NSURLSessionDataTask *task, id responseData, NSDictionary *jsonDict) {
        if (success) {
            success(jsonDict);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 @author Hexue
 设置Person的信息（setinfo）
 
 @param personId   相应person的id
 @param personName 新的name（可选）
 @param tag        备注信息（可选）
 @param success    成功回调，返回Json串
 @param failure    失败回调，返回NSError
 */
+ (void)setinfoWithPersonId:(NSString *)personId
                 PersonName:(NSString *)personName
                        Tag:(NSString *)tag
                    success:(void (^)(NSDictionary  *responseDict))success
                    failure:(void (^)(NSError *error))failure {
    
    NSURL *postURLStr = [Tools getAPIUrlWithUrlStr:@"youtu/api/setinfo" isApiUrl:YES];
    
    NSMutableDictionary *postData = [NSMutableDictionary dictionary];
    postData[@"app_id"] = [ConfigModel sharedConfigModel].APPID;
    
    NSAssert(personId != nil, @"人员ID为必传参数！具体报错位置请部署全局断点查看。");
    if (personId != nil) {
        postData[@"person_id"] = personId;
    }
    
    if (personName != nil) {
        postData[@"person_name"] = personName;
    }
    
    if (tag != nil) {
        postData[@"tag"] = tag;
    }
    
    [HttpModel POST:postURLStr parameters:postData  success:^(NSURLSessionDataTask *task, id responseData, NSDictionary *jsonDict) {
        if (success) {
            success(jsonDict);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 @author Hexue
 获取一个Person的信息（getinfo）
 
 @param personId 待查询个体的ID
 @param success  成功回调，返回Json串
 @param failure  失败回调，返回NSError
 */
+ (void)getinfoWithPersonId:(NSString *)personId
                    success:(void (^)(NSDictionary  *responseDict))success
                    failure:(void (^)(NSError *error))failure {
    
    NSURL *postURLStr = [Tools getAPIUrlWithUrlStr:@"youtu/api/getinfo" isApiUrl:YES];
    
    NSMutableDictionary *postData = [NSMutableDictionary dictionary];
    postData[@"app_id"] = [ConfigModel sharedConfigModel].APPID;
    
    NSAssert(personId != nil, @"人员ID为必传参数！具体报错位置请部署全局断点查看。");
    if (personId != nil) {
        postData[@"person_id"] = personId;
    }
    
    [HttpModel POST:postURLStr parameters:postData  success:^(NSURLSessionDataTask *task, id responseData, NSDictionary *jsonDict) {
        if (success) {
            success(jsonDict);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 @author Mony
 获取一个AppId下所有group列表（getgroupids）
 
 @param success 成功回调，返回Json串
 @param failure 失败回调，返回NSError
 */
+ (void)getgroupidsWithsuccess:(void (^)(NSDictionary  *responseDict))success
                       failure:(void (^)(NSError *error))failure {
    
    NSURL *postURLStr = [Tools getAPIUrlWithUrlStr:@"youtu/api/getgroupids" isApiUrl:YES];
    
    NSMutableDictionary *postData = [NSMutableDictionary dictionary];
    postData[@"app_id"] = [ConfigModel sharedConfigModel].APPID;
    
    [HttpModel POST:postURLStr parameters:postData  success:^(NSURLSessionDataTask *task, id responseData, NSDictionary *jsonDict) {
        if (success) {
            success(jsonDict);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 @author Mony
 获取一个组Group中所有Person列表（getpersonIds）
 
 @param groupId 组id
 @param success 成功回调，返回Json串
 @param failure 失败回调，返回NSError
 */
+ (void)getpersonIdsWithGroupId:(NSString *)groupId
                        success:(void (^)(NSDictionary  *responseDict))success
                        failure:(void (^)(NSError *error))failure {
    
    NSURL *postURLStr = [Tools getAPIUrlWithUrlStr:@"youtu/api/getpersonids" isApiUrl:YES];
    
    NSMutableDictionary *postData = [NSMutableDictionary dictionary];
    postData[@"app_id"] = [ConfigModel sharedConfigModel].APPID;
    
    NSAssert(groupId != nil, @"组别ID为必传参数！具体报错位置请部署全局断点查看。");
    if (groupId != nil) {
        postData[@"group_id"] = groupId;
    }
    
    [HttpModel POST:postURLStr parameters:postData  success:^(NSURLSessionDataTask *task, id responseData, NSDictionary *jsonDict) {
        if (success) {
            success(jsonDict);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 @author Mony
 获取一个组Person中的所有face列表（getfaceIds）
 
 @param personId 个体id
 @param success  成功回调，返回Json串
 @param failure  失败回调，返回NSError
 */
+ (void)getfaceIdsWithPersonId:(NSString *)personId
                       success:(void (^)(NSDictionary  *responseDict))success
                       failure:(void (^)(NSError *error))failure {
    
    NSURL *postURLStr = [Tools getAPIUrlWithUrlStr:@"youtu/api/getfaceids" isApiUrl:YES];
    
    NSMutableDictionary *postData = [NSMutableDictionary dictionary];
    postData[@"app_id"] = [ConfigModel sharedConfigModel].APPID;
    
    NSAssert(personId != nil, @"人员ID为必传参数！具体报错位置请部署全局断点查看。");
    if (personId != nil) {
        postData[@"person_id"] = personId;
    }
    
    [HttpModel POST:postURLStr parameters:postData  success:^(NSURLSessionDataTask *task, id responseData, NSDictionary *jsonDict) {
        if (success) {
            success(jsonDict);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 @author Mony
 获取一个face的相关特征信息（getfaceinfo）
 
 @param faceId  人脸id
 @param success 成功回调，返回Json串
 @param failure 失败回调，返回NSError
 */
+ (void)getfaceinfoWithFaceId:(NSString *)faceId
                      success:(void (^)(NSDictionary  *responseDict))success
                      failure:(void (^)(NSError *error))failure {
    
    NSURL *postURLStr = [Tools getAPIUrlWithUrlStr:@"youtu/api/getfaceinfo" isApiUrl:YES];
    
    NSMutableDictionary *postData = [NSMutableDictionary dictionary];
    postData[@"app_id"] = [ConfigModel sharedConfigModel].APPID;
    
    NSAssert(faceId != nil, @"人脸ID为必传参数！具体报错位置请部署全局断点查看。");
    if (faceId != nil) {
        postData[@"face_id"] = faceId;
    }
    
    [HttpModel POST:postURLStr parameters:postData  success:^(NSURLSessionDataTask *task, id responseData, NSDictionary *jsonDict) {
        if (success) {
            success(jsonDict);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
