//
//  ContactsTableViewCell.m
//  
//
//  Created by Kirandeep Kaur on 25/01/16.
//
//

#import "ContactsTableViewCell.h"

@implementation ContactsTableViewCell

-(id)init{
    return  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].firstObject;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
