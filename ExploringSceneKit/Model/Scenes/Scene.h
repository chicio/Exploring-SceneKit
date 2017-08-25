//
//  Scene.h
//  ChicioSceneKit
//
//  Created by Fabrizio Duroni on 26/09/15.
//

@import Foundation;
@import UIKit;

@protocol Scene <NSObject>

@required
- (void)actionForOnefingerGestureWithLocation:(CGPoint)location andHitResult:(NSArray *)hitResult;

@optional
- (void)actionForTwofingerGesture;

@end
