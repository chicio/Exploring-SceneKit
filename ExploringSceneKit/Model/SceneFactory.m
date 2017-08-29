//
//  SceneFactory.m
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26/09/15.
//

#import "SceneFactory.h"

@implementation SceneFactory

+ (SCNScene<Scene> *)makeScene:(NSInteger)sceneId {
    
    switch (sceneId) {
        case 0:
            return [[BlinnPhongScene alloc] init];
        case 1:
            return [[ColladaScene alloc]init];
        case 2:
            return [[PhysicallyBasedScene alloc] init];
        default:
            return [[BlinnPhongScene alloc] init];
    }
}

@end
