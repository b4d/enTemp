//
//  CreditsViewControllerViewController.m
//  enTemp
//
//  Created by Deni Bacic on 14. 05. 12.
//  Copyright (c) 2012 Kemijski Institut, Ljubljana. All rights reserved.
//

#import "CreditsViewControllerViewController.h"

@interface CreditsViewControllerViewController ()

@end

@implementation CreditsViewControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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
