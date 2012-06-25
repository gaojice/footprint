//
//  LatLong.h
//  HelloGaojice
//
//  Created by gaojice on 12-6-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface LatLong : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber * latitude;
@property (nonatomic, retain) NSDecimalNumber * longitude;
@property (nonatomic, retain) NSDate * recordTime;
@property (nonatomic, retain) NSDate * uploadTime;

@end
