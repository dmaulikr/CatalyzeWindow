//
//  DataManager.m
//  Glass
//
//  Created by Josh Billions on 4/26/15.
//  Copyright (c) 2015 Catalyze Chicago. All rights reserved.
//

#import "DataManager.h"
#import "WatchCoreDataProxy.h"

@implementation DataManager

+(NSManagedObjectContext *)getContext{
    return [[WatchCoreDataProxy sharedInstance] managedObjectContext];
}

+(void)deleteManagedObject:(NSManagedObject *)managedObject{
    [[self getContext] deleteObject:managedObject];
}

+(void)saveManagedContext{
    NSError *error = nil;
    if (![[self getContext] save:&error]) {
        NSLog(@"Unresolved error saving context : %@ - %@", error, error.userInfo);
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SketchSavedNotification" object:nil];
    }
}

@end
