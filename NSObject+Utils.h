//
//  NSObject+Utils.h
//
//  Created by Andrei Puni on 5/10/13.
//

#import <Foundation/Foundation.h>

@interface NSObject (Utils)

- (NSString *)hashKey;

- (Class)classByRemovingSuffix:(NSString *)suffix;
+ (Class)classByRemovingSuffix:(NSString *)suffix;

- (Class)classByReplacingSuffix:(NSString *)suffix with:(NSString *)replacement;
+ (Class)classByReplacingSuffix:(NSString *)suffix with:(NSString *)replacement;

- (Class)classByAddingSuffix:(NSString *)suffix;
+ (Class)classByAddingSuffix:(NSString *)suffix;



@end
