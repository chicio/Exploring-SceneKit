//
//  SceneSelectionProtocol.h
//  ChicioSceneKit
//
//  Created by Fabrizio Duroni on 26/09/15.
//  Copyright © 2015 Fabrizio Duroni. All rights reserved.
//

@import Foundation;

@protocol SceneSelection <NSObject>

/*!
 Method used to send to a delegate the scene selected.
 
 @param sceneName sceneName the name of the scene selected.
 */
- (void)sceneSelected:(int)sceneId;

@end