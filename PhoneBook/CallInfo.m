//
//  CallInfo.m
//  PhoneBook
//
//  Created by Eugene Gusev on 24.04.16.
//  Copyright © 2016 Eugene Gusev. All rights reserved.
//

#import "CallInfo.h"
#import "Contact.h"

@implementation CallInfo

-(id)initWithContact:(Contact *) cont Date:(NSDate *) date {
    self.contact = cont;
    self.dateOfCall = date;
    return self;
}

-(Contact *)getContact {
    return self.contact;
}

-(NSDate *)getDate {
    return self.dateOfCall;
}
@end
