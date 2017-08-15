//
//  BaseNavigationController.m
//  NewsDetailDemo
//
//  Created by 思 彭 on 2017/8/1.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UIBarButtonItem+Base.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        NSString *backBtnImgName = @"leftNavBack";
        if (self.backBtnImgWhite) {
            backBtnImgName = @"leftNavBackWhite";
        }else {
            backBtnImgName = @"leftNavBack";
        }
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:backBtnImgName higlightedImage:backBtnImgName title:self.backBtnTitle.length > 0 ? self.backBtnTitle : @" " target:self action:@selector(back)];
        
        // 添加返回按钮
        //        if ([viewController isKindOfClass:[MWPhotoBrowser class]]) {
        //            //如果是图片浏览器，那么返回导航按钮显示白色图片
        //             viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"leftNavBackWhite" higlightedImage:@"leftNavBackWhite" target:self action:@selector(back)];
        //        } else {
        //            viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"leftNavBack" higlightedImage:@"leftNavBack" title:self.backBtnTitle? self.backBtnTitle : @"" target:self action:@selector(back)];
        //        }
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    self.backBtnTitle = @"";
    [self popViewControllerAnimated:YES];
}


@end
