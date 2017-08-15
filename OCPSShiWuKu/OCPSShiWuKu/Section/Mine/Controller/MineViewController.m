//
//  MineViewController.m
//  NewsDetailDemo
//
//  Created by 思 彭 on 2017/8/1.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()


@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置statusBar颜色
    UIView *statusView = [[UIApplication sharedApplication] valueForKey:@"statusBar"];
    statusView.backgroundColor = [UIColor redColor];
    
    [[UIApplication sharedApplication] setValue:nil forKey:@"statusBar"];
    // 隐藏状态栏 <尝试不管用>
    self.automaticallyAdjustsScrollViewInsets = NO;

}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

@end
