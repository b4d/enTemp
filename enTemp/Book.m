//
//  Book.m
//  XML
//
//  Created by iPhone SDK Articles on 11/23/08.
//  Copyright 2008 www.iPhoneSDKArticles.com.
//

#import "Book.h"


@implementation Book

@synthesize ID, Name, Units, Value, Min, Max, Hyst, EmailSMS, State;



- (void) dealloc {
	
	[Value release];
	[Name release];
	[Units release];
	[super dealloc];
}

@end
