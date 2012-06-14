//
//  HttpClient.h
//  HelloGaojice
//
//  Created by gaojice on 12-6-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface HttpClient : NSObject
-(void) reportData:(CLLocationCoordinate2D)loc;
@end
