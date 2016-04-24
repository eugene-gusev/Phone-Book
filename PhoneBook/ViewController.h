//
//  ViewController.h
//  PhoneBook
//
//  Created by Eugene Gusev on 02.04.16.
//  Copyright © 2016 Eugene Gusev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddContactViewController.h"
#import "ContactDetailsViewController.h"

@interface ViewController : UIViewController <AddContactViewControllerDelegate, ContactDetailsViewControllerDelegate>

@end

