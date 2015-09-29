//
//  Scene.h
//  ChicioSceneKit
//
//  Created by Fabrizio Duroni on 26/09/15.
//  Copyright © 2015 Fabrizio Duroni. All rights reserved.
//

@import Foundation;
@import UIKit;

@protocol Scene <NSObject>

@required
- (void)setupCamera;
- (void)setupLight;
- (void)setupObjects;
- (void)actionForOnefingerGestureWithLocation:(CGPoint)location andHitResult:(NSArray *)hitResult;

@optional
- (void)actionForTwofingerGesture;

@end