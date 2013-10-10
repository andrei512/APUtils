//
//  AppDelegate.m
//  TestAPUtils
//
//  Created by Andrei Puni on 10/9/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "AppDelegate.h"
//#import <APUtils+Foundation.h>
//
#define PO(x) NSLog(@"%s = %@", #x, x);

@implementation AppDelegate

//- (void)runExamples {
//    [self arrayExamples];
//    [self dateExamples];
//}
//
//- (void)arrayExamples {
//    NSArray *array = @[@1.1, @2.2, @3.3, @4.4, @5.5, @6.6, @7.7, @8.7, @9.9, @10];
//    
//    PO([array filter:^BOOL(NSNumber *nr) {
//        return nr.intValue % 2 == 1;
//    }])
//    
//    PO([array mapWithBlock:^id(NSNumber *number) {
//        return @(number.intValue * 2);
//    }])
//    
//    PO([array mapWithSelector:@selector(formatedString)])
//    
//    NSArray *usersInfo = [NSArray arrayFromPlistNamed:@"Users"];
//    PO(usersInfo)
//    
//    PO([usersInfo mapToClass:[User class]])
//}
//
//- (void)dateExamples {
//    
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    [self runExamples];
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
