//
//  HLLMKWeakProxy.h
//  HLLMKBusinessKit
//
//  Created by zfli on 2020/11/11.
//  Copyright © 2020 cn.huolala.map.framework.HLLMapKit. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface HLLWeakProxy : NSProxy
@property (nonatomic,weak) id target;
@end
