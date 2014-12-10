//
//  ContainerViewController.m
//  Glass
//
//  Created by Josh Billions on 12/9/14.
//  Copyright (c) 2014 Catalyze Chicago. All rights reserved.
//

#import "ContainerViewController.h"
#import "Sketch.h"
#import "NetworkManager.h"
#import "AppDelegate.h"

@interface ContainerViewController () <UIAlertViewDelegate>

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"LoadSketchNotification" object:nil queue:nil usingBlock:^(NSNotification *note) {
        [[self navigationController] popToRootViewControllerAnimated:YES];
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)saveNewSketch:(id)sender{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Name Your Awesome Sketch!" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Save", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        //Save the sketch
        NSManagedObjectContext *context = [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
        Sketch *newSketch = [NSEntityDescription insertNewObjectForEntityForName:@"Sketch" inManagedObjectContext:context];
        newSketch.name = [[alertView textFieldAtIndex:0] text];
        newSketch.sketchData = [[NetworkManager sharedInstance] mostRecentMatrix];
        NSError *error = nil;
        if (![context save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SketchSavedNotification" object:nil];
    }
}

@end
