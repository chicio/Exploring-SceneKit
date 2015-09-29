//
//  GameViewController.m
//  ChicioSceneKit
//
//  Created by Fabrizio Duroni on 19/09/15.
//  Copyright (c) 2015 Fabrizio Duroni. All rights reserved.
//

#import "Scene.h"
#import "SceneBalls.h"
#import "SceneCollada.h"
#import "SceneRenderViewController.h"

@interface SceneRenderViewController()

/// Scene View.
@property (strong, nonatomic) IBOutlet SCNView *sceneView;
/// Scene to be rendered (it is the same assigne to sceneView).
@property (weak, nonatomic) SCNScene<Scene>* scene;

@end

@implementation SceneRenderViewController 

- (void)viewDidLoad {
    
    [super viewDidLoad];
  
    [self setupGestures];
}

#pragma mark Render

- (void)renderScene:(SCNScene<Scene> *)scene {
    
    //Stop the previous scene
    [self.sceneView stop:nil];
    
    self.sceneView.scene = scene;
    self.sceneView.scene.physicsWorld.gravity = SCNVector3Make(0, -9.8, 0);
    self.sceneView.scene.physicsWorld.speed = 2.0;
    self.sceneView.showsStatistics = YES;
    self.sceneView.backgroundColor = [UIColor blackColor];
    self.sceneView.delegate = self;
    
    self.scene = scene;
}

#pragma mark Gestures

- (void)setupGestures {
    
    //Setup getsure recognizer
    UITapGestureRecognizer *oneFingerGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(oneFingerGesture:)];
    oneFingerGesture.numberOfTapsRequired = 1;
    oneFingerGesture.numberOfTouchesRequired = 1;
    
    //Setup gesture double tap
    UITapGestureRecognizer *twoFingerGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(twoFingerGesture:)];
    twoFingerGesture.numberOfTapsRequired = 1;
    twoFingerGesture.numberOfTouchesRequired = 2;

    //Setup gesture tap with two finger
    self.sceneView.gestureRecognizers = @[oneFingerGesture, twoFingerGesture];
}

- (void)oneFingerGesture:(UITapGestureRecognizer *)tapGestureRecognizer {
    
    CGPoint location = [tapGestureRecognizer locationInView:self.sceneView];
    NSArray *hitResult = [self.sceneView hitTest:location options:nil];
 
    //Manage gesture.
    [self.scene actionForOnefingerGestureWithLocation:location andHitResult:hitResult];
}

- (void)twoFingerGesture:(UITapGestureRecognizer *)tapGestureRecognizer {

    // If the scene support gesture with two fingers, manage it.
    if([self.scene respondsToSelector:@selector(actionForTwofingerGesture)]) {
        [self.scene actionForTwofingerGesture];
    }    
}

@end