//
//  PickerView.h
//  changpingSchoolTeacher
//
//  Created by chenhuan on 16/10/25.
//  Copyright © 2016年 combanc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerView : UIView

@property (nonatomic, strong) NSArray *dataArray;/**<数据源 */
@property (nonatomic, copy) void(^didCheckBlock)(NSInteger index,NSString *name);/**<选择的返回类型回调 */

// 注意: 不要使用单例创建,否则数据导致重复
//+ (instancetype)shareInstance;
- (void)show;

@end
