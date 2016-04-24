//
//  ViewController.m
//  PhoneBook
//
//  Created by Eugene Gusev on 02.04.16.
//  Copyright © 2016 Eugene Gusev. All rights reserved.
//

#import "ViewController.h"
#import "ContactCell.h"
#import "Contact.h"
#import "ContactDetailsViewController.h"
#import "AddContactViewController.h"
#import "CallInfo.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
    @property (weak, nonatomic) IBOutlet UITableView *tableView;
    @property NSMutableArray * tableData;
    @property NSString * imagesPath;
@end

@implementation ViewController

@synthesize tableView,imagesPath;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(toggleAdd:)];
    self.navigationController.navigationBar.topItem.rightBarButtonItem = addButton;
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"appData"];
    self.imagesPath = documentsDirectoryPath;
    
     self.tableData = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}

- (IBAction)makeCall:(id)sender
{
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Calling"
                                                          message:@"Device is calling"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles: nil];
        
    [myAlertView show];
    
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
    Contact * contact = self.tableData[indexPath.row];
    NSDate * now = [NSDate date];
    CallInfo * message = [[CallInfo alloc] initWithContact:contact Date:now];
    
    NSNotification *myNotification = [NSNotification notificationWithName:@"CallNotification" object:message];
    [[NSNotificationQueue defaultQueue] enqueueNotification:myNotification
                                               postingStyle:NSPostASAP
                                               coalesceMask:NSNotificationNoCoalescing
                                                   forModes:nil];
    
}

//нажатие на кнопку "добавление контакта"
- (IBAction)toggleAdd:(id)sender
{
    UIStoryboard *storyBoard = [self storyboard];
    AddContactViewController *acvc = [storyBoard instantiateViewControllerWithIdentifier:@"AddContact"];
    acvc.delegate = self;
    [self showViewController:acvc sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
    return [self.tableData count];
}

-(UITableViewCell*)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        Contact * contact = self.tableData[indexPath.row];
        ContactCell* cell = (ContactCell *)[table dequeueReusableCellWithIdentifier:@"ContactCell" forIndexPath:indexPath];

        cell.phoneLabel.text = contact.phoneNumber;
        cell.nameLabel.text = [NSString stringWithFormat:@"%@ %@", contact.firstName, contact.lastName];
   
        cell.photo.image = [UIImage imageWithContentsOfFile: [self.imagesPath stringByAppendingPathComponent:contact.imageURL]];
        return cell;
   
}

//добавление контакта
-(void)setContact:(AddContactViewController *)controller enteringContact:(Contact *)contact {
    if (contact!=nil) {
        [self.tableData addObject:contact];
         NSString *filePath = [self.imagesPath stringByAppendingPathComponent:@"appData"];
        [NSKeyedArchiver archiveRootObject:self.tableData toFile:filePath];
        [self.tableView reloadData];
    }
}

//редактирование контакта
-(void)updateContact:(ContactDetailsViewController *)controller enteringContact:(Contact *)contact atIndexPath:(NSInteger *)index {
    if (contact!=nil) {
        [self.tableData removeObjectAtIndex:index];
        [self.tableData addObject:contact];
         NSString *filePath = [self.imagesPath stringByAppendingPathComponent:@"appData"];
        [NSKeyedArchiver archiveRootObject:self.tableData toFile:filePath];
        [self.tableView reloadData];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showContactDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ContactDetailsViewController * destViewController = segue.destinationViewController;
        destViewController.contact = [self.tableData objectAtIndex:indexPath.row];
        destViewController.delegate = self;
        destViewController.index = indexPath.row;
    }
}

//удаление контакта
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            [self.tableData removeObjectAtIndex:indexPath.row];
            NSString *filePath = [self.imagesPath stringByAppendingPathComponent:@"appData"];
            [NSKeyedArchiver archiveRootObject:self.tableData toFile:filePath];
            [self.tableView reloadData];
        }
    } else {
        NSLog(@"Unhandled editing style! %d", editingStyle);
    }
}

@end
