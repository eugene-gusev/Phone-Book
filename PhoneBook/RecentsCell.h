//
//  RecentsCell.h
//  PhoneBook
//
//  Created by Eugene Gusev on 23.04.16.
//  Copyright © 2016 Eugene Gusev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecentsCell : UITableViewCell
@property IBOutlet UILabel * nameLabel;
@property IBOutlet UILabel * dateLabel;
@property (strong, nonatomic) IBOutlet UIImageView *photo;
@end
