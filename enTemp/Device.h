//
//  Device.h
//  enTemp
//
//  Created by Deni Bacic on 18. 09. 13.
//  Copyright (c) 2013 Kemijski Institut, Ljubljana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Device : NSObject

@property (nonatomic, retain) NSString *Name;
@property (nonatomic, retain) NSMutableArray *groups;

@end
