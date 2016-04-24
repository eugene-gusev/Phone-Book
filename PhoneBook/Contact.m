//
//  Contact.m
//  PhoneBook
//
//  Created by Eugene Gusev on 13.04.16.
//  Copyright © 2016 Eugene Gusev. All rights reserved.
//

#import "Contact.h"

@implementation Contact
@synthesize firstName,lastName,phoneNumber,address,imageURL,email;

-(id)initWithFirstName:(NSString *)fname LastName:(NSString *)lname PhoneNumber:(NSString*)phone ImageUrl:(NSString *)url Email:(NSString*)em Address:(NSString*)ad {
    self.firstName = fname;
    self.lastName = lname;
    self.phoneNumber = phone;
    self.email = em;
    self.address = ad;
    self.imageURL = url;
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if( self )
    {
        self.firstName = [aDecoder decodeObjectForKey:@"firstName"];
        self.lastName = [aDecoder decodeObjectForKey:@"lastName"];
        self.phoneNumber = [aDecoder decodeObjectForKey:@"phoneNumber"];
        self.imageURL = [aDecoder decodeObjectForKey:@"imageURL"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.address = [aDecoder decodeObjectForKey:@"address"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:firstName forKey:@"firstName"];
    [encoder encodeObject:lastName forKey:@"lastName"];
    [encoder encodeObject:phoneNumber forKey:@"phoneNumber"];
    [encoder encodeObject:imageURL forKey:@"imageURL"];
    [encoder encodeObject:email forKey:@"email"];
    [encoder encodeObject:address forKey:@"address"];
}



@end
