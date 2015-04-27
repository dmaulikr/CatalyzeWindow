//
//  SketchManager.m
//  Glass
//
//  Created by Josh Billions on 4/26/15.
//  Copyright (c) 2015 Catalyze Chicago. All rights reserved.
//

#import "SketchManager.h"
#import "DataManager.h"
#import "WatchCoreDataProxy.h"
#import "Sketch.h"

@interface SketchManager () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation SketchManager

static SketchManager *sharedInstance = nil;

+ (SketchManager *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SketchManager alloc] init];
    });
    return sharedInstance;
}

-(void)createSketchWithName:(NSString *)name data:(NSString *)sketchData{
    NSManagedObjectContext *context = [DataManager getContext];
    Sketch *newSketch = [NSEntityDescription insertNewObjectForEntityForName:@"Sketch" inManagedObjectContext:context];
    newSketch.name = name;
    newSketch.sketchData = sketchData;
    [DataManager saveManagedContext];
}

-(void)deleteSketch:(Sketch *)soonToBeGoneSketch{
    [DataManager deleteManagedObject:soonToBeGoneSketch];
}

-(NSArray *)fetchSketches{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Sketch"];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    NSError *fetchError = nil;
    NSArray *fetched = [[DataManager getContext] executeFetchRequest:fetchRequest error:&fetchError];
    if (!fetchError && fetched) {
        return fetched;
    }else{
        return nil;
    }
}

@end