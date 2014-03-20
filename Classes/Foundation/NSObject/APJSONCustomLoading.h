//
//  APJSONCustomLoading.h
//  DevAPUtils
//
//  Created by Bogdan Poplauschi on 20/03/14.
//  Copyright (c) 2014 Andrei Puni. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APJSONCustomLoading <NSObject>

- (void)customLoadJson:(NSDictionary *)data;

@end