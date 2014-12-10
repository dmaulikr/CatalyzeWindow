//
//  ViewController.m
//  Glass
//
//  Created by Josh Billions on 12/9/14.
//  Copyright (c) 2014 Catalyze Chicago. All rights reserved.
//

#import "ViewController.h"
#import "MSGridView.h"
#import "HRSampleColorPickerViewController.h"
#import "NetworkManager.h"

@interface ViewController () <MSGridViewDelegate, MSGridViewDataSource, HRColorPickerViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.gridView.gridViewDelegate = self;
    self.gridView.gridViewDataSource = self;
    self.selectedColor = [UIColor whiteColor];
    [[self gridView] setInnerSpacing:CGSizeMake(0,0)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark gridView datasource methods


-(MSGridViewCell *)cellForIndexPath:(NSIndexPath*)indexPath inGridWithIndexPath:(NSIndexPath *)gridIndexPath;
{
    
    static NSString *reuseIdentifier = @"cell";
    MSGridViewCell *cell = [MSGridView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if(cell == nil) {
        cell = [[MSGridViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:reuseIdentifier];
    }
    
    cell.backgroundColor = [UIColor darkGrayColor];
    
    cell.layer.borderColor = [UIColor blackColor].CGColor;
    cell.layer.borderWidth = 1;
    return cell;
    
}

-(NSUInteger)numberOfGridRows{
    return 1;
}

-(NSUInteger)numberOfGridColumns{
    return 2;
}


-(NSUInteger)numberOfColumnsForGridAtIndexPath:(NSIndexPath*)indexPath{
    return 16;
}

-(NSUInteger)numberOfRowsForGridAtIndexPath:(NSIndexPath*)indexPath{
    return 6;
}
 
 -(float)heightForCellRowAtIndex:(NSUInteger)row forGridAtIndexPath:(NSIndexPath *)gridIndexPath{
     return 40.0f;
 }

-(float)widthForCellColumnAtIndex:(NSUInteger)column forGridAtIndexPath:(NSIndexPath *)gridIndexPath{
    return 20.0f;
}



-(void)didSelectCellWithIndexPath:(NSIndexPath*) indexPath
{
    int row = (int)[indexPath indexAtPosition:2];
    int column;
    if ([indexPath indexAtPosition:1] == 1) {
        column = (int)[indexPath indexAtPosition:3] + 16;
    }else{
        column = (int)[indexPath indexAtPosition:3];
    }
    NSLog(@"%@", indexPath);
    NSLog(@"Row: %i \tColumn: %i", row, column);
    MSGridViewCell *cell = [self.gridView cellAtIndexPath:indexPath];
    cell.backgroundColor = self.selectedColor;
    const CGFloat* colors = CGColorGetComponents( self.selectedColor.CGColor );
    CGFloat red = colors[0] * 255;
    CGFloat green = colors[1] * 255;
    CGFloat blue = colors[2] * 255;
    NSString *outgoingMessage = [NSString stringWithFormat:@"%i,%i,%i,%i,%i", (int)column, (int)row, (int)red, (int)green, (int)blue];
    [[NetworkManager sharedInstance] sendMessage:outgoingMessage];
}

-(IBAction)resetAll:(id)sender{
    for(NSIndexPath *indexPath in [[self.gridView gridCells] allKeys]){
        MSGridViewCell *cell = [self.gridView cellAtIndexPath:indexPath];
        cell.backgroundColor = [UIColor blackColor];
    }
    [[NetworkManager sharedInstance] sendMessage:@"r!"];
}

-(IBAction)toggleMarch:(id)sender{
    [[NetworkManager sharedInstance] sendMessage:@"am!1000"];
}



@end
