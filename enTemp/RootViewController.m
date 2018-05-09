//
//  RootViewController.m
//  XML
//
//  Created by iPhone SDK Articles on 11/23/08.
//  Copyright 2008 www.iPhoneSDKArticles.com.
//

#import "RootViewController.h"
#import "XMLAppDelegate.h"
#import "Book.h"
#import "BookDetailViewController.h"

@implementation RootViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [appDelegate.books count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {

        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
	Book *aBook = [appDelegate.books objectAtIndex:indexPath.row];
	
	cell.textLabel.text = aBook.Name;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // Set up the cell
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic -- create and push a new view controller
	
	if(bdvController == nil)
		bdvController = [[BookDetailViewController alloc] initWithNibName:@"BookDetailView" bundle:[NSBundle mainBundle]];
	
	Book *aBook = [appDelegate.books objectAtIndex:indexPath.row];
	
	bdvController.aBook = aBook;
	
	[self.navigationController pushViewController:bdvController animated:YES];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to add the Edit button to the navigation bar.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	appDelegate = (XMLAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	self.title = @"Sensors";
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[bdvController release];
	[appDelegate release];
    [super dealloc];
}


@end

