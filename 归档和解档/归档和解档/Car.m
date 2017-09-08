//
//  Car.m
//  归档和解档
//
//  Created by Jianmei on 2017/9/6.
//  Copyright © 2017年 Jianmei. All rights reserved.
//

#import "Car.h"
#import <objc/runtime.h>

@implementation Car
- (void)encodeWithCoder:(NSCoder *)aCoder
{
//    [aCoder encodeObject:self.name forKey:@"name"];
//    [aCoder encodeObject:self.color forKey:@"color"];
//    
    unsigned int count =0;
    Ivar *vars = class_copyIvarList([Car class], &count);
    for (int i = 0; i<count; i++) {
        Ivar var =vars[i];
        const char *name = ivar_getName(var);
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(vars);
    
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
//    self.name = [aDecoder decodeObjectForKey:@"name"];
//    self.color = [aDecoder decodeObjectForKey:@"color"];

    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([Car class], &count);
        for (int i = 0; i<count; i++) {
            Ivar ivar = ivars[i];
            const char *name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
    }
    return self;
}


- (NSString *)description{
    NSString *desc = [NSString stringWithFormat:@"name = %@,age = %@",self.name,self.color];
    return desc;
}

@end
