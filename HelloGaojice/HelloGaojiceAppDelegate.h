//
//  HelloGaojiceAppDelegate.h
//  HelloGaojice
//
//  Created by gaojice on 12-6-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloGaojiceAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;  
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;  
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;  


- (void)saveContext;  
- (NSURL *)applicationDocumentsDirectory;

@end
