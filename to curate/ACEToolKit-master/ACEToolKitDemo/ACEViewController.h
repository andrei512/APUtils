//
//  ACEViewController.h
//  ACEToolKitDemo
//
//  Created by Stefano Acerbetti on 1/22/13.
//  Copyright (c) 2013 Stefano Acerbetti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACEViewController : UIViewController

@property (nonatomic, unsafe_unretained) IBOutlet UILabel *messageLabel;

- (IBAction)delegateAlertView:(id)sender;
- (IBAction)blockAlertView:(id)sender;

- (IBAction)delegateActionSheet:(id)sender;
- (IBAction)blockActionSheet:(id)sender;

@end
