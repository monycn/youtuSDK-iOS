//
//  YouTu.h
//  youtuSDKDemo
//
//  Created by Mony on 15/9/22.
//  Copyright © 2015年 Mony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YouTu : NSObject

/**
 @author Mony
 人脸检测（detectface）
 
 @param image       图片，与图片链接二选一，如都存在，以链接为准
 @param imageUrlStr 图片链接，与图片在设备中的位置二选一，如都存在，以链接为准
 @param isBigFace   是否是大脸模式，Yes大脸，No多脸
 @param success     成功回调，返回Json串
 @param failure     失败回调，返回NSError
 */
+ (void)detectfaceWithImage:(UIImage *)image ImageUrlStr:(NSString *)imageUrlStr
                  IsBigFace:(BOOL)isBigFace
                    success:(void (^)(NSDictionary  *responseDict))success
                    failure:(void (^)(NSError *error))failure;

/**
 @author Mony
 人脸定位（faceshape）
 
 @param image       图片，与图片链接二选一，如都存在，以链接为准
 @param imageUrlStr 图片链接，与图片在设备中的位置二选一，如都存在，以链接为准
 @param isBigFace   是否是大脸模式，Yes大脸，No多脸
 @param success     成功回调，返回Json串
 @param failure     失败回调，返回NSError
 */
+ (void)faceshapeWithImage:(UIImage *)image ImageUrlStr:(NSString *)imageUrlStr
                 IsBigFace:(BOOL)isBigFace
                   success:(void (^)(NSDictionary  *responseDict))success
                   failure:(void (^)(NSError *error))failure;

/**
 @author Mony
 人脸对比（facecompare）
 
 @param imageA      图片A，与图片链接二选一，如都存在，以链接为准
 @param imageB      图片B，与图片链接二选一，如都存在，以链接为准
 @param imageUrlStr 图片A链接，与图片在设备中的位置二选一，如都存在，以链接为准
 @param imageUrlStr 图片B链接，与图片在设备中的位置二选一，如都存在，以链接为准
 @param success     成功回调，返回Json串
 @param failure     失败回调，返回NSError
 */
+ (void)facecompareWithImageA:(UIImage *)imageA ImageB:(UIImage *)imageB
                 ImageAUrlStr:(NSString *)imageAUrlStr
                 ImageBUrlStr:(NSString *)imageBUrlStr
                      success:(void (^)(NSDictionary  *responseDict))success
                      failure:(void (^)(NSError *error))failure;

/**
 @author Mony
 人脸识别（faceidentify）
 
 @param image       图片，与图片链接二选一，如都存在，以链接为准
 @param imageUrlStr 图片链接，与图片在设备中的位置二选一，如都存在，以链接为准
 @param groupId     候选人组id
 @param success     成功回调，返回Json串
 @param failure     失败回调，返回NSError
 */
+ (void)faceidentifyWithImage:(UIImage *)image ImageUrlStr:(NSString *)imageUrlStr
                      GroupId:(NSString *)groupId
                      success:(void (^)(NSDictionary  *responseDict))success
                      failure:(void (^)(NSError *error))failure;
/**
 @author Mony
 人脸验证（faceverify）
 
 @param image       图片，与图片链接二选一，如都存在，以链接为准
 @param imageUrlStr 图片链接，与图片在设备中的位置二选一，如都存在，以链接为准
 @param personId    待验证的Person
 @param success     成功回调，返回Json串
 @param failure     失败回调，返回NSError
 */
+ (void)faceverifyWithImage:(UIImage *)image ImageUrlStr:(NSString *)imageUrlStr
                   PersonId:(NSString *)personId
                    success:(void (^)(NSDictionary  *responseDict))success
                    failure:(void (^)(NSError *error))failure;

/**
 @author Hexue
 个体创建（newperson）
 
 @param image       图片，与图片链接二选一，如都存在，以链接为准
 @param imageUrlStr 图片链接，与图片在设备中的位置二选一，如都存在，以链接为准
 @param personId    指定的个体id
 @param groupIds    加入到组的列表
 @param personName  个体名字（可选）
 @param tag         备注信息（可选）
 @param success     成功回调，返回Json串
 @param failure     失败回调，返回NSError
 */
+ (void)newpersonWithImage:(UIImage *)image ImageUrlStr:(NSString *)imageUrlStr
                  PersonId:(NSString *)personId
                  GroupIds:(NSArray<NSString *> *)groupIds
                PersonName:(NSString *)personName
                       Tag:(NSString *)tag
                   success:(void (^)(NSDictionary  *responseDict))success
                   failure:(void (^)(NSError *error))failure;

/**
 @author Hexue
 删除一个Person（delperson）
 
 @param personId 待删除个体ID
 @param success  成功回调，返回Json串
 @param failure  失败回调，返回NSError
 */
+ (void)delpersonWithPersonId:(NSString *)personId
                      success:(void (^)(NSDictionary  *responseDict))success
                      failure:(void (^)(NSError *error))failure;

/**
 @author Hexue
 添加人脸（addface）
 
 @param image       图片，与图片链接二选一，如都存在，以链接为准
 @param imageUrlStr 图片链接，与图片在设备中的位置二选一，如都存在，以链接为准
 @param personId    待增加人脸的个体id
 @param tag         备注信息
 @param success     成功回调，返回Json串
 @param failure     失败回调，返回NSError
 */
+ (void)addfaceWithImage:(UIImage *)image ImageUrlStr:(NSString *)imageUrlStr
                PersonId:(NSString *)personId
                     Tag:(NSString *)tag
                 success:(void (^)(NSDictionary  *responseDict))success
                 failure:(void (^)(NSError *error))failure;

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
                    failure:(void (^)(NSError *error))failure;

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
                    failure:(void (^)(NSError *error))failure;

/**
 @author Hexue
 获取一个Person的信息（getinfo）
 
 @param personId 待查询个体的ID
 @param success  成功回调，返回Json串
 @param failure  失败回调，返回NSError
 */
+ (void)getinfoWithPersonId:(NSString *)personId
                    success:(void (^)(NSDictionary  *responseDict))success
                    failure:(void (^)(NSError *error))failure;

/**
 @author Mony
 获取一个AppId下所有group列表（getgroupids）
 
 @param success 成功回调，返回Json串
 @param failure 失败回调，返回NSError
 */
+ (void)getgroupidsWithsuccess:(void (^)(NSDictionary  *responseDict))success
                       failure:(void (^)(NSError *error))failure;

/**
 @author Mony
 获取一个组Group中所有Person列表（getpersonIds）
 
 @param groupId 组id
 @param success 成功回调，返回Json串
 @param failure 失败回调，返回NSError
 */
+ (void)getpersonIdsWithGroupId:(NSString *)groupId
                        success:(void (^)(NSDictionary  *responseDict))success
                        failure:(void (^)(NSError *error))failure;

/**
 @author Mony
 获取一个组Person中的所有face列表（getfaceIds）
 
 @param personId 个体id
 @param success  成功回调，返回Json串
 @param failure  失败回调，返回NSError
 */
+ (void)getfaceIdsWithPersonId:(NSString *)personId
                       success:(void (^)(NSDictionary  *responseDict))success
                       failure:(void (^)(NSError *error))failure;

/**
 @author Mony
 获取一个face的相关特征信息（getfaceinfo）
 
 @param faceId  人脸id
 @param success 成功回调，返回Json串
 @param failure 失败回调，返回NSError
 */
+ (void)getfaceinfoWithFaceId:(NSString *)faceId
                      success:(void (^)(NSDictionary  *responseDict))success
                      failure:(void (^)(NSError *error))failure;

@end
