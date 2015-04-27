//
//  WatchCoreDataProxy.h
//  WatchCoreDataProxy
//
//  Created by Josh Billions on 4/26/15.
//  Copyright (c) 2015 Catalyze Chicago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "SketchManager.h"
#import "DataManager.h"
#import "Sketch.h"
//! Project version number for WatchCoreDataProxy.
FOUNDATION_EXPORT double WatchCoreDataProxyVersionNumber;

//! Project version string for WatchCoreDataProxy.
FOUNDATION_EXPORT const unsigned char WatchCoreDataProxyVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <WatchCoreDataProxy/PublicHeader.h>
@interface WatchCoreDataProxy : NSObject

+(WatchCoreDataProxy*)sharedInstance;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end