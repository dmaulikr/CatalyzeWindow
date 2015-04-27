//
//  SavedTableViewController.m
//  Glass
//
//  Created by Josh Billions on 12/9/14.
//  Copyright (c) 2014 Catalyze Chicago. All rights reserved.
//

#import "SavedTableViewController.h"
#import "WatchCoreDataProxy.h"
#import "SketchManager.h"
#import "DataManager.h"
#import "Sketch.h"


@implementation SavedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"SketchSavedNotification" object:nil queue:nil usingBlock:^(NSNotification *note) {
        [self.tableView reloadData];
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Selection

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Sketch *sketch = [[SketchManager sharedInstance] fetchSketches][indexPath.row];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LoadSketchNotification" object:sketch];
}


#pragma mark - Table View Configuration


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[SketchManager sharedInstance] fetchSketches] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Sketch *toBeDeleted = [[SketchManager sharedInstance] fetchSketches][indexPath.row];
        [DataManager deleteManagedObject:(NSManagedObject*)toBeDeleted];
    }
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    //Set Background Color
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.6f];
    [cell setSelectedBackgroundView:bgColorView];
    cell.userInteractionEnabled = YES;
    //Device Data
    Sketch *object = [[SketchManager sharedInstance] fetchSketches][indexPath.row];
    cell.textLabel.text = [[object valueForKey:@"name"] description];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor blackColor];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView reloadData];
}


@end
