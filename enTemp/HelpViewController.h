//
//  HelpViewController.h
//  enTemp
//
//  Created by Deni Bacic on 20. 12. 12.
//  Copyright (c) 2012 Kemijski Institut, Ljubljana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelpViewController : UIViewController <UIScrollViewDelegate> {
    
    BOOL pageControlBeingUsed;
    
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;

- (IBAction)changePage;

@end
