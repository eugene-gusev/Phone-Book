//
//  Contact.h
//  PhoneBook
//
//  Created by Eugene Gusev on 13.04.16.
//  Copyright © 2016 Eugene Gusev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Contact : NSObject<NSCoding> {
    NSString *firstName;
    NSString *lastName;
    NSString *email;
    NSString *phoneNumber;
    NSString *address;
    NSString *imageURL;
}

@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) NSString *imageURL;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *phoneNumber;
@property (nonatomic, retain) NSString *address;

-(id)initWithFirstName:(NSString *)fname LastName:(NSString *)lname PhoneNumber:(NSString*)phone ImageUrl:(NSString *)url Email:(NSString*)email Address:(NSString*)address;

@end
