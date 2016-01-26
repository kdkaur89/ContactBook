//
//  ContactBook.m
//
//
//  Created by Kirandeep Kaur on 25/01/16.
//
//

#import "ContactBook.h"

@implementation ContactBook

- (NSArray *)getContactsFromFile: (NSURL *)url {
    // Create a NSURLRequest with the given URL
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                         timeoutInterval:30.0];
    
    // Get the data
    NSURLResponse *response;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    // Now create a NSDictionary from the JSON data
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    // Create a new array to hold the contacts
    NSMutableArray *contacts = [[NSMutableArray alloc] init];
    
    // Get an array of dictionaries with the key "contacts"
    NSArray *array = [jsonDictionary objectForKey:@"contacts"];
    // Iterate through the array of dictionaries
    for(NSDictionary *dict in array) {
        // Create a new Person object for each one and initialise it with information in the dictionary
        Person *person = [[Person alloc] initWithJSONDictionary:dict];
        // Add the person object to the array
        [contacts addObject:person];
    }
    
    // Return the array of person objects
    return contacts;
    
}

- ( NSArray *)getContacts {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Contacts" withExtension:@"json"];
    return [self getContactsFromFile:url];
}



@end
