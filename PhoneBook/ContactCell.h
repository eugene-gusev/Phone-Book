//
//  ContactCell.h
//  PhoneBook
//
//  Created by Eugene Gusev on 02.04.16.
//  Copyright © 2016 Eugene Gusev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactCell : UITableViewCell
@property IBOutlet UILabel * nameLabel;
@property IBOutlet UILabel * phoneLabel;
@property (strong, nonatomic) IBOutlet UIImageView *photo;
@end
