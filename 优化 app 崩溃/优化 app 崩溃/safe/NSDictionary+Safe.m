//
//  NSDictionary+Safe.m
//  优化 app 崩溃
//
//  Created by Jianmei on 2017/9/15.
//  Copyright © 2017年 Jianmei. All rights reserved.
//

#import "NSDictionary+Safe.h"
#import "NSObject+runtime.h"

@implementation NSDictionary (Safe)
+(void)load
{
    [NSClassFromString(@"__NSPlaceholderDictionary") swapMethod:@selector(initWithObjects:forKeys:count:)
                                                  currentMethod:@selector(jm_initWithObjects:forKeys:count:)];
}

- (instancetype)jm_initWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt
{
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++)
    {
        id key = keys[i];
        id obj = objects[i];
        if (!key)
        {
            continue;
        }
        if (!obj)
        {
            obj = [NSNull null];
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    
    return [self jm_initWithObjects:safeObjects forKeys:safeKeys count:j];
}



@end

@implementation NSMutableDictionary (Safe)

+ (void)load
{
    [NSClassFromString(@"__NSDictionaryM") swapMethod:@selector(setObject:forKey:)
                                        currentMethod:@selector(jm_setObject:forKey:)];
}

- (void)jm_setObject:(id)anObject forKey:(id <NSCopying>)aKey
{
    if (!anObject)
    {
        NSAssert(NO, @"字典的value不能为空"); // 只有开发的时候才会造成程序崩了

        return;
    }
    if (!aKey)
    {
        NSAssert(NO, @"字典的key不能为空"); // 只有开发的时候才会造成程序崩了

        return;
    }
    [self jm_setObject:anObject forKey:aKey];
}

@end
