//
//  SceneTableViewController.m
//  ChicioSceneKit
//
//  Created by Fabrizio Duroni on 25/09/15.
//  Copyright © 2015 Fabrizio Duroni. All rights reserved.
//

#import "SceneTableViewController.h"

@interface SceneTableViewController ()

/// Array that contains the name of the various scenes.
@property (nonatomic, strong) NSArray *sceneNames;

@end

@implementation SceneTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //Load scene names.
    self.sceneNames = @[@"Scene Balls", @"Scene Collada"];
}

#pragma mark Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.sceneNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sceneNameCellIdentifier"
                                                            forIndexPath:indexPath];
    
    // Set scene name in cell.
    cell.textLabel.text = [self.sceneNames objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Get the row selected: it corresponds to the id of the scene.
    [self.delegate sceneSelected:(int)indexPath.row];
}

@end