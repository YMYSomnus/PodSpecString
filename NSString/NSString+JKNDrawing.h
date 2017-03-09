//
//  NSString+JKNDrawing.h
//  PAJKCardApp
//
//  Created by wangweishun on 6/18/14.
//  Copyright (c) 2014 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (jkn_Drawing)

// 根据范围，字体和行高计算字体的实际显示范围
- (CGSize)jkn_sizeWithConstrainedSize:(CGSize)size font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing;
// 根据范围，字体计算字体的实际显示范围
- (CGSize)jkn_sizeWithMaxWidth:(CGFloat)width font:(UIFont *)font;
// 根据宽度，字体和行高计算字体的实际显示范围
- (CGSize)jkn_sizeWithMaxWidth:(CGFloat)width font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing;
// 根据宽度，字体和行高计算字体的实际显示范围,并设置最大行数
- (CGSize)jkn_sizeWithConstrainedSize:(CGSize)size font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing paragraphSpacing:(CGFloat) pSpacing maxLines:(NSInteger)lines isOver:(BOOL *)isOver;

// 根据宽度、字体、行高、段落间距计算字体的实际显示范围
- (CGSize)jkn_sizeWithMaxWidth:(CGFloat)width font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing paragraphSpacing:(CGFloat) pSpacing;

// 设置文本的行高
-(NSMutableAttributedString *)jkn_attributedStringFromStingWithFont:(UIFont *)font
                                                    withLineSpacing:(CGFloat)lineSpacing;
@end
