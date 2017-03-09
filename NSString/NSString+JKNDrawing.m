//
//  NSString+JKNDrawing.m
//  PAJKCardApp
//
//  Created by wangweishun on 6/18/14.
//  Copyright (c) 2014 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import "NSString+JKNDrawing.h"

@implementation NSString (jkn_Drawing)

- (CGSize)jkn_sizeWithConstrainedSize:(CGSize)size font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing {
    return [self jkn_sizeWithConstrainedSize:size font:font lineSpacing:lineSpacing paragraphSpacing:0];
}

- (CGSize)jkn_sizeWithConstrainedSize:(CGSize)size font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing paragraphSpacing:(CGFloat) pSpacing
{
    CGSize expectedSize = CGSizeZero;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.lineSpacing = lineSpacing;
    if (pSpacing >0)
    {
        paragraphStyle.paragraphSpacing = pSpacing;
    }
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    expectedSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    return CGSizeMake(ceil(expectedSize.width), ceil(expectedSize.height));

}

- (CGSize)jkn_sizeWithConstrainedSize:(CGSize)size font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing paragraphSpacing:(CGFloat) pSpacing maxLines:(NSInteger)lines isOver:(BOOL *)isOver
{
    CGSize expectedSize = CGSizeZero;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.lineSpacing = lineSpacing;
    if (pSpacing >0)
    {
        paragraphStyle.paragraphSpacing = pSpacing;
    }
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    expectedSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    
    CGFloat height = expectedSize.height;
    
    if (lines > 0) {
        //构造限制行数据
        NSString *tempString = @"";
        for (int i = 0; i < lines - 1; i++) {
            tempString = [tempString stringByAppendingString:@"\n"];
        }
        
        //根据原文设置构造数据属性
        CGSize limitSize = [tempString boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
        
        if (expectedSize.height > limitSize.height) {
            //+4，防止高度存在一点偏差，导致显示行数不对的情况
            height = limitSize.height + 4;
            if (isOver) {
                *isOver = YES;
            }
        } else {
            if (isOver) {
                *isOver = NO;
            }
        }
    }
    
    return CGSizeMake(ceil(expectedSize.width), ceil(height));
}

- (CGSize)jkn_sizeWithMaxWidth:(CGFloat)width font:(UIFont *)font {
    return [self jkn_sizeWithConstrainedSize:CGSizeMake(width, FLT_MAX) font:font lineSpacing:0];
}

- (CGSize)jkn_sizeWithMaxWidth:(CGFloat)width font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing {
    return [self jkn_sizeWithConstrainedSize:CGSizeMake(width, FLT_MAX) font:font lineSpacing:lineSpacing];
}

- (CGSize)jkn_sizeWithMaxWidth:(CGFloat)width font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing paragraphSpacing:(CGFloat) pSpacing
{
    return [self jkn_sizeWithConstrainedSize:CGSizeMake(width, FLT_MAX) font:font lineSpacing:lineSpacing paragraphSpacing:pSpacing];
}

-(NSMutableAttributedString *)jkn_attributedStringFromStingWithFont:(UIFont *)font
                                                    withLineSpacing:(CGFloat)lineSpacing
{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self attributes:@{NSFontAttributeName:font}];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    
    [attributedStr addAttribute:NSParagraphStyleAttributeName
                          value:paragraphStyle
                          range:NSMakeRange(0, [self length])];
    return attributedStr;
}

@end
