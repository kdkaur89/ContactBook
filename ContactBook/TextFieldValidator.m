//
//  TextFieldValidator.m
//  
//
//  Created by Kirandeep Kaur on 26/01/16.
//
//

#import "TextFieldValidator.h"

@implementation TextFieldValidator
@synthesize regex = _regex;

-(BOOL)isValid{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", self.regex];
    return [predicate evaluateWithObject:self.text];
}

@end
