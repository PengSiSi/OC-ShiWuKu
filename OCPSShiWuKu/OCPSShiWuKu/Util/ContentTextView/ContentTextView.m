//
//  ContentTextView.m
//  QianfengSchool
//
//  Created by AlicePan on 16/9/18.
//  Copyright © 2016年 Combanc. All rights reserved.
//

#import "ContentTextView.h"

@implementation ContentTextView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _placeholderColor = PLACEHOLDER_COLOR;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)textDidChange {
    if (self.text.length) { // 隐藏placeholder
        _hidePlaceholder = YES;
    } else { // 显示placeholder
        _hidePlaceholder = NO;
    }
    
    [self setNeedsDisplay];
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    
    // 重绘
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    
    // 重绘
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    if (_hidePlaceholder) return;
    
    // 设置画笔颜色
    [_placeholderColor set];
    
    /*
     NSLineBreakByWordWrapping = 0,  保持单词的完整性
     NSLineBreakByCharWrapping,
     NSLineBreakByClipping,
     NSLineBreakByTruncatingHead,
     NSLineBreakByTruncatingTail,
     NSLineBreakByTruncatingMiddle
     */
    CGFloat paddingX = 2;
    CGFloat paddingY = self.font.lineHeight * 0.4;
    rect.origin.x = paddingX;
    rect.origin.y = paddingY;
    rect.size.height -= 2 * paddingY;
    rect.size.width -= 2 * paddingX;
    
    [_placeholder drawInRect:rect withFont:self.font lineBreakMode:NSLineBreakByWordWrapping];
}


@end
