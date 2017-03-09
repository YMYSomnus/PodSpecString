//
//  NSAttributedString+JKNAdditions.m
//  PAJKCardFramework
//
//  Created by wangweishun@pajk.cn on 4/25/14.
//  Copyright (c) 2014 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import "NSAttributedString+JKNAdditions.h"

@implementation NSAttributedString (jkn_Additions)

+ (NSAttributedString *)jkn_attributedWithStrikethroughString:(NSString *)string {
    return [NSAttributedString jkn_attributedWithStriketString:string strikethroughRange:NSMakeRange(0, [string length])];
}

+ (NSAttributedString *)jkn_attributedWithStriketString:(NSString *)string strikethroughRange:(NSRange)range
{
    if (string.length == 0) {
        return nil;
    }
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributeString addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:range];
    return attributeString;
}

+ (NSAttributedString *)jkn_attributedWithStringColor:(UIColor *)color subString:subString string:(NSString *)allString
{
    if (allString.length == 0) {
        return nil;
    }
    NSRange range = [allString rangeOfString:subString];
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:allString];
    [attributeString addAttribute:NSForegroundColorAttributeName value:color range:range];
    return attributeString;
}

+ (NSAttributedString *)jkn_attributedWithStringColor:(UIColor *)color font:(UIFont *)font subString:subString string:(NSString *)allString
{
    if (allString.length == 0) {
        return nil;
    }
    NSRange range = [allString rangeOfString:subString];
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:allString];
    [attributeString addAttribute:NSForegroundColorAttributeName value:color range:range];
    [attributeString addAttribute:NSFontAttributeName value:font range:range];
    return attributeString;
}


+ (void)jkn_stringWithHighlightWords:(NSMutableArray *)hlWords inString:(NSString *)originString {
    if (nil == originString) {
        return;
    }
    
    NSRange range1 = [originString rangeOfString:@"<em>"];
    if (range1.length == 0) {
        return;
    }
    
    NSRange range2 = [originString rangeOfString:@"</em>"];
    if (range2.length == 0) {
        return;
    }
    
    NSRange found;
    found.location = range1.location + range1.length;
    found.length = range2.location - found.location;
    
    NSString *hlword = [originString substringWithRange:found];
    [hlWords addObject:hlword];
    
    NSString *subString = [originString substringFromIndex:range2.location+range2.length];
    
    [self jkn_stringWithHighlightWords:hlWords inString:subString];
}

+ (NSAttributedString *)jkn_highlightEmTagWithString:(NSString *)string hlfont:(UIFont *)font hlcolor:(UIColor *)color {
    if (nil == string) {
        return nil;
    }
    
    // 获取关键词
    NSMutableArray *hlWords = [NSMutableArray array];
    [self jkn_stringWithHighlightWords:hlWords inString:string];
    
    // 去除<em> </em>标签
    __block NSMutableString *mString = [NSMutableString stringWithString:string];
    [mString replaceOccurrencesOfString:@"<em>" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [mString length])];
    [mString replaceOccurrencesOfString:@"</em>" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [mString length])];
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:mString];
    
    __block NSUInteger deleteLength = 0;
    for (NSString *hlWord in hlWords) {
        NSRange range = [mString rangeOfString:hlWord];
        [mString replaceCharactersInRange:range withString:@""];
        range.location = range.location + deleteLength;
        deleteLength += range.length;
        
        [attributeString addAttribute:NSForegroundColorAttributeName value:color range:range];
        [attributeString addAttribute:NSFontAttributeName value:font range:range];
    }
    
    
    return attributeString;
}


@end
