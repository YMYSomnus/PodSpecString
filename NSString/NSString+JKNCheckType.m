//
//  NSString+JKNCheckType.m
//  PAFoundation
//
//  Created by Perry on 15/1/9.
//  Copyright (c) 2015年 PAJK. All rights reserved.
//

#import "NSString+JKNCheckType.h"

@implementation NSString (jkn_CheckType)

- (BOOL)jkn_isNumberString
{
    NSString *match=@"[0-9]+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    bool valid = [predicate evaluateWithObject:self];
    return valid;
}


- (BOOL)jkn_isMobileNumber
{
    bool isMobile = false;
    
    if(self.length == 11 && [self jkn_isNumberString])
    {
        NSString *firstStr = [self substringToIndex:1];
        
        if([firstStr integerValue] == 1)
        {
            isMobile = true;
        }
    }
    
    return isMobile;
}

- (NSString *)jkn_pureTelNumber
{
    if ([self length] >= 11)
    {
        NSString *subString = [self substringFromIndex:[self length]-11];
        
        return subString;
    }
    
    return self;
}

- (BOOL)jkn_isURL
{
    return YES;
}

- (BOOL)jkn_isPath
{
    return YES;
}


- (BOOL)jkn_isEmailAddress
{
    NSString *match=@"\\S+@(\\S+\\.)+[\\S]{1,6}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    bool valid = [predicate evaluateWithObject:self];
    
    return valid;
}

- (BOOL)jkn_isPostCode
{
    if(self.length != 6 || ![self jkn_isNumberString])
    {
        return false;
    }
    
    return true;
}
@end
