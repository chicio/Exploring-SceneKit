//
//  SceneFactory.h
//  ChicioSceneKit
//
//  Created by Fabrizio Duroni on 26/09/15.
//  Copyright © 2015 Fabrizio Duroni. All rights reserved.
//

#import "Scene.h"

@import Foundation;
@import SceneKit;

@interface SceneFactory : NSObject

- (SCNScene<Scene> *)makeScene:(NSInteger)sceneId;

@end
