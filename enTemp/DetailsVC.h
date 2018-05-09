//
//  DetailsVC.h
//  enTemp
//
//  Created by Deni Bacic on 16. 09. 13.
//  Copyright (c) 2013 Kemijski Institut, Ljubljana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sensor.h"

@interface DetailsVC : UITableViewController


@property (nonatomic,strong) Sensor *sensor;
@property (weak, nonatomic) IBOutlet UILabel *labelGroup;
@property (weak, nonatomic) IBOutlet UILabel *labelMinMax;
@property (weak, nonatomic) IBOutlet UILabel *labelState;
@property (weak, nonatomic) IBOutlet UILabel *labelAlarm;
@property (weak, nonatomic) IBOutlet UILabel *labelLastUpdate;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelUnits;
@property (weak, nonatomic) IBOutlet UILabel *labelValue;
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;
@property (weak, nonatomic) IBOutlet UILabel *labelType;

@end
