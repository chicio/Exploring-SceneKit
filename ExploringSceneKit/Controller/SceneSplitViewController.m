//
//  SceneSplitViewController.m
//  ChicioSceneKit
//
//  Created by Fabrizio Duroni on 25/09/15.
//  Copyright © 2015 Fabrizio Duroni. All rights reserved.
//

#import "SceneFactory.h"
#import "SceneRenderViewController.h"
#import "SceneTableViewController.h"
#import "SceneSplitViewController.h"

@interface SceneSplitViewController ()

/// Factory used to create scene based on selection.
@property (nonatomic, strong) SceneFactory *sceneFactory;
/// Reference to the SceneRenderViewController (detail of the SpitViewController).
@property (nonatomic, weak) SceneRenderViewController *sceneRenderviewController;

@end

@implementation SceneSplitViewController

- (void)viewDidLoad {
 
    [super viewDidLoad];
    
    //Setup scene factory.
    self.sceneFactory = [[SceneFactory alloc]init];
    
    //Set the delegate of the SceneTableViewController to the self (SplitViewController).
    UINavigationController *navigationController = (UINavigationController *)self.viewControllers[0];
    SceneTableViewController *sceneTableViewController = (SceneTableViewController *)navigationController.topViewController;
    sceneTableViewController.delegate = self;
    
    //Get a reference to the SceneRendereViewController.
    self.sceneRenderviewController = self.viewControllers[1];
}

#pragma mark Scene selection delegate

- (void)sceneSelected:(int)sceneId {
    
    NSLog(@"Scene %d", sceneId);

    //Create scene based on id selected.
    SCNScene<Scene> *scene = [self.sceneFactory makeScene:sceneId];
    
    //Set scene in SceneRenderViewController.
    [self.sceneRenderviewController renderScene:scene];
}

@end