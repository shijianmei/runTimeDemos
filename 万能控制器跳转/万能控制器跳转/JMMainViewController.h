//
//  JMMainViewController.h
//  万能控制器跳转
//
//  Created by Jianmei on 2017/9/6.
//  Copyright © 2017年 Jianmei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMMainViewController : UIViewController
// 注：根据下面的两个属性，可以从服务器获取对应的频道列表数据

/** 频道ID */
@property (nonatomic, copy) NSString *ID;

/** 频道type */
@property (nonatomic, copy) NSString *type;
@end
