//
//  MarchSettingsViewController.m
//  Glass
//
//  Created by Josh Billions on 12/10/14.
//  Copyright (c) 2014 Catalyze Chicago. All rights reserved.
//

#import "MarchSettingsViewController.h"
#import "NetworkManager.h"

@interface MarchSettingsViewController (){
    NSUInteger _xCounter;
    NSUInteger _yCounter;
    NSUInteger _rCounter;
    NSUInteger _gCounter;
    NSUInteger _bCounter;
    
    NSUInteger _spectrumXCounter;
    NSUInteger _spectrumYCounter;
    NSUInteger _spectrumRCounter;
    NSUInteger _spectrumGCounter;
    NSUInteger _spectrumBCounter;
}

@property (nonatomic, strong) NSTimer *playgroundTimer;

-(void)incrementPlayground;

@end

@implementation MarchSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NetworkManager sharedInstance] askForAutomarchSettingsWithCompletionHandler:^(bool automarchState, NSNumber *automarchSpeed) {
        [self.speedSlider setValue:automarchSpeed.floatValue/1000];
    }];
    [self speedSliderChanged:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)toggleMarch:(id)sender{
    NSString *command = [NSString stringWithFormat:@"am!%i", (int)self.speedSlider.value*1000];
    [[NetworkManager sharedInstance] sendMessage:command];
}

-(void)speedSliderChanged:(id)sender{
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    [nf setMaximumFractionDigits:1];
    [nf setMinimumFractionDigits:1];
    [nf setMinimumIntegerDigits:1];
    self.speedLabel.text = [NSString stringWithFormat:@"%@s", [nf stringFromNumber:[NSNumber numberWithFloat:self.speedSlider.value]]];
}

-(void)playgroundTapped:(id)sender{
    if (self.playgroundTimer) {
        [self.playgroundTimer invalidate];
        self.playgroundTimer = nil;
    }else{
        self.playgroundTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(randomScan) userInfo:nil repeats:YES];
    }
}

-(void)incrementPlayground{
    NSString *message = [NSString stringWithFormat:@"%lu,%lu,%i,%i,%i", (unsigned long)_xCounter, _yCounter, arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255)];
    [[NetworkManager sharedInstance] sendMessage:message];
    
    NSLog(@"Sent message: %@", message);
    
    if (_xCounter >= 32) {
        _xCounter = 0;
        _yCounter++;
    }else{
        _xCounter++;
    }
    
    if (_yCounter >= 6) {
        _yCounter = 0;
    }
}

-(void)randomScan{
    NSString *message = [NSString stringWithFormat:@"%lu,%lu,%i,%i,%i", (unsigned long)_xCounter, _yCounter, arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255)];
//    [[NetworkManager sharedInstance] sendMessage:message];
    
    NSLog(@"Sent message: %@", message);
    
    if (_xCounter >= 32) {
        _xCounter = 0;
        _yCounter++;
    }else{
        _xCounter++;
    }
    
    if (_yCounter >= 6) {
        _yCounter = 0;
    }
}

-(void)spectrumScan{

}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
