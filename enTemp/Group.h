//
//  Group.h
//  enTemp
//
//  Created by Deni Bacic on 18. 09. 13.
//  Copyright (c) 2013 Kemijski Institut, Ljubljana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject

@property (nonatomic, retain) NSString *ID;
@property (nonatomic, retain) NSString *Key;
@property (nonatomic, retain) NSString *Name;

@property (nonatomic, retain) NSString *Alias; //*
@property (nonatomic, retain) NSString *Description;
@property (nonatomic, retain) NSMutableArray *sensors;

@end
