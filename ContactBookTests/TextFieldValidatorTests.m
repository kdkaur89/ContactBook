//
//  TextFieldValidatorTests.m
//  
//
//  Created by Kirandeep Kaur on 28/01/16.
//
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "TextFieldValidator.h"
@interface TextFieldValidatorTests : XCTestCase
@property (nonatomic ) TextFieldValidator *textfieldValidator;
@end

@implementation TextFieldValidatorTests

- (void)setUp {
    [super setUp];
    self.textfieldValidator = [[TextFieldValidator alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testInvalidPhoneNumber{
    
    NSString *notValidPhoneNumber = @"11";
    [self.textfieldValidator setText:notValidPhoneNumber];
    BOOL isPhoneValid = self.textfieldValidator.isValid;
    
    XCTAssertFalse(isPhoneValid);
}

-(void)testValidPhoneNumber{
    
    NSString *validPhoneNumber = @"+919975586152";
    [self.textfieldValidator setText:validPhoneNumber];
    BOOL isPhoneValid = self.textfieldValidator.isValid;
    
    XCTAssertTrue(isPhoneValid);
}

- (void)testInvalidFirstName{
    
    NSString *invalidFirstName = @"";
    [self.textfieldValidator setText:invalidFirstName];
    BOOL isFirstNameValid = self.textfieldValidator.isValid;
    
    XCTAssertFalse(isFirstNameValid);
    
}

- (void)alidFirstName{
    
    NSString *validFirstName = @"Kirandeep";
    [self.textfieldValidator setText:validFirstName];
    BOOL isFirstNameValid = self.textfieldValidator.isValid;
    
    XCTAssertTrue(isFirstNameValid);
    
}
@end
