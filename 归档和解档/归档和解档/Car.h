//
//  Car.h
//  归档和解档
//
//  Created by Jianmei on 2017/9/6.
//  Copyright © 2017年 Jianmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject<NSCoding>
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *color;

@end
