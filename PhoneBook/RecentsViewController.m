//
//  RecentsViewController.m
//  PhoneBook
//
//  Created by Eugene Gusev on 24.04.16.
//  Copyright © 2016 Eugene Gusev. All rights reserved.
//

#import "RecentsViewController.h"
#import "RecentsCell.h"
#import "CallInfo.h"

@interface RecentsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *recentsTableView;
@property NSMutableArray * recentsTableData;
@property NSString * imagesPath;
@end

@implementation RecentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _recentsTableData = [NSMutableArray array];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    self.imagesPath = documentsDirectoryPath;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didGetCallNotification:)
                                                 name:@"CallNotification"
                                               object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didGetCallNotification:(NSNotification*)notification {
    [self.recentsTableData addObject:[notification object]];
    [self.recentsTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
    return [self.recentsTableData count];
}

-(UITableViewCell*)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecentsCell* cell = (RecentsCell *)[table dequeueReusableCellWithIdentifier:@"RecentsCell" forIndexPath:indexPath];
    CallInfo * inf = [self.recentsTableData objectAtIndex:indexPath.row];
    Contact * contact = [inf getContact];
    
    cell.photo.image = [UIImage imageWithContentsOfFile: [self.imagesPath stringByAppendingPathComponent:contact.imageURL]];
    cell.nameLabel.text = [NSString stringWithFormat:@"%@ %@", contact.firstName, contact.lastName];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"MM/dd/yy";
    NSString *date = [dateFormatter stringFromDate: [inf getDate]];
    
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc]init];
    timeFormatter.dateFormat = @"HH:mm:ss";
    NSString *time = [timeFormatter stringFromDate: [inf getDate]];
    
    cell.dateLabel.text = [NSString stringWithFormat:@"%@ %@", date,time];
    
    return cell;
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
