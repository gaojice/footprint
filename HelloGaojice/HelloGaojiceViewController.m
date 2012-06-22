//
//  HelloGaojiceViewController.m
//  HelloGaojice
//
//  Created by gaojice on 12-6-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HelloGaojiceViewController.h"
#import "HttpClient.h"

@interface HelloGaojiceViewController ()

@end

@implementation HelloGaojiceViewController

@synthesize logText;
@synthesize locationManager;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    self.locationManager=[[CLLocationManager alloc] init];
    self.locationManager.delegate=self;
    self.locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    self.locationManager.distanceFilter=5.0;
    
       
}

- (void)viewDidUnload
{
    [self setLogText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)refresh:(id)sender {
   
    
    UISegmentedControl *button=(UISegmentedControl*) sender;
    NSString *log=[NSString stringWithFormat:@"\n配置更新：%d",button.selectedSegmentIndex];
    self.logText.text=[log stringByAppendingString:self.logText.text];
    
    
    switch (button.selectedSegmentIndex) {
        case 0:
            [self.locationManager stopMonitoringSignificantLocationChanges];
            [self.locationManager stopUpdatingLocation];
            break;
        case 1:
            [self.locationManager stopUpdatingLocation];
            [self.locationManager startMonitoringSignificantLocationChanges];
            break;
        case 2:
            [self.locationManager stopMonitoringSignificantLocationChanges];
            [self.locationManager startUpdatingLocation];
            break;
        default:
            break;
    }
 
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    
    CLLocationCoordinate2D loc = [newLocation coordinate];
    NSString *lat =[NSString stringWithFormat:@"%f",loc.latitude];//get latitude
    NSString *lon =[NSString stringWithFormat:@"%f",loc.longitude];//get longitude
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    
    NSString *stringFromDate = [formatter stringFromDate:newLocation.timestamp];
    self.logText.text=stringFromDate;    

    HttpClient *client=[[HttpClient alloc] init];
    [client reportData:loc];
    self.logText.text=[[NSString stringWithFormat:@"\n%@,%@,%@",lat,lon,stringFromDate] stringByAppendingString:self.logText.text];
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    self.logText.text=[@"error" stringByAppendingString:self.logText.text];
}
@end
