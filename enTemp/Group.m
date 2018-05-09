//
//  Group.m
//  enTemp
//
//  Created by Deni Bacic on 18. 09. 13.
//  Copyright (c) 2013 Kemijski Institut, Ljubljana. All rights reserved.
//

#import "Group.h"

@implementation Group

@synthesize Name,Description,Alias,ID,sensors,Key;


-(id)init {
    return [self initWithName:@"name" sensors:nil];
}

-(id)initWithName:(NSString *)name sensors:(NSMutableArray *)sensors1{
    self = [super init];
    if (self) {
        self.Name = name;
        self.sensors = sensors1;
    }
    return self;
}


@end
