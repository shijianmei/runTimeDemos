//
//  NSArray+safe.m
//  减少 app崩溃
//
//  Created by Jianmei on 2017/9/15.
//  Copyright © 2017年 Jianmei. All rights reserved.
//

#import "NSArray+safe.h"
#import "NSObject+runtime.h"

@implementation NSArray (safe)
+ (void)load
{
    [NSClassFromString(@"__NSPlaceholderArray") swapMethod:@selector(initWithObjects:count:)
                                             currentMethod:@selector(jm_initWithObjects:count:)];
    
    [NSClassFromString(@"__NSArrayI") swapMethod:@selector(objectAtIndex:)
                                   currentMethod:@selector(jm_objectAtIndex:)];
    
    [NSClassFromString(@"__NSArray0") swapMethod:@selector(objectAtIndex:)
                                   currentMethod:@selector(jm_zeroObjectAtIndex:)];
    
    [NSClassFromString(@"__NSSingleObjectArrayI") swapMethod:@selector(objectAtIndex:)
                                               currentMethod:@selector(jm_singleObjectAtIndex:)];
}

- (instancetype)jm_initWithObjects:(id *)objects count:(NSUInteger)cnt
{
    NSUInteger newCnt = 0;
    for (NSUInteger i = 0; i < cnt; i++)
    {
        if (!objects[i])
        {
            break;
        }
        newCnt++;
    }
    
    return [self jm_initWithObjects:objects count:newCnt];
}

- (id)jm_objectAtIndex:(NSUInteger)index
{
    if (index >= [self count])
    {
        NSAssert(NO, @"数组越界"); // 只有开发的时候才会造成程序崩了
        return nil;
    }
    return [self jm_objectAtIndex:index];
}

- (id)jm_zeroObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count)
    {
        NSAssert(NO, @"数组越界"); // 只有开发的时候才会造成程序崩了

        return nil;
    }
    return [self jm_zeroObjectAtIndex:index];
}

- (id)jm_singleObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count)
    {
        NSAssert(NO, @"数组越界"); // 只有开发的时候才会造成程序崩了

        return nil;
    }
    return [self jm_singleObjectAtIndex:index];
}

@end
