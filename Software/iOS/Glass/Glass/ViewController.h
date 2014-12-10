//
//  ViewController.h
//  Glass
//
//  Created by Josh Billions on 12/9/14.
//  Copyright (c) 2014 Catalyze Chicago. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MSGridView;

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet MSGridView *gridView;

@property (nonatomic, strong) UIColor *selectedColor;

-(IBAction)resetAll:(id)sender;
-(IBAction)flipMatrix:(id)sender;

@end

