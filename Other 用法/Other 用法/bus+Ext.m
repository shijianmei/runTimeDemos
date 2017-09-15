//
//  bus+Ext.m
//  Other 用法
//
//  Created by Jianmei on 2017/9/15.
//  Copyright © 2017年 Jianmei. All rights reserved.
//

#import "bus+Ext.h"
#import <objc/runtime.h>

void startEngine(id self, SEL _cmd) {
    NSLog(@"my car starts the engine");
}
@implementation bus (Ext)

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(drive)) {
        class_addMethod([self class], sel, (IMP)startEngine, "v@:@");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}


@end
