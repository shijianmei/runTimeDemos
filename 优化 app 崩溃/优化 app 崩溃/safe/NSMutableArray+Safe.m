//
//  NSMutableArray+Safe.m
//  减少 app崩溃
//
//  Created by Jianmei on 2017/9/15.
//  Copyright © 2017年 Jianmei. All rights reserved.
//

#import "NSMutableArray+Safe.h"
#import "NSObject+runtime.h"

@implementation NSMutableArray (Safe)
+(void)load
{
    [NSClassFromString(@"__NSArrayM") swapMethod:@selector(addObject:)
                                   currentMethod:@selector(jm_addObject:)];
    
    [NSClassFromString(@"__NSArrayM") swapMethod:@selector(addObject:)
                                   currentMethod:@selector(jm_addObject:)];
    
    [NSClassFromString(@"__NSArrayM") swapMethod:@selector(removeObjectAtIndex:)
                                   currentMethod:@selector(jm_removeObjectAtIndex:)];
    
    [NSClassFromString(@"__NSArrayM") swapMethod:@selector(replaceObjectAtIndex:withObject:)
                                   currentMethod:@selector(jm_replaceObjectAtIndex:withObject:)];
    
    [NSClassFromString(@"__NSArrayM") swapMethod:@selector(removeObjectsInRange:)
                                   currentMethod:@selector(jm_removeObjectsInRange:)];
    
    [NSClassFromString(@"__NSArrayM") swapMethod:@selector(insertObject:atIndex:)
                                   currentMethod:@selector(jm_insertObject:atIndex:)];

}


-(void)jm_addObject:(id)object
{
    if (!object)
    {
        NSAssert(NO, @"插入了nil 对象"); // 只有开发的时候才会造成程序崩了

        return;
    }
    [self jm_addObject:object];
}

- (id)jm_objectAtIndex:(NSUInteger)index
{
    if (index >= self.count)
    {
        NSAssert(NO, @"数组越界..."); // 只有开发的时候才会造成程序崩了

        return nil;
    }
    return [self jm_objectAtIndex:index];
}



- (void)jm_removeObjectAtIndex:(NSUInteger)index
{
    if (index >= [self count])
    {
        NSAssert(NO, @"数组移除元素时,越界"); // 只有开发的时候才会造成程序崩了

        return;
    }
    
    return [self jm_removeObjectAtIndex:index];
}

- (void)jm_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (index >= [self count])
    {
        NSAssert(NO, @"数组替换元素时,越界"); // 只有开发的时候才会造成程序崩了

        return;
    }
    
    if (!anObject)
    {
        NSAssert(NO, @"数组替换了nil 对象"); // 只有开发的时候才会造成程序崩了
        return;
    }
    
    [self jm_replaceObjectAtIndex:index withObject:anObject];
}

- (void)jm_removeObjectsInRange:(NSRange)range
{
    if (range.location > self.count)
    {
        NSAssert(NO, @"数组移除元素时,超出了范围"); // 只有开发的时候才会造成程序崩了
        return;
    }
    
    if (range.length > self.count)
    {
        NSAssert(NO, @"数组移除元素时,超出了范围"); // 只有开发的时候才会造成程序崩了

        return;
    }
    
    if ((range.location + range.length) > self.count)
    {
        NSAssert(NO, @"数组移除元素时,超出了范围"); // 只有开发的时候才会造成程序崩了
        return;
    }
    
    return [self jm_removeObjectsInRange:range];
}

- (void)jm_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (index > self.count)
    {
        NSAssert(NO, @"数组插入对象时,越界"); // 只有开发的时候才会造成程序崩了
        return;
    }
    
    if (!anObject)
    {
        NSAssert(NO, @"数组插入元素时,插入了nil 对象"); // 只有开发的时候才会造成程序崩了

        return;
    }
    
    [self jm_insertObject:anObject atIndex:index];
}

@end
