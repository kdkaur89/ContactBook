//
//  MasterViewController.h
//  ContactBook
//
//  Created by Kirandeep Kaur on 19/01/16.
//  Copyright (c) 2016 KD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ContactsDetailViewController;

@interface ContactsViewController : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) ContactsDetailViewController *detailViewController;
@property (strong, nonatomic) NSMutableArray *contacts;

-(void)reloadTableView;
@end

