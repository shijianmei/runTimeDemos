//
//  ViewController.m
//  优化 app 崩溃
//
//  Created by Jianmei on 2017/9/15.
//  Copyright © 2017年 Jianmei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - 数组添加了 nil 对象
//    NSString *str = nil;
//    NSMutableArray *mulArr = [NSMutableArray array];
//    [mulArr addObject:str];
#pragma mark - 不可变数组越界
    
//    NSArray *array = @[@"aaa"];
//    NSLog(@"%@",array[2]);
//    [array objectAtIndex:2];
#pragma mark - 可变数组
//    NSString *str = nil;
//
//    NSMutableArray *mulArr = [NSMutableArray arrayWithArray:@[@"aaa"]];
////    [mulArr removeObjectAtIndex:2];
//    [mulArr insertObject:@"bb" atIndex:2];

#pragma mark - 字典
//        NSString *str = nil;
//
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    [dic setObject:nil forKey:@"aaa"];
//    NSLog(@"%@",dic);
#pragma mark - 字符串
    //        NSString *str = @"string";
    //
    //        [str substringToIndex:100];
    //        [str substringWithRange:NSMakeRange(0, 100)];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
