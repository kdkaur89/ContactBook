//
//  DetailViewController.m
//  ContactBook
//
//  Created by Kirandeep Kaur on 19/01/16.
//  Copyright (c) 2016 KD. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

-(void)setPerson:(Person *)person {
    if(_person != person) {
        _person = person;
    }
}

- (void)configureView {
    self.phoneLabel.text = self.person.phoneNumber;
    self.nameLabel.text = self.person.name;
}

-(void)callContact:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.person.phoneNumber]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
