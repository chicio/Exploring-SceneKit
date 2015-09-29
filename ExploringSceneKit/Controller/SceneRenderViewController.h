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

/*!
 Method used to rendere a scene received as paramater.
 
 @param scene the scen to be rendered.
 */
- (void)renderScene:(SCNScene<Scene> *)scene;

@end