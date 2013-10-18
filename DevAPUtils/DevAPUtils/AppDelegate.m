//
//  AppDelegate.m
//  DevAPUtils
//
//  Created by Andrei Puni on 9/19/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

// this should import APUtils+Foundation
#import "APUtils.h"
#import "NSObject+Decorators.h"

#import "APUtilsFoundationExamples.h"
#import "NSObject+APRuntime.h"

@implementation AppDelegate

- (void)doIt:(NSString *)className {
    Class objectClass = NSClassFromString(className);
    id decorator = [objectClass decorator];
    
    NSLog(@"%@ %2d", className, (int)decorator % 97);
//    NSLog(@"%@ %@", [objectClass mappings], [objectClass transformations]);
}

- (void)crashDecorator {
    NSMutableArray *threads = [NSMutableArray array];
    NSArray *classNames = @[
        @"NSObject", @"NSString", @"NSDictionary", @"UIView", @"NSData", @"NSDate",
        @"NSNumber", @"NSUserDefaults", @"UIColor", @"UIDevice", @"UIImage",
        @"UIImageView", @"UITableView", @"UITableViewCell", @"UITextField",
        
        @"NSObject", @"NSString", @"NSDictionary", @"UIView", @"NSData", @"NSDate",
        @"NSNumber", @"NSUserDefaults", @"UIColor", @"UIDevice", @"UIImage",
        @"UIImageView", @"UITableView", @"UITableViewCell", @"UITextField"
    ];
    
    for (NSString *className in classNames) {
        NSThread *thread = [[NSThread alloc] initWithTarget:self
                                                   selector:@selector(doIt:)
                                                     object:className];
        [threads addObject:thread];
    }
    
    [threads makeObjectsPerformSelector:@selector(start)];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    PO([[self class] propertyInfo])
    
//    [self crashDecorator];
    
//    [[APUtilsFoundationExamples new] runExamples];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
    } else {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
    }
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
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
