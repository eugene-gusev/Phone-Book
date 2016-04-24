//
//  AddContactViewController.h
//  PhoneBook
//
//  Created by Eugene Gusev on 17.04.16.
//  Copyright © 2016 Eugene Gusev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@class AddContactViewController;

@protocol AddContactViewControllerDelegate <NSObject>
- (void)setContact:(AddContactViewController *)controller enteringContact:(Contact *)contact;
@end

@interface AddContactViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextField * firstname;
@property (strong, nonatomic) IBOutlet UITextField * lastname;
@property (strong, nonatomic) IBOutlet UITextField * phone;
@property (strong,nonatomic) IBOutlet UIBarButtonItem * done;
@property (strong, nonatomic) IBOutlet UITextField * email;
@property (strong, nonatomic) IBOutlet UITextField * address;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (nonatomic, weak) id delegate;
@property (strong, nonatomic) NSString * imageUrl;
@property (nonatomic, strong) Contact * contact;

@end
