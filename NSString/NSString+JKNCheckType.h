//
//  NSString+JKNCheckType.h
//  PAFoundation
//
//  Created by Perry on 15/1/9.
//  Copyright (c) 2015年 PAJK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (jkn_CheckType)

- (BOOL)jkn_isNumberString;          //是否是数字

#pragma mark - 电话号码
- (BOOL)jkn_isMobileNumber;    //是否是手机号码
- (NSString *)jkn_pureTelNumber;       // 没有+86等信息的电话号码

#pragma mark - URL&路径
- (BOOL)jkn_isURL;             //是否是URL
- (BOOL)jkn_isPath;            //是否是路径

#pragma mark - 邮件
- (BOOL)jkn_isEmailAddress;    //是否是邮件地址

#pragma mark - 其他
- (BOOL)jkn_isPostCode;        //是否是邮编
@end
