//
//  SettingsViewController.h
//  enTemp
//
//  Created by Deni Bacic on 11. 05. 12.
//  Copyright (c) 2012 Kemijski Institut, Ljubljana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsViewController : UITableViewController


@property (strong, nonatomic) IBOutlet UITextField *ip;
@property (strong, nonatomic) IBOutlet UITextField *port;
@property (strong, nonatomic) IBOutlet UILabel *labelVersion;


// Dummy metoda da se zapre keyboard ob pritisku na "Done"
- (IBAction)doneButtonPressed:(UITextField *)sender;

@end
