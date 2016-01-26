//
//  AddContactViewController.m
//
//
//  Created by Kirandeep Kaur on 26/01/16.
//
//

#import "AddContactViewController.h"

@interface AddContactViewController ()

@end

@implementation AddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    
}

- (void)configureView {
    
    self.firstNameTextField.regex = @"[a-zA-Z]*";
    self.firstNameTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    self.lastNameTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    self.phoneNumberTextField.regex = @"^((\\+)|(00))[0-9]{6,14}$";
    self.saveButton.enabled = false;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setPerson:(Person *)person {
    
    if(_person != person) {
        _person = person;
    }
}
- (IBAction)saveDetails:(UIButton *)sender {
    
    //Add contact to contacts array
    
    _person.firstName = self.firstNameTextField.text;
    _person.lastName = self.lastNameTextField.text;
    _person.phoneNumber = self.phoneNumberTextField.text;
    [_masterViewController.contacts insertObject:_person atIndex:self.masterViewController.contacts.count];
    [_masterViewController.tableView reloadData];
    [self.navigationController popViewControllerAnimated:TRUE];
}


#pragma mark - Textfield delegates
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    if([textField isEqual:self.firstNameTextField]) {
        [self.lastNameTextField becomeFirstResponder];
    }
    
    if([textField isEqual:self.lastNameTextField]) {
        [self.phoneNumberTextField becomeFirstResponder];
    }
    
    return YES;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    [self toggleSaveButtonForValidInput];
    return YES;
}

-(void)toggleSaveButtonForValidInput
{
    if(self.firstNameTextField.isValid && self.phoneNumberTextField.isValid) {
        self.saveButton.enabled = YES;
    }
    else{
        self.saveButton.enabled = NO;
    }
    
}
@end
