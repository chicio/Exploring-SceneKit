//
//  Scene.m
//  ChicioSceneKit
//
//  Created by Fabrizio Duroni on 26/09/15.
//  Copyright © 2015 Fabrizio Duroni. All rights reserved.
//

#import "SceneBalls_old.h"

@interface SceneBalls_old()

@property (nonatomic, strong) SCNNode *sphere;

@end

@implementation SceneBalls_old

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupCamera];
        [self setupLight];
        [self setupObjects];
    }
    return self;
}

#pragma mark Camera

- (void)setupCamera {
    
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.camera = [SCNCamera camera];
    cameraNode.camera.automaticallyAdjustsZRange = YES;
    cameraNode.position = SCNVector3Make(0, 80, 100);
    cameraNode.rotation = SCNVector4Make(1, 0, 0, -M_PI_4);
    [self.rootNode addChildNode:cameraNode];
}

#pragma mark Light

- (void)setupLight {
    
    //Setup light
    SCNNode *lightNode = [SCNNode node];
    lightNode.light = [SCNLight light];
    lightNode.light.type = SCNLightTypeOmni;
    lightNode.light.color = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    lightNode.position = SCNVector3Make(0, 50, 10);
    [self.rootNode addChildNode:lightNode];
    
    //Setup ambient light
    SCNNode *ambientLightNode = [SCNNode node];
    ambientLightNode.light = [SCNLight light];
    ambientLightNode.light.type = SCNLightTypeAmbient;
    ambientLightNode.light.color = [UIColor darkGrayColor];
    [self.rootNode addChildNode:ambientLightNode];
}

#pragma mark Objects

- (void)setupObjects {
    
    //Setup floor
    SCNFloor *floor = [SCNFloor floor];
    floor.firstMaterial.diffuse.contents = @"floor.jpg";
    SCNNode *floorNode = [SCNNode nodeWithGeometry:floor];
    floorNode.physicsBody = [SCNPhysicsBody kinematicBody];
    floorNode.position = SCNVector3Make(0, 0, 0);
    [self.rootNode addChildNode:floorNode];
    
    //Setup box
    SCNNode *box = [SCNNode node];
    box.geometry = [SCNBox boxWithWidth:10 height:10 length:10 chamferRadius:0.2];
    box.geometry.firstMaterial.diffuse.contents = @"marble1.jpg";
    box.position = SCNVector3Make(0, 5, 0);
    box.rotation = SCNVector4Make(0, 1, 0, 0.5);
    box.physicsBody = [SCNPhysicsBody dynamicBody];
    [self.rootNode addChildNode:box];
    
    box = [SCNNode node];
    box.geometry = [SCNBox boxWithWidth:10 height:10 length:10 chamferRadius:0.2];
    box.geometry.firstMaterial.diffuse.contents = @"marble2.jpg";
    box.position = SCNVector3Make(-5, 5, 0);
    box.rotation = SCNVector4Make(0, 1, 0, 0.5);
    box.physicsBody = [SCNPhysicsBody dynamicBody];
    [self.rootNode addChildNode:box];
    
    box = [SCNNode node];
    box.geometry = [SCNBox boxWithWidth:10 height:10 length:10 chamferRadius:0.2];
    box.geometry.firstMaterial.diffuse.contents = @"marble3.jpg";
    box.position = SCNVector3Make(-5, 10, 0);
    box.rotation = SCNVector4Make(0, 1, 0, 0.5);
    box.physicsBody = [SCNPhysicsBody dynamicBody];
    [self.rootNode addChildNode:box];
    
    //Setup sphere
    self.sphere = [SCNNode node];
    self.sphere.geometry = [SCNSphere sphereWithRadius:10];
    self.sphere.geometry.firstMaterial.diffuse.contents = @"pool.jpg";
    self.sphere.position = SCNVector3Make(20, 10, 20);
    self.sphere.physicsBody.mass = 1.5;
    self.sphere.physicsBody = [SCNPhysicsBody dynamicBody];
    self.sphere.physicsBody.rollingFriction = 0.2;
    [self.rootNode addChildNode:self.sphere];
}

#pragma mark Manage gestures

- (void)actionForOnefingerGestureWithLocation:(CGPoint)location andHitResult:(NSArray *)hitResult {
    if (hitResult.count > 0) {
        SCNHitTestResult *firstHit = hitResult[0];
        SCNVector3 position = firstHit.worldCoordinates;
        position.y = ((SCNSphere *)self.sphere.geometry).radius;
        SCNVector3 force = SCNVector3Make(position.x - self.sphere.position.x, 0, position.z - self.sphere.position.z);
        float magnitude = sqrtf(force.x * force.x + 0 + force.z * force.z);
        SCNVector3 forceTweaked = SCNVector3Make((force.x / magnitude) * 10, 0, (force.z /magnitude) * 10);
        [self.sphere.physicsBody applyForce:forceTweaked impulse:YES];
    }
}

- (void)actionForTwofingerGesture {
    
    float randomX = ((float)rand() / RAND_MAX) * 50;
    float randomZ = ((float)rand() / RAND_MAX) * 50;
    float randomRadius = ((float)rand() / RAND_MAX) * 15;
    NSString *randomTexture = [NSString stringWithFormat:@"checked%d.jpg", arc4random_uniform(2) + 1];
    SCNNode *randomSphere = [SCNNode node];
    randomSphere.geometry = [SCNSphere sphereWithRadius:randomRadius];
    randomSphere.geometry.firstMaterial.diffuse.contents = randomTexture;
    randomSphere.position = SCNVector3Make(randomX, 120, randomZ);
    randomSphere.physicsBody.mass = randomRadius * 10;
    randomSphere.physicsBody = [SCNPhysicsBody dynamicBody];
    [self.rootNode addChildNode:randomSphere];
}

@end
