//
//  HelloGaojiceViewController.m
//  HelloGaojice
//
//  Created by gaojice on 12-6-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HelloGaojiceViewController.h"
#import "HelloGaojiceAppDelegate.h"
#import "HttpClient.h"
#import "LatLong.h"

@interface HelloGaojiceViewController ()

@end

@implementation HelloGaojiceViewController

@synthesize logText;
@synthesize locationManager;
@synthesize managedObjectContext;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    self.locationManager=[[CLLocationManager alloc] init];
    self.locationManager.delegate=self;
    self.locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    self.locationManager.distanceFilter=5.0;
    HelloGaojiceAppDelegate *theAppDelegate = (HelloGaojiceAppDelegate*)[UIApplication sharedApplication];
    self.managedObjectContext=theAppDelegate.managedObjectContext;
     
    
       
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
    
    NSLog(@">>start app "); 
    LatLong *person=(LatLong *)[NSEntityDescription insertNewObjectForEntityForName:@"LatLong" inManagedObjectContext:[self managedObjectContext]]; 
    person.latitude=@"张三";
    
    NSError *error;
    
    if (![[self managedObjectContext] save:&error]) { 
        NSLog(@"error!"); 
    }else { 
        NSLog(@"save person ok."); 
    }
    
    NSFetchRequest *request=[[NSFetchRequest alloc] init]; 
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Person" inManagedObjectContext:[self managedObjectContext]]; 
    [request setEntity:entity];
    
    NSArray *results=[[[self managedObjectContext] executeFetchRequest:request error:&error] copy];
    
    for (LatLong *p in results) { 
        NSLog(@">> p.id: %i p.name: %@",p.latitude,p.longitude); 
    }
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    self.logText.text=[@"error" stringByAppendingString:self.logText.text];
}
@end
