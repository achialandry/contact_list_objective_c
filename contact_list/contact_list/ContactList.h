//
//  ContactList.h
//  contact_list
//
//  Created by Landry Achia Ndong on 2018-04-22.
//  Copyright © 2018 Landry Achia Ndong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactList : NSObject

# pragma mark - Public properties
@property NSMutableArray *contactList;

# pragma mark - Public properties
-(instancetype)initContactListWithContacts:(NSMutableArray *)contacts;

-(void)addContact:(Contact *)newContact;

-(void)listContacts:(NSMutableArray *)allContact;

@end
