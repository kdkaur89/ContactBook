//
//  Person.h
//  
//
//  Created by Kirandeep Kaur on 19/01/16.
//
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, assign) NSString *personID;

-(NSString *)personName;
-(id)initWithJSONDictionary: (NSDictionary *)jsonDictionary;
@end
