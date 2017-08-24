//
//  SceneFactory.m
//  ChicioSceneKit
//
//  Created by Fabrizio Duroni on 26/09/15.
//  Copyright © 2015 Fabrizio Duroni. All rights reserved.
//

#import "Scene.h"
#import "SceneBalls.h"
#import "SceneCollada.h"
#import "ScenePhysicallyBased.h"
#import "SceneFactory.h"

@implementation SceneFactory

/*!
 Method used to create a scene based on the name
 received as parameter.
 
 @param sceneName the name of the scene to be created.
 */
- (SCNScene<Scene> *)makeScene:(NSInteger)sceneId {
    
    switch (sceneId) {
        case 0:
            return [[SceneBalls alloc]init];
        case 1:
            return [[SceneCollada alloc]init];
        case 2:
            return [[ScenePhysicallyBased alloc]init];
        default:
            return [[SceneBalls alloc]init];
    }
}

@end
