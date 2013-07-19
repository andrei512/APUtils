//
//  UITextField+Utils.h
//  Point2Homes
//
//  Created by Andrei Puni on 4/30/13.
//  Copyright (c) 2013 Point2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Utils)

- (void)persistAs:(NSString *)identifier;

+ (void)clearStoredTexts;
+ (void)saveText:(NSString *)text forIdentifier:(NSString *)identifier;

@property (nonatomic, strong) NSString *unformattedText;

@end


