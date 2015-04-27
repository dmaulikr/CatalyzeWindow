//
//  DataManager.h
//  Glass
//
//  Created by Josh Billions on 4/26/15.
//  Copyright (c) 2015 Catalyze Chicago. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DataManager : NSObject

+(NSManagedObjectContext*)getContext;
+(void)deleteManagedObject:(NSManagedObject*)managedObject;
+(void)saveManagedContext;

@end
