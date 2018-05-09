//
//  CreditsViewControllerViewController.m
//  enTemp
//
//  Created by Deni Bacic on 14. 05. 12.
//  Copyright (c) 2012 Kemijski Institut, Ljubljana. All rights reserved.
//

#import "CreditsViewController.h"

@interface CreditsViewController ()

@end

@implementation CreditsViewController
@synthesize scrollView;


- (void)viewDidLoad
{
    
    [super viewDidLoad];

    
}

- (void)viewDidUnload
{

    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
