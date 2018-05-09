//
//  Book.h
//  XML
//
//  Created by iPhone SDK Articles on 11/23/08.
//  Copyright 2008 www.iPhoneSDKArticles.com.
//

#import <UIKit/UIKit.h>


@interface Book : NSObject {
	
	NSInteger ID;
	NSString *Name;	//Same name as the Entity Name.
	NSString *Units;	//Same name as the Entity Name.
	NSString *Value;	//Same name as the Entity Name.
    NSString *Min;	//Same name as the Entity Name.
    NSString *Max;	//Same name as the Entity Name.
    NSString *Hyst;	//Same name as the Entity Name.
    NSString *EmailSMS;	//Same name as the Entity Name.
    NSString *State;	//Same name as the Entity Name.
	
}

@property (nonatomic, readwrite) NSInteger ID;
@property (nonatomic, retain) NSString *Name;
@property (nonatomic, retain) NSString *Units;
@property (nonatomic, retain) NSString *Value;
@property (nonatomic, retain) NSString *Min;
@property (nonatomic, retain) NSString *Max;
@property (nonatomic, retain) NSString *Hyst;
@property (nonatomic, retain) NSString *EmailSMS;
@property (nonatomic, retain) NSString *State;

@end
