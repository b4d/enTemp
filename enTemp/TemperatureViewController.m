//
//  TemperatureViewController.m
//  enTemp
//
//  Created by Deni Bacic on 9. 05. 12.
//  Copyright (c) 2012 Kemijski Institut, Ljubljana. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()

@end

@implementation TemperatureViewController
@synthesize navigationBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view, typically from a nib.
    //self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    //[[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    //[self.navigationController setNavigationBarHidden:NO animated:YES];
    
    

    
}

- (void)viewDidUnload
{
    [self setNavigationBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
