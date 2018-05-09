//
//  XMLParser.m
//  XML
//
//  Created by iPhone SDK Articles on 11/23/08.
//  Copyright 2008 www.iPhoneSDKArticles.com.
//

#import "XMLParser.h"
#import "TemperatureAppDelegate.h"


@implementation XMLParser


- (XMLParser *) initXMLParser {
	
	self = [super init];
	
	appDelegate = (TemperatureAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict {
	
	if (([elementName isEqualToString:@"Devices"]) || ([elementName isEqualToString:@"SenSet"])) { //SenSet
		appDelegate.sensors = [[NSMutableArray alloc] init];
	}
	else if (([elementName isEqualToString:@"Sensor"]) || ([elementName isEqualToString:@"Entry"])) { //Entry
		aSensor = [[Sensor alloc] init];
		aSensor.ID = [[attributeDict objectForKey:@"ID"] integerValue];
		
		//NSLog(@"Reading id value :%i", aSensor.ID);
	}
	
//	NSLog(@"Processing Element: %@", elementName);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string { 
	if(!currentElementValue) 
		currentElementValue = [[NSMutableString alloc] initWithString:[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
	else
		[currentElementValue appendString:[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
//	NSLog(@"Processing Value: %@", currentElementValue);
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if (([elementName isEqualToString:@"Root"]) || ([elementName isEqualToString:@"val:Root"])) // val:Root
		return;
	
	if (([elementName isEqualToString:@"Sensor"]) || ([elementName isEqualToString:@"Entry"])) { // entry
		[appDelegate.sensors addObject:aSensor];
		aSensor = nil;
	}
	else 
		[aSensor setValue:currentElementValue forKey:elementName];
    

	currentElementValue = nil;
}



@end
