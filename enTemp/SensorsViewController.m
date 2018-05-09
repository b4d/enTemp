//
//  SensorsViewController.m
//  enTemp
//
//  Created by Deni Bacic on 10. 05. 12.
//  Copyright (c) 2012 Kemijski Institut, Ljubljana. All rights reserved.
//

#import "SensorsViewController.h"
#import "Sensor.h"
#import "TemperatureAppDelegate.h"
#import "XMLParser.h"
#import "DetailsVC.h"

@interface SensorsViewController ()

@end

@implementation SensorsViewController
@synthesize sensors, groups;






- (void)refreshData {
    
    // Read settings 
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *ip = [userDefaults stringForKey:@"ip"];
    NSString *port = [userDefaults stringForKey:@"port"];
    
    if (ip == NULL) {
        //[userDefaults setObject:@"192.168.65.24" forKey:@"ip"];
        [userDefaults setObject:@"poseidon.hwg.cz" forKey:@"ip"];
        [userDefaults setObject:@"80" forKey:@"port"];
    }
    
    ip = [userDefaults stringForKey:@"ip"];
    port = [userDefaults stringForKey:@"port"];

    // START PARSING
    
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://%@:%@/values.xml",ip,port]];
    //NSURL *url = [[NSURL alloc] initWithString:@"http://193.2.14.82:8088/values.xml"];
//    NSURL *url = [[NSURL alloc] initWithString:@"http://192.168.65.240:8088/values.xml"];
    //NSURL *url  = [[NSURL alloc] initWithString:@"http://poseidon.hwg.cz/values.xml"];
//    NSURL *url  = [[NSURL alloc] initWithString:@"http://www.sensdesk.com/cs/user/75/values.xml"];
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    
	
	XMLParser *parser = [[XMLParser alloc] initXMLParser];
	[xmlParser setDelegate:parser];
	BOOL success = [xmlParser parse];
	
	if(success)
		NSLog(@"No Errors");
	else {
        [self performSelectorOnMainThread:@selector(alertConnectionError)
                               withObject:@"Error!"
                            waitUntilDone:YES];
    }


    
    [[self tableView] reloadData];
    
}

// PullToRefresh method, do not remove
- (void)refresh {
    
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Refreshing data..."];
    
    // actual refresh
    [self performSelector:@selector(refreshData) withObject:nil afterDelay:0.1];

    [self performSelector:@selector(stopRefresh) withObject:nil afterDelay:1];
}

- (void)stopRefresh{
    
    // set title to last refresh time/date
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, h:mm:ss a"];
    NSString *lastUpdated = [NSString stringWithFormat:@"Last updated on %@", [formatter stringFromDate:[NSDate date]]];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated];
    
    [self.refreshControl endRefreshing];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate = (TemperatureAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    colorRed = [UIColor colorWithRed:255/255.0f
                               green:102/255.0f
                                blue:102/255.0f
                               alpha:1.0f];
    colorLightGray = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1];
    colorOrange = [UIColor colorWithRed:255/255.0f
                                  green:153/255.0f
                                   blue:51/255.0f
                                  alpha:1.0f];
    

    // Pull to refresh
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self
                       action:@selector(refresh)
             forControlEvents:UIControlEventValueChanged];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    refreshControl.tintColor = colorLightGray;
    self.refreshControl = refreshControl;

    self.parentViewController.view.backgroundColor = [UIColor colorWithRed:239/255.0f
                                                                     green:239/255.0f
                                                                      blue:244/255.0f
                                                                     alpha:1.0f];
    self.tableView.backgroundColor = [UIColor colorWithRed:239/255.0f
                                                     green:239/255.0f
                                                      blue:244/255.0f
                                                     alpha:1.0f];
    
    [self.navigationController.navigationBar setTintColor:[UIColor lightGrayColor]];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:239/255.0f
                                                                             green:239/255.0f
                                                                              blue:244/255.0f
                                                                             alpha:1.0f]];
    
    [self refreshData];
    [[self tableView] reloadData];

}


- (void)viewDidUnload {

    [self setSensors:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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

- (UIColor *) colorOut:(double)value2 min:(double)min max:(double)max  {
    // Normalizira, potem pa doloci barvo ikone glede na vrednost
    
    if ((min == 1) || (max == 1)) {
        if (value2 == 1)
            return colorLightGray;
        else
            return colorRed;
    }
    if ((min == 0) || (max == 0)) {
        if (value2 == 0)
            return colorLightGray;
        else
            return colorRed;
    }
    
    double value;
    if ((max-min)!=0)
        value = (value2-min)/(max-min); //normaliziraj
    else
        return colorLightGray;
    
    //NSLog(@"%f", value);
    if (value <= 0 )
        return colorRed;
    else if ((value > 0 ) && (value <= 0.2 ))
        return colorOrange;
    else if ((value > 0.2 ) && (value <= 0.8 ))
        return colorLightGray;
    else if ((value > 0.7 ) && (value <= 1 ))
        return colorOrange;
    else if (value > 1 )
        return colorRed;
    return colorLightGray; //whiteColor, ta prava, problemi glede definicije...
    //lightGrayColor ima vse komponente 0.6
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


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([appDelegate.sensors count] != 0)
        return [appDelegate.sensors count];
    else
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SensorCell"];
	
//    UILabel *groupLabel = (UILabel *)[cell viewWithTag:105];
    UILabel *unitLabel = (UILabel *)[cell viewWithTag:104];
	UILabel *nameLabel = (UILabel *)[cell viewWithTag:103];
	UILabel *valueLabel = (UILabel *)[cell viewWithTag:102];
	UIImageView * stateImageView = (UIImageView *)[cell viewWithTag:101];

	Sensor *aSensor = [appDelegate.sensors objectAtIndex:indexPath.row];

    
    UIColor *barva = [self colorOut:[aSensor.Value doubleValue]
                                min:[aSensor.Min   doubleValue]
                                max:[aSensor.Max   doubleValue]];

    stateImageView.image = [self changeColorForImage:[self iconType:aSensor.Units] toColor:barva];
    
    if (aSensor.Alias != nil)
        nameLabel.text = aSensor.Alias;
    else
        nameLabel.text = aSensor.Name;
    
//    nameLabel.text = aSensor.Name;
    
    
    valueLabel.text = aSensor.Value;
//    rangeLabel.text = [NSString stringWithFormat: @"%@ - %@", aSensor.Min,aSensor.Max];
//    groupLabel.text = aSensor.Group;
    
    if (([aSensor.Units isEqualToString:@"F"]) || [aSensor.Units isEqualToString:@"C"] )
        unitLabel.text = [@"°" stringByAppendingString:aSensor.Units];
    else
        unitLabel.text = aSensor.Units;
    
    if ([aSensor.Units isEqualToString:@""]) {
        if ([aSensor.Value isEqualToString:@"1"])
            valueLabel.text = @"ON";
        else if ([aSensor.Value isEqualToString:@"0"])
            valueLabel.text = @"OFF";
    }
    
    nameLabel.textColor = barva;
    valueLabel.textColor = barva;
    unitLabel.textColor = barva;

    return cell;
}

//- (void)tableView:(UITableView *)tableView
//didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self performSegueWithIdentifier:@"details" sender:self];
////indexPath.row
//}



-(void) alertConnectionError {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Connection error!"
                                                    message: @"Check your connection settings and try again"
                                                   delegate: nil
                                          cancelButtonTitle: @"OK"
                                          otherButtonTitles: nil];
    [alert show];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Sensor *sensor = [appDelegate.sensors objectAtIndex:indexPath.row];
        
        DetailsVC *detailView = [segue destinationViewController];
        detailView.sensor = sensor;

    }
}
//- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
//{
//    [self performSegueWithIdentifier:@"GroupToGroupMembers" sender:self];
//}


@end
