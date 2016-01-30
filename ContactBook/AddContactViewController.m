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

#pragma mark - View lifecycle methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setRegex];
    [self configureView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma view configuration

- (void)setRegex{
    self.firstNameTextField.regex = nameRegex;
    self.phoneNumberTextField.regex = numberRegex;
}

- (void)configureView {

    self.firstNameLabel.text = NSLocalizedString(@"firstName", nil);
    self.lastNameLabel.text = NSLocalizedString(@"lastName", nil);
    self.phoneLabel.text = NSLocalizedString(@"phone", nil);
    [self.saveButton setTitle:NSLocalizedString(@"save", nil) forState:UIControlStateNormal];
    self.firstNameTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    self.lastNameTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    self.saveButton.enabled = false;
    
}


#pragma mark -Actions

- (IBAction)saveDetails:(UIButton *)sender {
    
    //Add contact to contacts array
    _person = [[Person alloc]init];
    _person.firstName = self.firstNameTextField.text;
    _person.lastName = self.lastNameTextField.text;
    _person.phoneNumber = self.phoneNumberTextField.text;
    [_masterViewController.contacts insertObject:_person atIndex:self.masterViewController.contacts.count];
    [_masterViewController reloadTableView];
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
