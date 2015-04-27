//
//  InterfaceController.m
//  Glass WatchKit Extension
//
//  Created by Josh Billions on 4/26/15.
//  Copyright (c) 2015 Catalyze Chicago. All rights reserved.
//

#import "InterfaceController.h"
#import "NetworkManager.h"
#import "WatchCoreDataProxy.h"
#import "TableRowController.h"

@interface InterfaceController()

@property (nonatomic, strong) NSArray *testElementsList;

@end


@implementation InterfaceController

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.testElementsList = @[@{@"label":@"Test1"}];
        [self loadTableData];
    }
    
    return self;
}

- (void)awakeWithContext:(id)context {
    NSLog(@"%@ awake with context: %@", self, context);
}

- (void)willActivate {
    // This method is called when the controller is about to be visible to the wearer.
    NSLog(@"%@ will activate", self);
    [self loadTableData];
}

- (void)didDeactivate {
    // This method is called when the controller is no longer visible.
    NSLog(@"%@ did deactivate", self);
}

- (void)handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)localNotification {
    NSLog(@"Handle action with identifier (Local): %@", identifier);
}

- (void)handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)remoteNotification {
    NSLog(@"Handle action with identifier (Remote): %@", identifier);
}

//- (void)handleUserActivity:(NSDictionary *)userInfo {
//    // Use data from the userInfo dictionary passed in to push to the appropriate controller with detailed info.
//    [self pushControllerWithName:userInfo[@"controllerName"] context:userInfo[@"detailInfo"]];
//}


- (IBAction)resetAll {
    [[NetworkManager sharedInstance] sendMessage:@"r!"];
}

- (void)loadTableData {
    [self.table setNumberOfRows:[[[SketchManager sharedInstance] fetchSketches] count] withRowType:@"default"];
    
    [[[SketchManager sharedInstance] fetchSketches] enumerateObjectsUsingBlock:^(Sketch *sketch, NSUInteger idx, BOOL *stop) {
        TableRowController *row = [self.table rowControllerAtIndex:idx];
        [row.rowLabel setText:sketch.name];
    }];
}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    Sketch *sketch = [[SketchManager sharedInstance] fetchSketches][rowIndex];
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"LoadSketchNotification" object:sketch];
    [[NetworkManager sharedInstance] sendMessage:@"r!"];
    NSArray *sketchData = [sketch.sketchData componentsSeparatedByString:@"\n"];
    for(NSString *line in sketchData){
        NSArray *lineArray = [line componentsSeparatedByString:@","];
        if([lineArray count] == 5){
            NSString *outgoingMessage = [NSString stringWithFormat:@"%@,%@,%@,%@,%@", lineArray[0], lineArray[1], lineArray[2], lineArray[3], lineArray[4]];
            [[NetworkManager sharedInstance] sendMessage:outgoingMessage];
        }
    }
}

//- (void)loadTableRows {
//    [self.table setNumberOfRows:self.testElementsList.count withRowType:@"default"];
//    
//    // Create all of the table rows.
//    [self.testElementsList enumerateObjectsUsingBlock:^(NSDictionary *rowData, NSUInteger idx, BOOL *stop) {
//        TableRowController *elementRow = [self.table rowControllerAtIndex:idx];
//        [elementRow.rowLabel setText:rowData[@"label"]];
//    }];
//}

@end



