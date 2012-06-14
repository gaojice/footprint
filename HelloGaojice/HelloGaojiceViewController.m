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
@synthesize label1;
@synthesize label2;
@synthesize label3;
@synthesize location;
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
    [self setLabel1:nil];
    [self setLabel2:nil];
    [self setLabel3:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)refresh:(id)sender {
   
    [self.locationManager startUpdatingLocation];
 
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    location=newLocation;
    CLLocationCoordinate2D loc = [newLocation coordinate];
    NSString *lat =[NSString stringWithFormat:@"%f",loc.latitude];//get latitude
    NSString *lon =[NSString stringWithFormat:@"%f",loc.longitude];//get longitude
    self.label1.text=lat;
    self.label2.text=lon;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    
    NSString *stringFromDate = [formatter stringFromDate:newLocation.timestamp];
    self.label3.text=stringFromDate;    


    NSLog(@"%@,%@,%@",lat,lon,stringFromDate);
    HttpClient *client=[[HttpClient alloc] init];
    [client reportData:loc];

}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    printf("error");
}
@end
