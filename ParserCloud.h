//
//  ParserCloud.h
//  enTemp
//
//  Created by Deni Bacic on 18. 09. 13.
//  Copyright (c) 2013 Kemijski Institut, Ljubljana. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Device;

@interface ParserCloud : NSObject
+(Device *) loadDevice;
+(void) saveDevice:(Device *) device;
@end
