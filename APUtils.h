//
//  APUtils.h
//
//  Created by Andrei Puni on 4/18/13.
//
 
#import "NSString+APUtils.h"
#import "NSArray+APUtils.h"
#import "NSDictionary+APUtils.h"

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define IS_IPHONE_4 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 480.0f)

@interface APUtils : NSObject

+ (BOOL)canMakePhoneCalls;
+ (void)findAndResignFirstReponder;

+ (void)benchmark:(void(^)(void))block name:(NSString *)name;
+ (void)benchmark:(void(^)(void))block;

@end

#ifdef DEBUG
    /// Stick this in code you want to assert if run on the main UI thread.
    #define DONT_BLOCK_UI NSAssert(![NSThread isMainThread], @"Don't block the UI thread please!");

    /// Stick this in code you want to assert if run on a background thread.
    #define BLOCK_UI NSAssert([NSThread isMainThread], @"You aren't running in the UI thread!");
#else
    #define DONT_BLOCK_UI
    #define BLOCK_UI
#endif
