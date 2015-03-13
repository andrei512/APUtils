//
//  NSNumberFormatter+APUtils.h
//  DevAPUtils
//
//  Created by Stefan Sabau on 13/03/15.
//  Copyright (c) 2015 Andrei Puni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumberFormatter (APUtils)

+ (NSNumberFormatter *)threadSafeInstanceWithStyle:(NSNumberFormatterStyle)numberStyle behavior:(NSNumberFormatterBehavior)behavior;

@end
