//
//  HLLClientDeciceTool.m
//  front-mathcing-iOS
//
//  Created by 葛高召 on 2021/11/5.
//

#import "HLLClientDeciceTool.h"

@implementation HLLClientDeciceTool

#pragma mark -- HARDWARE INFO(硬件设备信息)

+ (NSString *)deviceName {
    return [[UIDevice currentDevice] name];
}

+ (NSString *)deviceModel {
    return [[UIDevice currentDevice] model];
}

+ (NSString *)startUUIDString {
    NSMutableString* startUUID = [NSMutableString string];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[NSDate date].timeIntervalSince1970];
    NSDateFormatter* dateFormatter = [NSDateFormatter new];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    [dateFormatter setDateFormat:@"yyMMddHHmmssSSS"];
    NSString* dateString = [dateFormatter stringFromDate:date];
    [startUUID appendFormat:@"%@",dateString];
    [startUUID appendString:@"2"];
    [startUUID appendString:@"000000"];
    [startUUID appendFormat:@"%010lld",arc4random()%10000000000];
    return startUUID;
}

+ (NSString *)deviceSystemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

#pragma mark -- iOS设备特性

+ (void)shareWithUrl:(NSURL *)url rootVC:(UIViewController *)rootVC callBack:(void(^)(BOOL completed))callBack {
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:[NSArray arrayWithObjects:url, nil] applicationActivities:nil];
    if ([[UIDevice currentDevice].model isEqualToString:@"iPad"]) {
        activityVC.modalPresentationStyle = UIModalPresentationPopover;
        activityVC.popoverPresentationController.sourceView = rootVC.view;
        activityVC.popoverPresentationController.sourceRect =  rootVC.view.frame;
    }
    activityVC.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
        if (callBack) { callBack(completed); }
    };
    [rootVC presentViewController:activityVC animated:YES completion:nil];
}
@end
