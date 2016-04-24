//
//  ContactDetailsViewController.h
//  PhoneBook
//
//  Created by Eugene Gusev on 17.04.16.
//  Copyright © 2016 Eugene Gusev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
#import "AddContactViewController.h"

@class ContactDetailsViewController;

@protocol ContactDetailsViewControllerDelegate <NSObject>
- (void)updateContact:(ContactDetailsViewController *)controller enteringContact:(Contact *)contact atIndexPath:(NSInteger *)index;
@end

@interface ContactDetailsViewController : UIViewController <AddContactViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UILabel * nameLabel;
@property (strong, nonatomic) IBOutlet UILabel * phoneLabel;
@property (strong, nonatomic) IBOutlet UIImageView *photo;
@property (strong, nonatomic) IBOutlet UILabel * emailLabel;
@property (strong, nonatomic) IBOutlet UILabel * addressLabel;
@property (nonatomic, strong) Contact * contact;
@property (nonatomic, weak) id delegate;
@property (nonatomic) NSInteger * index;

@end
