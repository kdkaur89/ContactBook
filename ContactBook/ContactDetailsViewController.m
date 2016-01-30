//
//  DetailViewController.m
//  ContactBook
//
//  Created by Kirandeep Kaur on 19/01/16.
//  Copyright (c) 2016 KD. All rights reserved.
//

#import "ContactDetailsViewController.h"

@interface ContactDetailsViewController ()

@end

@implementation ContactDetailsViewController

#pragma mark - View lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View configuration

- (void)configureView {
    
    self.phoneLabel.text = NSLocalizedString(@"phone", nil);
    self.nameValueLabel.text = NSLocalizedString(@"name", nil);
    self.phoneValueLabel.text = self.person.phoneNumber;
    self.nameValueLabel.text = self.person.personName;
}

-(void)setPerson:(Person *)person {
    if(_person != person) {
        _person = person;
    }
}

#pragma mark -Actions
-(void)callContact:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",self.person.phoneNumber]]];
}



@end
