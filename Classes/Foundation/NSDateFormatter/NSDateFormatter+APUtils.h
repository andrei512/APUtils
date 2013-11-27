//
//  NSDateFormatter+APUtils.h
//  DevAPUtils
//
//  Created by Bogdan Poplauschi on 27/11/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (APUtils)

/**
 *  Use this method to get a safe instance of NSDateFormatter based on the date format. Necesarry since NSDateFormatter is not thread safe and is less performant if recreated compared to being reused.
 *
 *  @note There is no way to preventing you to change the date format after it was retrieved via this method, but I strongly recommend not to. It could generate performance issues (won't affect thread safety).
 *
 *  @param inDateFormat the date format
 *
 *  @return the instance of NSDateFormatter
 */
+ (NSDateFormatter *)threadSafeInstanceWithFormat:(NSString *)inDateFormat;

@end
