//
//  SketchManager.h
//  Glass
//
//  Created by Josh Billions on 4/26/15.
//  Copyright (c) 2015 Catalyze Chicago. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Sketch;

@interface SketchManager : NSObject

+(SketchManager*)sharedInstance;

-(void)createSketchWithName:(NSString *)name data:(NSString*)sketchData;
-(void)deleteSketch:(Sketch*)soonToBeGoneSketch;

-(NSArray*)fetchSketches;

@end
