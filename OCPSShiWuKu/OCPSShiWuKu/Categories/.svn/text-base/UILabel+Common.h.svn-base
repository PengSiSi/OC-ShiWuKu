//
//  UILabel+Common.h
//  CommentCell
//
//  Created by 王楠 on 2017/6/5.
//  Copyright © 2017年 combanc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Common)

- (void)setLongString:(NSString *)str withFitWidth:(CGFloat)width;
- (void)setLongString:(NSString *)str withFitWidth:(CGFloat)width maxHeight:(CGFloat)maxHeight;
- (void)setLongString:(NSString *)str withVariableWidth:(CGFloat)maxWidth;

- (void)setAttrStrWithStr:(NSString *)text diffColorStr:(NSString *)diffColorStr diffColor:(UIColor *)diffColor;
- (void)addAttrDict:(NSDictionary *)attrDict toStr:(NSString *)str;
- (void)addAttrDict:(NSDictionary *)attrDict toRange:(NSRange)range;

+ (instancetype)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor;
+ (instancetype)labelWithSystemFontSize:(CGFloat)fontSize textColorHexString:(NSString *)stringToConvert;

- (void)colorTextWithColor:(UIColor *)color range:(NSRange)range;
- (void)fontTextWithFont:(UIFont *)font range:(NSRange)range;

@end
