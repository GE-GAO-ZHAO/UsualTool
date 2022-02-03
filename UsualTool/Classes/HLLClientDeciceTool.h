//
//  HLLClientDeciceTool.h
//  front-mathcing-iOS
//
//  Created by 葛高召 on 2021/11/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HLLClientDeciceTool : NSObject

#pragma mark --
#pragma mark -- HARDWARE INFO(硬件设备信息)
/// @brief 获取设备型号
+ (NSString *)deviceName;
/// @brief 获取设备型号
+ (NSString *)deviceModel;
/// @brief 获取设备uuid
+ (NSString *)startUUIDString;
/// @brief 获取设备系统版本号
+ (NSString *)deviceSystemVersion;

#pragma mark --
#pragma mark -- iOS设备特性
+ (void)shareWithUrl:(NSURL *)url rootVC:(UIViewController *)rootVC callBack:(void(^)(BOOL completed))callBack;


@end

NS_ASSUME_NONNULL_END
