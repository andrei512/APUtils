//
//  UITextField+Utils.h
//
//  Created by Andrei Puni on 4/30/13.
//

#import <UIKit/UIKit.h>

@interface UITextField (Utils)

- (void)persistAs:(NSString *)identifier;

+ (void)clearStoredTexts;
+ (void)saveText:(NSString *)text forIdentifier:(NSString *)identifier;



@end


