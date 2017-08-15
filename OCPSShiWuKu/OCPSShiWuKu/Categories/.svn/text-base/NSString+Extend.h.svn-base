//
//  NSString+Extend.h
//  Ssdfz
//
//  Created by 王楠 on 16/5/13.
//  Copyright © 2016年 Combanc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extend)

/**
 *  md5加密
 */
+ (NSString *)md5String:(NSString *)string;

/**
 * 根据传入的字符串和字体计算高度
 */
+ (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font space:(CGFloat)space;
/**
 * 根据传入的字符串和字体计算高度 含最大size
 */
+ (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font maxSize:(CGSize) maxSize;

/**
 * 是否含有Emoji表情
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;

/**
 * 检测输入的汉字数
 */
+ (NSInteger)stringCount:(NSString*)string;

/**
 *  保存传入的图片
 */
+ (NSString *)saveImage:(NSData *)image imageName:(NSString *)imageName;

/**
 *  移除文件
 *
 *  @param imageName 图片名
 */
+ (void)deleteTemSaveImageWithFilePath:(NSString *)imageName;

/**
 *  拼接富文本
 */
+ (NSAttributedString *)htmlDetailContentWithText:(NSString *)text;

/**
 去除收尾空格

 @return 结果字符串
 */
- (NSString *)stringByTrim;

/**
 *  去除文本中包含的节点符号
 *
 *  @param string 带节点的字符串
 *
 *  @return 无节点的字符串
 */
+ (NSString *)characterSet1:(NSString *)string;


/**
 转换time字符串格式

 @param timeStr timeStr
 @return 字符串格式
 */
+ (NSString *)convertTimeString:(NSString *)timeStr;

/**
 判断是否在时间点之前

 @param timeStr timeStr
 @return true: 在时间点之前， false： 在时间点之后
 */
+ (BOOL)whetherBeforeTime:(NSString *)timeStr;

/**
 * 根据传入的时间返回时间间隔的文字或时间
 */
+ (NSString *)deltaTime:(NSString *)timeStr;

/**
 *  将十六进制的字符串转换成NSString
 */
+ (NSString *)convertHexStrToString:(NSString *)str;

/**
 *  将NSString转换成十六进制的字符串
 */
+ (NSString *)convertStringToHexStr:(NSString *)str;

+ (NSAttributedString *)getAttributedString:(NSString *)string withcolor:(UIColor *)color withFont:(UIFont *)font;

/**
 获取当前时间的时间戳

 @return 时间戳字符串
 */
+ (NSString *)getNowDataWithLongString;

@end
