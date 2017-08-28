//
//  SceneFactory.h
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26/09/15.
//

#import "ExploringSceneKit-Swift.h"

@import Foundation;
@import SceneKit;

@interface SceneFactory : NSObject

+ (SCNScene<Scene> *)makeScene:(NSInteger)sceneId;

@end
