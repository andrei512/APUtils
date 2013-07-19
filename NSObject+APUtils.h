//
//  NSObject+Phoenix.h
//  Clomp
//
//  Created by Andrei on 8/11/12.
//  Copyright (c) 2012 Whatevra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Model)

- (id)loadFrom:(id)data;
- (id)ashes;
- (id)ashes:(BOOL)underscored;

+ (id)createFrom:(id)data;

- (NSString *)className;

@end
