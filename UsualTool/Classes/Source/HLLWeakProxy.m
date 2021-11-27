//
//  HLLMKWeakProxy.m
//  HLLMKBusinessKit
//
//  Created by zfli on 2020/11/11.
//  Copyright © 2020 cn.huolala.map.framework.HLLMapKit. All rights reserved.
//

#import "HLLWeakProxy.h"

@implementation HLLWeakProxy
// 重写方法签名，设置转发对象
- (NSMethodSignature *) methodSignatureForSelector:(SEL)sel{
    return [self.target methodSignatureForSelector:sel];
}

// 转发
-(void)forwardInvocation:(NSInvocation *)invocation{
    [invocation invokeWithTarget:self.target];
}

@end
