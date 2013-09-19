//
//  NSUserDefaults+APUtils.h
//
//  Created by Andrei Puni on 7/9/13.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Utils)

+ (BOOL)setUserValue:(id)value forKey:(id)key;
+ (id)valueForKey:(NSString *)key;

@end
