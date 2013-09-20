//
// UIColor+HexString.h
//
// Created by Pay on 13/3/14.
// Copyright (c) 2013年 Octalord. The MIT License
//

#import <UIKit/UIKit.h>

@interface UIColor (HexString)

/*
 * Returns an autoreleased UIColor instance with the hexadecimal color.
 * @param hex A color in hexadecimal notation: `0xCCCCCC`, `0xF7F7F7`, etc.
 * @return A new autoreleased UIColor instance.
 * http://stackoverflow.com/questions/1560081/how-can-i-create-a-uicolor-from-a-hex-string
 */
+ (UIColor *) colorWithHex:(int)hex;

@end
