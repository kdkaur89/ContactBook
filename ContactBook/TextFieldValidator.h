//
//  TextFieldValidator.h
//  
//
//  Created by Kirandeep Kaur on 26/01/16.
//
//

#import <UIKit/UIKit.h>

@interface TextFieldValidator : UITextField

@property (nonatomic, strong) NSString *regex;

-(BOOL)isValid;

@end
