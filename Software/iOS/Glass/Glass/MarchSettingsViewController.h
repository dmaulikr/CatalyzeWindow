//
//  MarchSettingsViewController.h
//  Glass
//
//  Created by Josh Billions on 12/10/14.
//  Copyright (c) 2014 Catalyze Chicago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarchSettingsViewController : UIViewController

@property (nonatomic, assign) IBOutlet UISlider *speedSlider;
@property (nonatomic, assign) IBOutlet UILabel *speedLabel;

-(IBAction)toggleMarch:(id)sender;
-(IBAction)speedSliderChanged:(id)sender;
@end
