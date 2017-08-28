//
//  SceneTableViewController.m
//  ChicioSceneKit
//
//  Created by Fabrizio Duroni on 25/09/15.
//

#import "SceneFactory.h"
#import "SceneRenderViewController.h"
#import "SceneTableViewController.h"

@interface SceneTableViewController ()

@property (nonatomic, strong) NSArray *sceneNames;
@property (nonatomic, assign) NSInteger sceneSelected;

@end

@implementation SceneTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sceneNames = @[@"Scene Blinn Phong", @"Scene Collada", @"Scene Physically based"];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:false];
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
    sceneRenderViewController.scene = [SceneFactory makeScene:self.sceneSelected];
}

@end
