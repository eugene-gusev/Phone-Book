//
//  ContactDetailsViewController.m
//  PhoneBook
//
//  Created by Eugene Gusev on 17.04.16.
//  Copyright © 2016 Eugene Gusev. All rights reserved.
//

#import "ContactDetailsViewController.h"
#import "Contact.h"
#import "AddContactViewController.h"

@interface ContactDetailsViewController ()

@end

@implementation ContactDetailsViewController

@synthesize nameLabel,phoneLabel,photo,addressLabel,emailLabel,contact,index,delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    
    self.emailLabel.text = contact.email;
    self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", contact.firstName, contact.lastName];
    self.phoneLabel.text = contact.phoneNumber;
    self.photo.image = [UIImage imageWithContentsOfFile: [documentsDirectoryPath stringByAppendingPathComponent:contact.imageURL]];
    self.addressLabel.text = contact.address;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleEdit:(id)sender
{
    UIStoryboard *storyBoard = [self storyboard];
    AddContactViewController *acvc = [storyBoard instantiateViewControllerWithIdentifier:@"AddContact"];
    acvc.delegate = self;
    acvc.contact = self.contact;
    acvc.title = @"Edit Contact";
    acvc.navigationController.toolbarHidden = NO;
    
    [self showViewController:acvc sender:self];
}

-(void)setContact:(AddContactViewController *)controller enteringContact:(Contact *)enter_contact {
    if (enter_contact!=nil) {
        NSLog(@"hey");
        [self.delegate updateContact:self enteringContact:enter_contact atIndexPath:self.index];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
