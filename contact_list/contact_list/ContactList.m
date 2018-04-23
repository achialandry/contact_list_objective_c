//
//  ContactList.m
//  contact_list
//
//  Created by Landry Achia Ndong on 2018-04-22.
//  Copyright © 2018 Landry Achia Ndong. All rights reserved.
//

#import "ContactList.h"
#import "Contact.h"

@implementation ContactList

-(instancetype)initContactListWithContacts:(NSMutableArray *)contacts{
    
    self = [super init];
    if (self) {
        self.contactList = contacts;
    }
    return self;
}

-(void)addContact:(Contact *)newContact{
    [self.contactList addObject:newContact];
}

-(void)listContacts:(NSMutableArray <Contact*>*)allContact{
    for (int i = 0; i<[allContact count]; i++) {
        NSLog(@"%d:<%@> ()", i, allContact[i].userName);
    }
}
@end
