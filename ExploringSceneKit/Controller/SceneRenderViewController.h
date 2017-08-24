//
//  GameViewController.h
//  ChicioSceneKit
//

//  Copyright (c) 2015 Fabrizio Duroni. All rights reserved.
//

#import "Scene.h"

@import UIKit;
@import SpriteKit;
@import SceneKit;

@interface SceneRenderViewController : UIViewController <SCNSceneRendererDelegate>

@property (nonatomic, strong) SCNScene<Scene>* scene;

@end
