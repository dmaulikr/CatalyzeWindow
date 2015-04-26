//
//  InterfaceController.m
//  Glass WatchKit Extension
//
//  Created by Josh Billions on 4/26/15.
//  Copyright (c) 2015 Catalyze Chicago. All rights reserved.
//

#import "InterfaceController.h"
#import "NetworkManager.h"

@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


- (IBAction)resetAll {
    [[NetworkManager sharedInstance] sendMessage:@"r!"];
}

@end


