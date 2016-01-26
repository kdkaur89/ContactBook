//
//  AddContactViewController.h
//  
//
//  Created by Kirandeep Kaur on 26/01/16.
//
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "MasterViewController.h"
#import "TextFieldValidator.h"

@interface AddContactViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet  TextFieldValidator *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet TextFieldValidator *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (strong, nonatomic) MasterViewController *masterViewController;

@property (strong, nonatomic) Person *person;

- (IBAction)saveDetails:(UIButton *)sender;

@end
