//
//  ParserCloud.m
//  enTemp
//
//  Created by Deni Bacic on 18. 09. 13.
//  Copyright (c) 2013 Kemijski Institut, Ljubljana. All rights reserved.
//

#import "ParserCloud.h"
#import "Sensor.h"
#import "Group.h"
#import "Device.h"
#import "GDataXMLNode.h"

@implementation ParserCloud

+(NSString *)dataFilePath:(BOOL)forSave {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths lastObject];
    NSString *documentsPath = [documentsDirectory stringByAppendingPathComponent:@"Values.xml"];
    if (forSave || [[NSFileManager defaultManager] fileExistsAtPath:documentsPath]) {
        return documentsPath;
    } else {
        return [[NSBundle mainBundle] pathForResource:@"Party" ofType:@"xml"];
    }
}

+(Device *) loadDevice {
    
    NSString *filePath = [self dataFilePath:NO];
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData
                                                           options:0 error:&error];
    if (doc == nil) {
        return nil;
    }
    
    Device *device = [[Device alloc] init];
    
    NSArray *deviceMembers = [doc.rootElement elementsForName:@"Device"];
    
    for (GDataXMLElement *deviceMember in deviceMembers) {
        NSString *name;
        
        
        // Name
        NSArray *names = [deviceMember elementsForName:@"Name"];
        
        if (names.count > 0) {
            GDataXMLElement *firstName = (GDataXMLElement *) [names objectAtIndex:0];
            name = firstName.stringValue;
            NSLog(@"%@", name);
        } else continue;
    }
    
    
    return device;
    
    
}

+(void) saveDevice:(Device *)device {
    
}


@end
