//
//  NSArray+APUtils.h
//
//  Created by Andrei Puni on 4/29/13.
//

#import <Foundation/Foundation.h>

typedef BOOL(^BoolBlock)(id object);
typedef id(^ObjectBlock)(id object);

@interface NSArray (Utils)

- (NSMutableArray *)filter:(BoolBlock)block;
- (NSMutableArray *)map:(ObjectBlock)block;
- (NSMutableArray *)mapWithSelector:(SEL)selector;
- (NSMutableArray *)mapToClass:(Class)objectClass;

+ (NSArray *)arrayFromPlistNamed:(NSString *)name;

@end
