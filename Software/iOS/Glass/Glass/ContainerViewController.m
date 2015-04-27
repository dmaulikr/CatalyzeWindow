//
//  ContainerViewController.m
//  Glass
//
//  Created by Josh Billions on 12/9/14.
//  Copyright (c) 2014 Catalyze Chicago. All rights reserved.
//

#import "ContainerViewController.h"
#import "NetworkManager.h"
#import "AppDelegate.h"
#import "WatchCoreDataProxy.h"

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
        [[SketchManager sharedInstance] createSketchWithName:[[alertView textFieldAtIndex:0] text]  data:[[NetworkManager sharedInstance] mostRecentMatrix]];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SketchSavedNotification" object:nil];
    }
}

@end
