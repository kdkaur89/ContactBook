//
//  DetailViewController.h
//  ContactBook
//
//  Created by Kirandeep Kaur on 19/01/16.
//  Copyright (c) 2016 KD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
@interface DetailViewController : UIViewController

@property (strong, nonatomic) Person *person;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

-(IBAction)callContact:(UIButton *)sender;
@end

