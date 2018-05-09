//
//  BookDetailViewController.m
//  XML
//
//  Created by iPhone SDK Articles on 11/23/08.
//  Copyright 2008 www.iPhoneSDKArticles.com.
//

#import "BookDetailViewController.h"
#import "Book.h"

@implementation BookDetailViewController

@synthesize aBook;




// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = aBook.Name;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[tableView reloadData];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1; //3
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1; //1
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
	switch(indexPath.section)
	{
		case 0:
			cell.textLabel.text = [aBook.Value stringByAppendingString:aBook.Units];
			break;
	//	case 1:
	//		cell.textLabel.text = aBook.Units;
	//		break;
	//	case 2:
	//		cell.textLabel.text = aBook.Value;
	//		break;
	}
	
	return cell;
}

- (NSString *)tableView:(UITableView *)tblView titleForHeaderInSection:(NSInteger)section {
	
	NSString *sectionName = nil;
	
	switch(section)
	{
		case 0:
			sectionName = [NSString stringWithString:@"Value"];
			break;
		//case 1:
		//	sectionName = [NSString stringWithString:@"Units"];
		//	break;
		//case 2:
		//	sectionName = [NSString stringWithString:@"Value"];
		//	break;
	}
	
	return sectionName;
}

- (void)dealloc {
	
	[aBook release];
	[tableView release];
    [super dealloc];
}


@end
