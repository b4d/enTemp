//
//  DetailsVC.m
//  enTemp
//
//  Created by Deni Bacic on 16. 09. 13.
//  Copyright (c) 2013 Kemijski Institut, Ljubljana. All rights reserved.
//

#import "DetailsVC.h"


@interface DetailsVC ()

@end

@implementation DetailsVC

@synthesize sensor, labelAlarm, labelDescription, labelGroup, labelLastUpdate,
            labelMinMax, labelState, labelUnits, labelValue, imageIcon, labelType;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidUnload {
    sensor = nil;
    self.imageIcon = nil;
//    labelAlarm = nil;
//    labelDescription = nil;
//    labelGroup = nil;
//    labelLastUpdate = nil;
//    labelMinMax = nil;
//    labelState = nil;
//    labelUnits = nil;
//    labelValue = nil;

}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    if (sensor.Alias != nil)
        self.navigationItem.title = sensor.Alias;
    else
        self.navigationItem.title = sensor.Name;
    
    if ([sensor.State integerValue] == 0)
        labelState.text = @"Unknown";
    else if ([sensor.State integerValue] == 1)
        labelState.text = @"OK";
    else if ([sensor.State integerValue] == 2)
        labelState.text = @"Sensor invalid";
    else if ([sensor.State integerValue] == 3)
        labelState.text = @"Device invalid";
    else if ([sensor.State integerValue] == 4)
        labelState.text = @"Out Of Range Low";
    else if ([sensor.State integerValue] == 5)
        labelState.text = @"Out of Range High";
    
    labelMinMax.text = [NSString stringWithFormat:@"%@ - %@", sensor.Min, sensor.Max];
    
    labelAlarm.text = sensor.Alarm;
    
    labelLastUpdate.text = sensor.Timestamp;
    
    labelDescription.text = sensor.Description;
    
    imageIcon.image = [self changeColorForImage:[self iconType:sensor.Units] toColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1]];

    
    labelValue.text = sensor.Value;
    
    if (([sensor.Units isEqualToString:@"F"]) || [sensor.Units isEqualToString:@"C"] )
        labelUnits.text = [@"°" stringByAppendingString:sensor.Units];
    else
        labelUnits.text = sensor.Units;
    
    labelType.text = sensor.Senstype;
    
}

- (UIImage *) changeColorForImage:(UIImage *)image toColor:(UIColor*)color {
    // http://compileyouidontevenknowyou.blogspot.com/2010/12/change-colors-of-uiimage-using-uicolor.html
    
    UIGraphicsBeginImageContext(image.size);
    
    CGRect contextRect;
    contextRect.origin.x = 0.0f;
    contextRect.origin.y = 0.0f;
    contextRect.size = [image size];
    // Retrieve source image and begin image context
    CGSize itemImageSize = [image size];
    CGPoint itemImagePosition;
    itemImagePosition.x = ceilf((contextRect.size.width - itemImageSize.width) / 2);
    itemImagePosition.y = ceilf((contextRect.size.height - itemImageSize.height) );
    
    UIGraphicsBeginImageContext(contextRect.size);
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    // Setup shadow
    // Setup transparency layer and clip to mask
    CGContextBeginTransparencyLayer(c, NULL);
    CGContextScaleCTM(c, 1.0, -1.0);
    CGContextClipToMask(c, CGRectMake(itemImagePosition.x, -itemImagePosition.y, itemImageSize.width, -itemImageSize.height), [image CGImage]);
    // Fill and end the transparency layer
    
    
    const float* colors = CGColorGetComponents( color.CGColor );
    CGContextSetRGBFillColor(c, colors[0], colors[1], colors[2], 1); // .75 ta zadnja v originalu
    
    //NSLog(@"%f - %f - %f",colors[0], colors[1], colors[2]);
    
    contextRect.size.height = -contextRect.size.height;
    contextRect.size.height -= 15;
    CGContextFillRect(c, contextRect);
    CGContextEndTransparencyLayer(c);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (UIImage *) iconType:(NSString *)Units {
    // Glede na enoto v vrednosti, doloci tip ikone
    
    if ([Units isEqualToString:@"C"])
        return [UIImage imageNamed:@"temperature@2x"];
    else if ([Units isEqualToString:@"F"])
        return [UIImage imageNamed:@"temperature@2x"];
    else if ([Units isEqualToString:@"%RH"])
        return [UIImage imageNamed:@"humidity@2x"];
    else if ([Units isEqualToString:@"s"])
        return [UIImage imageNamed:@"time@2x"];
    else if ([Units isEqualToString:@"DP C"])
        return [UIImage imageNamed:@"dewpoint@2x"];
    else if ([Units isEqualToString:@"kPa"])
        return [UIImage imageNamed:@"pressure@2x"];
    else if ([Units isEqualToString:@"V"])
        return [UIImage imageNamed:@"voltage@2x"];
    else if ([Units isEqualToString:@"mV"])
        return [UIImage imageNamed:@"voltage@2x"];
    else if ([Units isEqualToString:@"mA"])
        return [UIImage imageNamed:@"current@2x"];
    else if ([Units isEqualToString:@""])
        return [UIImage imageNamed:@"binary@2x"];
    
    return [UIImage imageNamed:@"gauge@2x"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end