//
//  CallInfo.h
//  PhoneBook
//
//  Created by Eugene Gusev on 24.04.16.
//  Copyright © 2016 Eugene Gusev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface CallInfo : NSObject

@property (nonatomic, retain) NSDate * dateOfCall;
@property (nonatomic, strong) Contact * contact;

-(id)initWithContact:(Contact *) cont Date:(NSDate *) date;

-(Contact *)getContact;

-(NSDate *)getDate;
@end
