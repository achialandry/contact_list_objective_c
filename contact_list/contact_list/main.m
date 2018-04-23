//
//  main.m
//  contact_list
//
//  Created by Landry Achia Ndong on 2018-04-20.
//  Copyright © 2018 Landry Achia Ndong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        //expected user answers local variables
        NSString *answerOne = @"new";
        NSString *answerTwo = @"list";
        NSString *answerThree = @"show";
        NSString *answerBonusTwo = @"find";
        NSString *answerBonusThree = @"history";
        NSString *answerFour = @"quit";
        
        int option = -1;
        
        
        NSMutableArray *userContacts = [[NSMutableArray alloc] init];
        NSMutableArray *userHistory = [NSMutableArray arrayWithCapacity:3];
        
        //instantiating ContactList Class
        ContactList *contactList = [[ContactList alloc] initContactListWithContacts:userContacts];
      
        do {
            
            NSString *userInput = [InputCollector inputForPrompt:@"What would you like to do next?\n"
                                   "new - Create a new contact\n"
                                   "list - List all contacts\n"
                                   "show - Show all contacts\n"
                                   "find - Search a contact\n"
                                   "history - History on app\n"
                                   "quit - Exit Application\n" ];
            
            //converting all user input to lower case
            NSString *finalUserInput = [userInput lowercaseString];
            
            
            
            if([finalUserInput isEqualToString:answerOne]){
                option = 1;
            }
            else if([finalUserInput isEqualToString:answerTwo]){
                option = 2;
            }
            else if([finalUserInput isEqualToString:answerThree]){
                option = 3;
            }else if ([finalUserInput isEqualToString:answerFour]){
                option = 0;
            }else if ([finalUserInput isEqualToString:answerBonusTwo]){
                option = 4;
            }else if ([finalUserInput isEqualToString:answerBonusThree]){
                option = 9;
            }else{
                option = 5;
            }
            
            switch (option) {
                case 1:
                {
                    
                    //instantiating Contact Class
                    Contact *contactInfo = [[Contact alloc] init];
                    NSString *userEmail = [InputCollector inputForPrompt:@"Input your Email\n"];
                    NSString *email = [userEmail lowercaseString];
                    NSString *validateEmail = @"@";
                    NSString *userName;
                   
                    int check = 0;
                    if ([userContacts count] == 0) {
                        //setting values to variables in contact class
                        if ([email containsString:validateEmail]) {
                            [contactInfo setEmail:email];
                            userName = [InputCollector inputForPrompt:@"Input your Name\n"];
                            [contactInfo setUserName:userName];
                            [contactList addContact:contactInfo];
                        }else{
                            NSLog(@"Invalid Email, be sure to enter a valid email");
                        }
                        
                       
                    }
                    
                    for (int i=0; i<[userContacts count]; i++) {
                            if ([email isEqualToString:[userContacts[i] email]]) {
                                check = 1;
                                break;
                            }
                        }
                    if ([userContacts count] >0) {
                        switch (check) {
                            case 1:
                                NSLog(@"Sorry email has been taken already, use another email");
                                break;
                            case 0:
                                if ([email containsString:validateEmail]) {
                                    [contactInfo setEmail:userEmail];
                                    userName = [InputCollector inputForPrompt:@"Input your First Name\n"];
                                    [contactInfo setUserName:userName];
                                    [contactList addContact:contactInfo];
                                }else{
                                    NSLog(@"Invalid Email, be sure to enter a valid email");
                                }
                                
                                break;
                            default:
                                break;
                        }
                    }
                    [userHistory addObject:finalUserInput];
                    break;
                }
                case 2:
                {
                    NSLog(@"The result is: %lu", (unsigned long)[userContacts count]);
                    [contactList listContacts:userContacts];
                    [userHistory addObject:finalUserInput];
                    break;
                }
                case 3:
                {
                    NSString *userDetails = [InputCollector inputForPrompt:@"Input index of contact to display details: "];
                    int indexCode = [userDetails intValue];
                    
                    if (indexCode < [userContacts count]) {
                        NSLog(@"Full name: %@\nEmail: %@", [userContacts[indexCode] userName],[userContacts[indexCode] email] );
                        
                    } else {
                        NSLog(@"Not Found");
                    }
                    [userHistory addObject:finalUserInput];
                    break;
                }
                case 4:
                {
                    NSString *userFind = [InputCollector inputForPrompt:@"Type name or email to search a contact: "];
                    NSString *searchString = [userFind lowercaseString];
                    for (int i=0; i<[userContacts count]; i++) {
                        
                        if ([searchString isEqualToString:[userContacts[i] userName]] || [searchString isEqualToString:[userContacts[i] email]]) {
                            NSLog(@"User Details: %@\n%@",[userContacts[i] userName], [userContacts[i] email] );
                        }else if(([[userContacts[i] userName]  rangeOfString:searchString options:NSCaseInsensitiveSearch].location != NSNotFound)  || ([[userContacts[i] email]  rangeOfString:searchString options:NSCaseInsensitiveSearch].location != NSNotFound)){
                            NSLog(@"User Details: %@\n%@",[userContacts[i] userName], [userContacts[i] email]);
                        }
                    }
                    [userHistory addObject:finalUserInput];
                    break;
                }
                case 5:
                    NSLog (@"\n Invalid Input!!!... \n");
                    [userHistory addObject:finalUserInput];
                    break;
                case 9:
                {
                    NSUInteger valIndex = [userHistory count];
                     int j=1;
                    for (int i=6; i>3; i--) {
                        NSLog(@"Your History: %d, %@", j, userHistory[valIndex-1]);
                        valIndex --;
                        j++;
                    }
                    [userHistory addObject:finalUserInput];
                    break;
                }
                case 0:
                    NSLog(@"Exiting Application: Adieu....");
                    return 0;
                default:
                    NSLog (@"\n Invalid Input!!!... \n");
                    break;
            }
        } while (option != 0);
        
    }
    return 0;
}
