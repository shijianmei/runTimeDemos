//
//  NSObject+Ext.m
//  Other 用法
//
//  Created by Jianmei on 2017/9/15.
//  Copyright © 2017年 Jianmei. All rights reserved.
//

#import "NSObject+Ext.h"
#import <objc/runtime.h>

@implementation NSObject (Ext)
char nameKey;
-(void)setName:(NSString *)name
{
    objc_setAssociatedObject(self, &nameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);    
}

-(NSString *)name
{
   return objc_getAssociatedObject(self, &nameKey);
}
@end
