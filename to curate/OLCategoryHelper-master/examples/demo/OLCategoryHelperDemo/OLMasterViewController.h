//
//  OLMasterViewController.h
//  OLCategoryHelperDemo
//
//  Created by Pay Liu on 13/9/5.
//  Copyright (c) 2013年 Octalord Information Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OLDetailViewController;

@interface OLMasterViewController : UITableViewController

@property (strong, nonatomic) OLDetailViewController *detailViewController;

@end
