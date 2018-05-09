//
//  Sensor.h
//  enTemp
//
//  Created by Deni Bacic on 10. 05. 12.
//  Copyright (c) 2012 Kemijski Institut, Ljubljana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sensor : NSObject {
	
}

@property (nonatomic, readwrite) NSInteger ID;
@property (nonatomic, retain) NSString *Name;
@property (nonatomic, retain) NSString *Senstype; //*
@property (nonatomic, retain) NSString *Units;
@property (nonatomic, retain) NSString *LogPer; //*
@property (nonatomic, retain) NSString *Exp; //*
@property (nonatomic, retain) NSString *Value;
@property (nonatomic, retain) NSString *Min;
@property (nonatomic, retain) NSString *Max;
@property (nonatomic, retain) NSString *Shift; //*
@property (nonatomic, retain) NSString *Hyst;
@property (nonatomic, retain) NSString *Status; //*
@property (nonatomic, retain) NSString *EmailSMS;
@property (nonatomic, retain) NSString *State;
@property (nonatomic, retain) NSString *Alarm;
@property (nonatomic, retain) NSString *Alias; //*
@property (nonatomic, retain) NSString *Description; //*
@property (nonatomic, retain) NSString *Timestamp; //*
@property (nonatomic, retain) NSString *Delay;
@property (nonatomic, retain) NSString *SNMPTrap;
@property (nonatomic, retain) NSString *Type;
@property (nonatomic, retain) NSString *Mode;
@property (nonatomic, retain) NSString *CondInputID;
@property (nonatomic, retain) NSString *Trigger;
@property (nonatomic, retain) NSString *Calib;
@property (nonatomic, retain) NSString *NameOff;
@property (nonatomic, retain) NSString *NameOn;
@property (nonatomic, retain) NSString *Cnt;
@property (nonatomic, retain) NSString *Init;


@end