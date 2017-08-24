//
//  SceneTableViewController.m
//  ChicioSceneKit
//
//  Created by Fabrizio Duroni on 25/09/15.
//  Copyright © 2015 Fabrizio Duroni. All rights reserved.
//

#import "SceneRenderViewController.h"
#import "SceneTableViewController.h"

@interface SceneTableViewController ()

@property (nonatomic, strong) NSArray *sceneNames;
@property (nonatomic, strong) SceneFactory *sceneFactory;
@property (nonatomic, assign) NSInteger sceneSelected;

@end

@implementation SceneTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:false];
    self.sceneNames = @[@"Scene Balls", @"Scene Collada", @"Scene Physically based"];
    self.sceneFactory = [SceneFactory new];
}

#pragma mark TableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sceneNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sceneNameCellIdentifier"
                                                            forIndexPath:indexPath];
    cell.textLabel.text = [self.sceneNames objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.sceneSelected = indexPath.row;
    [self performSegueWithIdentifier:@"renderSegue" sender:self];
}

#pragma mark Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SceneRenderViewController *sceneRenderViewController = (SceneRenderViewController *)segue.destinationViewController;
    sceneRenderViewController.scene = [self.sceneFactory makeScene:self.sceneSelected];
}

@end
