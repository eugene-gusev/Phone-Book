//
//  AddContactViewController.m
//  PhoneBook
//
//  Created by Eugene Gusev on 17.04.16.
//  Copyright © 2016 Eugene Gusev. All rights reserved.
//

#import "AddContactViewController.h"
#import "Contact.h"

@interface AddContactViewController ()

@end

@implementation AddContactViewController

@synthesize firstname,lastname,phone,address,email,delegate,imageUrl,contact;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (contact != nil) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectoryPath = [paths objectAtIndex:0];
        
        self.firstname.text = contact.firstName;
        self.lastname.text = contact.lastName;
        self.address.text = contact.address;
        self.email.text = contact.email;
        self.phone.text = contact.phoneNumber;
        self.image.image = [UIImage imageWithContentsOfFile: [documentsDirectoryPath stringByAppendingPathComponent:contact.imageURL]];
        
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender {
    if ((![self.firstname.text isEqual:@""] || ![self.lastname.text  isEqual: @""]) && ![self.phone.text isEqual:@""]) {
        NSString *imgName = nil;
        if (self.image.image != nil) {
            
            NSString * documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            imgName = [NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970]];
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSString *writablePath = [documentsDirectoryPath stringByAppendingPathComponent:imgName];
            
            //получить уникальное имя файла
            if(![fileManager fileExistsAtPath:writablePath]){
                int check = 1;
                while (check) {
                    imgName = [NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970]];
                    writablePath = [documentsDirectoryPath stringByAppendingPathComponent:imgName];
                    if(![fileManager fileExistsAtPath:writablePath]){
                        check = 0;
                    }
                }
            }
            
            NSData *imageData = UIImageJPEGRepresentation(self.image.image,1);
            NSError *error = nil;
            [imageData writeToFile:[documentsDirectoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", imgName]] options:NSAtomicWrite error:&error];
            if (error) {
                NSLog(@"Error Writing File : %@",error);
            }
            else {
                imgName = [NSString stringWithFormat:@"%@.jpg",imgName];
            }
        }
        
        
        Contact * cont = [[Contact alloc] initWithFirstName:self.firstname.text
                                                      LastName:self.lastname.text
                                                   PhoneNumber:self.phone.text
                                                      ImageUrl:imgName
                                                         Email:self.email.text
                                                       Address:self.address.text];
        [self.delegate setContact:self enteringContact:cont];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}

- (IBAction)selectPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.image.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
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
