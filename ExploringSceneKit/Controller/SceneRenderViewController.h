//
//  GameViewController.h
//  ChicioSceneKit
//
//  Copyright (c) 2015 Fabrizio Duroni. All rights reserved.
//

#import "ExploringSceneKit-Swift.h"

@import UIKit;
@import SpriteKit;
@import SceneKit;

@interface SceneRenderViewController : UIViewController <SCNSceneRendererDelegate>

@property (nonatomic, strong) SCNScene<Scene>* scene;

@end
