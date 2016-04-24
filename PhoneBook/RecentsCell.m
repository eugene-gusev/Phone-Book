//
//  RecentsCell.m
//  PhoneBook
//
//  Created by Eugene Gusev on 23.04.16.
//  Copyright © 2016 Eugene Gusev. All rights reserved.
//

#import "RecentsCell.h"

@implementation RecentsCell
@synthesize nameLabel;
@synthesize dateLabel;
@synthesize photo;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
