//
//  ViewController.m
//  归档和解档
//
//  Created by Jianmei on 2017/9/6.
//  Copyright © 2017年 Jianmei. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "Dog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Dog *car = [[Dog alloc]init];
    car.name = @"法拉咯1";
    car.color = @"白色1";
    
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"dog.txt"];
    BOOL success = [NSKeyedArchiver archiveRootObject:car toFile:path];
    if (success) {
        NSLog(@"归档成功");
    }
    
    Dog *c = [NSKeyedUnarchiver unarchiveObjectWithFile:path ];
    NSLog(@"%@",c);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
