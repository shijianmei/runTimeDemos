//
//  ViewController.m
//  Other 用法
//
//  Created by Jianmei on 2017/9/15.
//  Copyright © 2017年 Jianmei. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Ext.h"
#import "bus.h"
#import "bus+Ext.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark -字典转模型 
    //https://github.com/shijianmei/JMModel
    
#pragma mark -动态添加属性
    NSObject *obj = [NSObject new];
    obj.name = @"name";
#pragma mark -动态添加方法
    bus *c = [[bus alloc] init];
    [c performSelector:@selector(drive) withObject:@"bmw"];

    
}




















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
