//
//  Person.m
//  
//
//  Created by Kirandeep Kaur on 19/01/16.
//
//

#import "Person.h"

@implementation Person

- (id)initWithJSONDictionary: (NSDictionary *)jsonDictionary{
    if(self = [super init]){
        //Assign propersties from keys in the dictionary
        _firstName = [jsonDictionary objectForKey:@"first_name"];
        _lastName = [jsonDictionary objectForKey:@"last_name"];
        _personID = [jsonDictionary objectForKey:@"id"];
        _phoneNumber = [jsonDictionary objectForKey:@"phone"];
    }
    return self;
}

-(NSString *)personName{
    return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}
@end
