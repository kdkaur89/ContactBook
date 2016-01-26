//
//  ContactsTableViewCell.h
//  
//
//  Created by Kirandeep Kaur on 25/01/16.
//
//

#import <UIKit/UIKit.h>

@interface ContactsTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *contactPhoto;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *phone;

@end
