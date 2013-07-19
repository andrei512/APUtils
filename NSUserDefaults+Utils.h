//
//  NSUserDefaults+Utils.h
//  Point2Homes
//
//  Created by Andrei Puni on 7/9/13.
//  Copyright (c) 2013 Point2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Utils)

+ (BOOL)setUserValue:(id)value forKey:(id)key;
+ (id)valueForKey:(NSString *)key;

@end
