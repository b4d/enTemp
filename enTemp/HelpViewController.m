//
//  HelpViewController.m
//  enTemp
//
//  Created by Deni Bacic on 20. 12. 12.
//  Copyright (c) 2012 Kemijski Institut, Ljubljana. All rights reserved.
//

#import "HelpViewController.h"

@implementation HelpViewController

@synthesize scrollView, pageControl;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Definiramo izgled StatusBar-a in ozadje tabele
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:YES];
    self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];

	
	pageControlBeingUsed = NO;
	
	NSArray *colors = [NSArray arrayWithObjects:[UIColor colorWithPatternImage:[UIImage imageNamed:@"help2"]], [UIColor colorWithPatternImage:[UIImage imageNamed:@"help3"]],  nil];
	for (int i = 0; i < colors.count; i++) {
		CGRect frame;
		frame.origin.x = self.scrollView.frame.size.width * i;
		frame.origin.y = 0;
		frame.size = self.scrollView.frame.size;
		
		UIView *subview = [[UIView alloc] initWithFrame:frame];
		subview.backgroundColor = [colors objectAtIndex:i];
		[self.scrollView addSubview:subview];

	}
	
	self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * colors.count, 200);
	
	self.pageControl.currentPage = 0;
	self.pageControl.numberOfPages = colors.count;
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
	if (!pageControlBeingUsed) {
		// Switch the indicator when more than 50% of the previous/next page is visible
		CGFloat pageWidth = self.scrollView.frame.size.width;
		int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
		self.pageControl.currentPage = page;
	}
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
	pageControlBeingUsed = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	pageControlBeingUsed = NO;
}

- (IBAction)changePage {
	// Update the scroll view to the appropriate page
	CGRect frame;
	frame.origin.x = self.scrollView.frame.size.width * self.pageControl.currentPage;
	frame.origin.y = 0;
	frame.size = self.scrollView.frame.size;
	[self.scrollView scrollRectToVisible:frame animated:YES];
	
	// Keep track of when scrolls happen in response to the page control
	// value changing. If we don't do this, a noticeable "flashing" occurs
	// as the the scroll delegate will temporarily switch back the page
	// number.
	pageControlBeingUsed = YES;
}
@end
