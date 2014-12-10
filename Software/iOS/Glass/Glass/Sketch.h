//
//  Sketch.h
//  Glass
//
//  Created by Josh Billions on 12/9/14.
//  Copyright (c) 2014 Catalyze Chicago. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Sketch : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * sketchData;

@end
