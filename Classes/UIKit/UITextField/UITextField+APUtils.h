//
//  UITextField+APUtils.h
//
//  Created by Andrei Puni on 4/30/13.
//

#import <UIKit/UIKit.h>

@interface UITextField (APUtils)

- (void)persistAs:(NSString *)identifier;   // when finished using the textfield, please use `stopPersisting` so that the observers added in `persistAs:` are removed.
- (void)stopPersisting;                     // will remove the observers

+ (void)clearStoredTexts;
+ (void)saveText:(NSString *)text forIdentifier:(NSString *)identifier;



@end


