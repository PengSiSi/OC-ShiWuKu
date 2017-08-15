//
//  MainViewController.m
//  NewsDetailDemo
//
//  Created by 思 彭 on 2017/8/1.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "MainViewController.h"
#import "BaseNavigationController.h"

#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/)\
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]


@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark - LifeCycle

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setUI {
    NSArray *selectImage = @[@"task_icon_pressed",@"interaction_icon_pressed",@"course_icon_pressed",@"task_icon_pressed",@"mine_icon_pressed"];
    NSArray *normalImage = @[@"task_icon_normal",@"interaction_icon_normal",@"course_icon_normal",@"task_icon_normal",@"mine_icon_normal"];
    
    // QuestionAnswerRootListViewController QuestionAnswerListViewController
    NSArray *vcClass = @[@"HomeViewController",@"ExerciseViewController",@"SchoolViewController",@"VideoViewController", @"MineViewController"];
    NSArray *vcName = @[@"首页",@"练习",@"学堂",@"视频", @"我的"];
    NSMutableArray *allArray = [NSMutableArray array];
    
    for (int i = 0; i < vcClass.count; i++) {
        
        Class cla = NSClassFromString(vcClass[i]);
        UIViewController *vc = [[cla alloc] init];
        vc.title = vcName[i];
        [vc.tabBarItem setImage:[[UIImage imageNamed:normalImage[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [vc.tabBarItem setSelectedImage:[[UIImage imageNamed:selectImage[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [vc.tabBarItem setTitle:vcName[i]];
        if (i == 1) {
            vc.tabBarItem.badgeValue = @"3";
        }
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        [allArray addObject:nav];
    }
    
    self.tabBar.backgroundColor = [UIColor redColor];
    self.viewControllers = allArray;
    [self.tabBar setTintColor:RGBA(1, 152, 220, 1)];
    
    //设置TabBar背景颜色
    [self setUpTabBarItemTextAttributes];
}

/**
 *  设置TabBar背景颜色
 */
- (void)setUpTabBarItemTextAttributes {
    UITabBar *tabBarAppearance = [UITabBar appearance];
    tabBarAppearance.barTintColor = [UIColor whiteColor];
}

@end
