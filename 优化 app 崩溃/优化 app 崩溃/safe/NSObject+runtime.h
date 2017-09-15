//
//  NSObject+runtime.h
//  减少 app崩溃
//
//  Created by Jianmei on 2017/9/15.
//  Copyright © 2017年 Jianmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (runtime)
/** 实例方法交换 */
+ (void)swapMethod:(SEL)originMethod currentMethod:(SEL)currentMethod;

/** 类方法交换 */
+ (void)swapClassMethod:(SEL)originMethod currentMethod:(SEL)currentMethod;
@end
