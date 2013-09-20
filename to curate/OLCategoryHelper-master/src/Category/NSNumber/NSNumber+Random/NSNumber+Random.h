//
// NSNumber+Random.h
// OLCategoryHelper
//
// Created by Pay Liu on 13/9/5.
// Copyright (c) 2013年 Octalord Information Inc. The MIT License.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Random)

/**
 *  get a random integer between 0 and maxInt -1
 *
 *  @param maxInt max int value to bound a random value.
 *
 *  @return random int value
 */
+ (int) randomInt:(int)maxInt;

/**
 *  get a random BOOL value, YES or NO.
 *
 *  @return random BOOL value
 */
+ (BOOL) randomBool;

@end
