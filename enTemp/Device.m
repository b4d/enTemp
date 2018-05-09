//
//  Device.m
//  enTemp
//
//  Created by Deni Bacic on 18. 09. 13.
//  Copyright (c) 2013 Kemijski Institut, Ljubljana. All rights reserved.
//

#import "Device.h"

@implementation Device

@synthesize Name,groups;

-(id)init {
    return [self initWithName:@"name" groups:nil];
}

-(id)initWithName:(NSString *)name groups:(NSMutableArray *)groups1{
    self = [super init];
    if (self) {
        self.Name = name;
        self.groups = groups1;
    }
    return self;
}

@end
