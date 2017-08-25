//
//  SceneCollada.m
//  ChicioSceneKit
//
//  Created by Fabrizio Duroni on 26/09/15.
//  Copyright © 2015 Fabrizio Duroni. All rights reserved.
//

#import "SceneCollada.h"

@interface SceneCollada()

@property (nonatomic, strong) SCNScene *sceneFromCollada;
@property (nonatomic, weak) SCNNode *camera;

@end

@implementation SceneCollada

- (instancetype)init {
    self = [super init];
    if (self) {
        NSString *const ArtFolderRoot = @"art.scnassets";
        NSString *path = [NSString stringWithFormat:@"%@/%@", ArtFolderRoot, @"house"];
        self.sceneFromCollada = [SCNScene sceneNamed:path inDirectory:nil options:nil];
        [self setupCamera];
        [self setupLight];
        [self setupObjects];
    }
    return self;
}

#pragma mark Camera

- (void)setupCamera {
    self.camera = [self.sceneFromCollada.rootNode childNodeWithName:@"Camera" recursively:YES];
    [self.rootNode addChildNode:self.camera];
}

#pragma mark Light

- (void)setupLight {
    [self.sceneFromCollada.rootNode enumerateChildNodesUsingBlock:^(SCNNode * _Nonnull child, BOOL * _Nonnull stop) {
        if([child.name containsString:@"Light"]) {
            [self.rootNode addChildNode:child];
        }
    }];
}

#pragma mark Objects

- (void)setupObjects {
    SCNNode *home = [self.sceneFromCollada.rootNode childNodeWithName:@"home" recursively:YES];
    [self.rootNode addChildNode:home];
    SCNFloor *floor = [SCNFloor floor];
    floor.firstMaterial.diffuse.contents = [SKColor colorWithRed:67.0/255.0 green:100.0/255.0 blue:31.0/255.0 alpha:1.0];
    floor.reflectivity = 0.0;
    SCNNode *floorNode = [SCNNode nodeWithGeometry:floor];
    [self.rootNode addChildNode:floorNode];
    self.background.contents = @[@"right.png", @"left.png", @"up.png", @"down.png", @"back.png", @"front.png"];
    self.camera.constraints = @[[SCNLookAtConstraint lookAtConstraintWithTarget:home]];
}

- (void)actionForOnefingerGestureWithLocation:(CGPoint)location andHitResult:(NSArray *)hitResult {

    CABasicAnimation *moveInFrontAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveInFrontAnimation.duration = 5;
    moveInFrontAnimation.repeatCount = 1;
    moveInFrontAnimation.toValue = [NSValue valueWithSCNVector3:SCNVector3Make(0, 0.5, 15)];
    moveInFrontAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    moveInFrontAnimation.removedOnCompletion = NO;
    moveInFrontAnimation.fillMode = kCAFillModeForwards;
    moveInFrontAnimation.beginTime = 0.0;
    
    CABasicAnimation *moveleftAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveleftAnimation.duration = 5;
    moveleftAnimation.repeatCount = 1;
    moveleftAnimation.toValue = [NSValue valueWithSCNVector3:SCNVector3Make(-6, 0.5, 15)];
    moveleftAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    moveleftAnimation.removedOnCompletion = NO;
    moveleftAnimation.fillMode = kCAFillModeForwards;
    moveleftAnimation.beginTime = 5.0;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    [group setDuration:10.0];
    [group setAnimations:[NSArray arrayWithObjects:moveInFrontAnimation, moveleftAnimation, nil]];
    [self.camera addAnimation:group forKey:nil];    
}

@end
