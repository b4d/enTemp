//
//  SettingsViewController.m
//  enTemp
//
//  Created by Deni Bacic on 11. 05. 12.
//  Copyright (c) 2012 Kemijski Institut, Ljubljana. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize ip;
@synthesize port;
@synthesize labelVersion;

-(void)viewDidLoad {

    labelVersion.text = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    
    // Read settings 
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults]; 
    
    ip.text = [userDefaults stringForKey:@"ip"];
    port.text = [userDefaults stringForKey:@"port"];
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    gestureRecognizer.cancelsTouchesInView = NO;
    [self.tableView addGestureRecognizer:gestureRecognizer];
}


- (void) hideKeyboard {
    [self.ip resignFirstResponder];
    [self.port resignFirstResponder];
}


- (IBAction)saveSettings:(UIBarButtonItem *)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:ip.text forKey:@"ip"];
    [userDefaults setObject:port.text forKey:@"port"];

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Settings saved!"
                                                    message:@"Settings saved successfully"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
	[alert show];

    
}

- (void)viewDidUnload {
    [self setIp:nil];
    [self setPort:nil];
    [self setLabelVersion:nil];
    [super viewDidUnload];
}


- (IBAction)doneButtonPressed:(UITextField *)sender {
    // Dummy metoda da se zapre keyboard ob pritisku na "Done"
}


@end
