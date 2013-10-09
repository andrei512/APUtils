//
//  NSArray+APUtils.h
//
//  Created by Andrei Puni on 4/29/13.
//

#import <Foundation/Foundation.h>

typedef BOOL(^APBoolBlock)(id object);
typedef id(^APObjectBlock)(id object);

@interface NSArray (APUtils)

- (NSMutableArray *)filter:(APBoolBlock)block;
- (NSMutableArray *)mapWithBlock:(APObjectBlock)block;
- (NSMutableArray *)mapWithSelector:(SEL)selector;
- (NSMutableArray *)mapToClass:(Class)objectClass;

+ (NSArray *)arrayFromPlistNamed:(NSString *)name;

@end
