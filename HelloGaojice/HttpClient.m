//
//  HttpClient.m
//  HelloGaojice
//
//  Created by gaojice on 12-6-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HttpClient.h"


@implementation HttpClient
-(void) reportData:(CLLocationCoordinate2D)loc{
    NSString *body=[NSString stringWithFormat:@"http://footspoor.sinaapp.com/foot_mark.php?longitude=%f&latitude=%f",loc.longitude,loc.latitude];
    NSURL* url = [NSURL URLWithString:body];  
    NSMutableURLRequest* request = [NSMutableURLRequest new];  
    [request setURL:url];  
    [request setHTTPMethod:@"GET"]; 
    
    
    NSHTTPURLResponse * response;  
    NSData* data = [NSURLConnection sendSynchronousRequest:request  
                                         returningResponse:&response error:nil];  
    NSString *strRet = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];  
    NSLog(@"%@",strRet); 

}
@end
