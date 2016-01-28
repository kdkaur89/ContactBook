//
//  MasterViewController.h
//  ContactBook
//
//  Created by Kirandeep Kaur on 19/01/16.
//  Copyright (c) 2016 KD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) NSMutableArray *contacts;

-(void)reloadTableView;
@end

