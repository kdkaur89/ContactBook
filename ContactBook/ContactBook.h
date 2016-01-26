//
//  ContactBook.h
//  
//
//  Created by Kirandeep Kaur on 25/01/16.
//
//

#import <Foundation/Foundation.h>
#import "Person.h"
@interface ContactBook : NSObject

@property (nonatomic, strong) NSMutableArray *contacts;

- (NSArray *)getContacts;
- (NSArray *)getContactsFromFile: (NSURL *)url;

@end
