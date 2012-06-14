//
//  HelloGaojiceViewController.h
//  HelloGaojice
//
//  Created by gaojice on 12-6-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface HelloGaojiceViewController : UIViewController <CLLocationManagerDelegate>
- (IBAction)refresh:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (nonatomic,strong)CLLocationManager *locationManager;
@property (nonatomic)CLLocation *location;

@end
