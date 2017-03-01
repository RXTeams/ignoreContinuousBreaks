//
//  NSString+ignore_continuous_line_breaks.m
//  textview
//
//  Created by 张衡 on 2017/2/27.
//  Copyright © 2017年 张衡. All rights reserved.
//

#import "NSString+ignore_continuous_line_breaks.h"

@implementation NSString (ignore_continuous_line_breaks)

- (NSString *)ignoreContinuousLineBreaks {
    
    NSMutableString *string = self.mutableCopy;
    
    NSString *pattern = @"(\r\n(?:[ ])*|\n(?:[ ])*){3,}";
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionDotMatchesLineSeparators error:&error];
    NSArray *results = [regex matchesInString:string options:0 range:NSMakeRange(0, string.length)];
    NSInteger count = results.count;
    
    while (count > 0) {
        NSTextCheckingResult *result = results[--count];
        [string replaceCharactersInRange:result.range withString:@"\n\n"];
    }
    
    while ([[string substringWithRange:NSMakeRange(string.length - 1, 1)] isEqualToString:@"\n"]) {
        [string deleteCharactersInRange:NSMakeRange(string.length-1, 1)];
    }
    
    while ([[string substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"\n"]) {
        [string deleteCharactersInRange:NSMakeRange(0, 1)];
    }
    
    return string.copy;
}

@end
