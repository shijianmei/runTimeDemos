//
//  NSString+safe.m
//  优化 app 崩溃
//
//  Created by Jianmei on 2017/9/15.
//  Copyright © 2017年 Jianmei. All rights reserved.
//

#import "NSString+safe.h"
#import "NSObject+runtime.h"

@implementation NSString (safe)
+ (void)load
{
    [NSClassFromString(@"__NSCFConstantString") swapMethod:@selector(substringFromIndex:)
                                             currentMethod:@selector(jmConstant_substringFromIndex:)];
    
    [NSClassFromString(@"NSTaggedPointerString") swapMethod:@selector(substringFromIndex:)
                                              currentMethod:@selector(jmPoint_substringFromIndex:)];
    
    [NSClassFromString(@"__NSCFConstantString") swapMethod:@selector(substringToIndex:)
                                             currentMethod:@selector(jmConstant_substringToIndex:)];
    
    [NSClassFromString(@"NSTaggedPointerString") swapMethod:@selector(substringToIndex:)
                                              currentMethod:@selector(jmPoint_substringToIndex:)];
    
    [NSClassFromString(@"__NSCFConstantString") swapMethod:@selector(substringWithRange:)
                                             currentMethod:@selector(jmConstant_substringWithRange:)];
    
    [NSClassFromString(@"NSTaggedPointerString") swapMethod:@selector(substringWithRange:)
                                              currentMethod:@selector(jmPoint_substringWithRange:)];
}

- (NSString *)jmConstant_substringFromIndex:(NSUInteger)from
{
    if (from > self.length )
    {
        return nil;
    }
    return [self jmConstant_substringFromIndex:from];
}

- (NSString *)jmPoint_substringFromIndex:(NSUInteger)from
{
    if (from > self.length )
    {
        return nil;
    }
    return [self jmPoint_substringFromIndex:from];
}

- (NSString *)jmConstant_substringToIndex:(NSUInteger)to
{
    if (to > self.length )
    {
        return nil;
    }
    return [self jmConstant_substringToIndex:to];
}

- (NSString *)jmPoint_substringToIndex:(NSUInteger)to
{
    if (to > self.length )
    {
        return nil;
    }
    return [self jmPoint_substringToIndex:to];
}

- (NSString *)jmConstant_substringWithRange:(NSRange)range
{
    if (range.location > self.length)
    {
        return nil;
    }
    
    if (range.length > self.length)
    {
        return nil;
    }
    
    if ((range.location + range.length) > self.length)
    {
        return nil;
    }
    return [self jmConstant_substringWithRange:range];
}

- (NSString *)jmPoint_substringWithRange:(NSRange)range
{
    if (range.location > self.length)
    {
        return nil;
    }
    
    if (range.length > self.length)
    {
        return nil;
    }
    
    if ((range.location + range.length) > self.length)
    {
        return nil;
    }
    return [self jmPoint_substringWithRange:range];
}
@end




@implementation NSMutableString (Safe)

+ (void)load
{
    [NSClassFromString(@"__NSCFString") swapMethod:@selector(substringFromIndex:)
                                     currentMethod:@selector(ls_substringFromIndex:)];
    
    [NSClassFromString(@"__NSCFString") swapMethod:@selector(substringToIndex:)
                                     currentMethod:@selector(ls_substringToIndex:)];
    
    [NSClassFromString(@"__NSCFString") swapMethod:@selector(substringWithRange:)
                                     currentMethod:@selector(ls_substringWithRange:)];
}

- (NSString *)ls_substringFromIndex:(NSUInteger)from
{
    if (from > self.length )
    {
        return nil;
    }
    return [self ls_substringFromIndex:from];
}

- (NSString *)ls_substringToIndex:(NSUInteger)to
{
    if (to > self.length )
    {
        return nil;
    }
    return [self ls_substringToIndex:to];
}

- (NSString *)ls_substringWithRange:(NSRange)range
{
    if (range.location > self.length)
    {
        return nil;
    }
    
    if (range.length > self.length)
    {
        return nil;
    }
    
    if ((range.location + range.length) > self.length)
    {
        return nil;
    }
    return [self ls_substringWithRange:range];
}

@end
