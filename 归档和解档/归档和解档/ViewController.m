//
//  ViewController.m
//  归档和解档
//
//  Created by Jianmei on 2017/9/6.
//  Copyright © 2017年 Jianmei. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Car *car = [[Car alloc]init];
    car.name = @"法拉咯";
    car.color = @"白色";
    
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"car.text"];
    BOOL success = [NSKeyedArchiver archiveRootObject:car toFile:path];
    if (success) {
        NSLog(@"归档成功");
    }
    
    Car *c = [NSKeyedUnarchiver unarchiveObjectWithFile:path ];
    NSLog(@"%@",c);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
