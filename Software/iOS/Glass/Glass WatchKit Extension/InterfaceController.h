//
//  InterfaceController.h
//  Glass WatchKit Extension
//
//  Created by Josh Billions on 4/26/15.
//  Copyright (c) 2015 Catalyze Chicago. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

@property (nonatomic, assign) IBOutlet WKInterfaceTable *table;

- (IBAction)resetAll;

@end
