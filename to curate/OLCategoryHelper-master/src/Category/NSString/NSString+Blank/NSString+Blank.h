//
// NSString+Blank.h
// OLCategoryHelper
//
// Created by Pay Liu on 13/9/14.
// Copyright (c) 2013年 Octalord Information Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Blank)

/**
 *    [nil isBlank]         == YES
 *    [@"" isBlank]         == YES
 *    [@" " isBlank]        == YES
 *    [@"bob" isBlank]      == NO
 *    [@"  bob   " isBlank] == NO
 *
 *  @return YES or NO
 */
- (BOOL) isBlank;

/**
 *    [nil isBlank]         == NO
 *    [@"" isBlank]         == NO
 *    [@" " isBlank]        == NO
 *    [@"bob" isBlank]      == YES
 *    [@"  bob   " isBlank] == YES
 *
 *  @return YES or NO
 */
- (BOOL) isNotBlank;

/**
 *    [nil isEmpty]         == YES
 *    [@"" isEmpty]         == YES
 *    [@" " isEmpty]        == NO
 *    [@"bob" isEmpty]      == NO
 *    [@"  bob   " isEmpty] == NO
 *
 *  @return YES or NO
 */
- (BOOL) isEmpty;

/**
 *    [nil isEmpty]         == NO
 *    [@"" isEmpty]         == NO
 *    [@" " isEmpty]        == YES
 *    [@"bob" isEmpty]      == YES
 *    [@"  bob   " isEmpty] == YES
 *
 *  @return YES or NO
 */
- (BOOL) isNotEmpty;

@end
