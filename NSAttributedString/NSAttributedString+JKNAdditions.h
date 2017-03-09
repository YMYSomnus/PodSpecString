//
//  NSAttributedString+JKNAdditions.h
//  PAJKCardFramework
//
//  Created by wangweishun@pajk.cn on 4/25/14.
//  Copyright (c) 2014 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (jkn_Additions)

+ (NSAttributedString *)jkn_attributedWithStrikethroughString:(NSString *)string;

+ (NSAttributedString *)jkn_attributedWithStriketString:(NSString *)string strikethroughRange:(NSRange)range;

+ (NSAttributedString *)jkn_attributedWithStringColor:(UIColor *)color subString:subString string:(NSString *)allString;

+ (NSAttributedString *)jkn_attributedWithStringColor:(UIColor *)color font:(UIFont *)font subString:subString string:(NSString *)allString;

// 将一个带em标签的字符串转化成高亮的形式
+ (NSAttributedString *)jkn_highlightEmTagWithString:(NSString *)string hlfont:(UIFont *)font hlcolor:(UIColor *)color;

@end
