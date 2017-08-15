//
//  BaseNavigationController.h
//  NewsDetailDemo
//
//  Created by 思 彭 on 2017/8/1.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationController : UINavigationController

@property (nonatomic, strong) NSString *backBtnTitle; /**< 返回按钮的名*/

@property (nonatomic, assign) BOOL backBtnImgWhite; /**< 返回按钮是否是白色*/

@end
