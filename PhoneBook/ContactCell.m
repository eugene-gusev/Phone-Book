//
//  ContactCell.m
//  PhoneBook
//
//  Created by Eugene Gusev on 02.04.16.
//  Copyright © 2016 Eugene Gusev. All rights reserved.
//

#import "ContactCell.h"

@implementation ContactCell

@synthesize nameLabel;
@synthesize phoneLabel;
@synthesize photo;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
