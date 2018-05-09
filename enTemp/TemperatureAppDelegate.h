//
//  TemperatureAppDelegate.h
//  enTemp
//
//  Created by Deni Bacic on 9. 05. 12.
//  Copyright (c) 2012 Kemijski Institut, Ljubljana. All rights reserved.
//

/*
 Version 2.0:
    - All new iOS7 compatible design
    - Last refresh info in pull down
    - Collaboration with HWgroup
    - Added support for HWgroup cloud system
    - Added support for binary sensors (images and states)
 
 Version 1.3.1:
    - SettingsVC: fixed color of help when selected
    - SettingsVC: keyboard now hides if you click anywhere
    - HelpVC: removed duplicate view for display explanation
    - CreditsVC: minor fixes
    - Removed obsolete images
 
 
 */

#import <UIKit/UIKit.h>
#import "GDataXMLNode.h"

@interface TemperatureAppDelegate : NSObject <UIApplicationDelegate> {
    NSMutableArray *sensors;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSMutableArray *sensors;

@end
