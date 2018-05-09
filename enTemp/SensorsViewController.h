//
//  SensorsViewController.h
//  enTemp
//
//  Created by Deni Bacic on 10. 05. 12.
//  Copyright (c) 2012 Kemijski Institut, Ljubljana. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "PullRefreshTableViewController.h"

@class TemperatureAppDelegate;

@interface SensorsViewController : UITableViewController  {
    TemperatureAppDelegate *appDelegate;
    
    UIColor *colorOrange;
    UIColor *colorRed;
    UIColor *colorLightGray;
}


@property (nonatomic, strong) NSMutableArray *sensors;
@property (nonatomic, strong) NSMutableArray *groups;


@end
