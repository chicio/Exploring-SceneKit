//
//  ScenePhysicallyBased.m
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 21.08.17.
//

#import "ScenePhysicallyBased.h"

@interface ScenePhysicallyBased()

@property (nonatomic, strong) SCNNode *cameraNode;

@end

@implementation ScenePhysicallyBased

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        [self setupCamera];
        [self setupLight];
        [self setupObjects];
    }
    
    return self;
}

- (void)setupCamera {
    
    self.cameraNode = [SCNNode node];
    self.cameraNode.camera = [SCNCamera camera];
    //self.cameraNode.camera.zNear = 2;
    //self.cameraNode.camera.zFar = 400;
    self.cameraNode.camera.automaticallyAdjustsZRange = YES;
    self.cameraNode.position = SCNVector3Make(0, 2, 0);
    self.cameraNode.rotation = SCNVector4Make(1, 0, 0, GLKMathDegreesToRadians(-5));
    self.cameraNode.pivot = SCNMatrix4MakeTranslation(0, 0, -8);
    [self.rootNode addChildNode:self.cameraNode];
}

- (void)setupLight {
    self.lightingEnvironment.contents = @[@"rightPBR.png", @"leftPBR.png", @"upPBR.png", @"downPBR.png", @"backPBR.png", @"frontPBR.png"];
    self.lightingEnvironment.intensity = 1.0;
    self.background.contents = @[@"rightPBR.png", @"leftPBR.png", @"upPBR.png", @"downPBR.png", @"backPBR.png", @"frontPBR.png"];
}

- (void)setupObjects {
    //Setup light
    SCNNode *lightNode = [SCNNode node];
    lightNode.light = [SCNLight light];
    lightNode.light.type = SCNLightTypeDirectional;
    lightNode.light.castsShadow = YES;
    lightNode.light.shadowMapSize = CGSizeMake(2048, 2048);
    lightNode.light.shadowColor = [UIColor blackColor];
    lightNode.light.shadowRadius = 9;
    lightNode.light.intensity = 100;
    lightNode.light.temperature = 4000;
    lightNode.light.orthographicScale = 10;
    lightNode.position = SCNVector3Make(-2, 5, 4);
    lightNode.rotation = SCNVector4Make(1, 0, 0, GLKMathDegreesToRadians(-85));
    lightNode.castsShadow = YES;
    [self.rootNode addChildNode:lightNode];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Dragon-uv" ofType:@"obj"];
    NSURL *url = [NSURL fileURLWithPath:path];
    MDLAsset *asset = [[MDLAsset alloc] initWithURL:url];
    SCNNode *node = [SCNNode nodeWithMDLObject:[asset objectAtIndex:0]];
    node.castsShadow = YES;
    node.position = SCNVector3Make(-2, 0, 3);
    node.rotation = SCNVector4Make(0, 1, 0, GLKMathDegreesToRadians(20));
    node.geometry.firstMaterial.lightingModelName = SCNLightingModelPhysicallyBased;
    node.geometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"rustediron-diffuse.png"];
    node.geometry.firstMaterial.roughness.contents = [NSNumber numberWithFloat:0.4];
    node.geometry.firstMaterial.metalness.contents = [UIImage imageNamed:@"rustediron-metalness.png"];
    node.geometry.firstMaterial.normal.contents = [UIImage imageNamed:@"rustediron-normal.png"];
    [self.rootNode addChildNode:node];
    
    path = [[NSBundle mainBundle] pathForResource:@"Floor-uv" ofType:@"obj"];
    url = [NSURL fileURLWithPath:path];
    asset = [[MDLAsset alloc] initWithURL:url];
    node = [SCNNode nodeWithMDLObject:[asset objectAtIndex:0]];
    node.position = SCNVector3Make(0, 0, 0);
    node.castsShadow = YES;
    node.geometry.firstMaterial.lightingModelName = SCNLightingModelPhysicallyBased;
    node.geometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"floor-diffuse.png"];
    node.geometry.firstMaterial.roughness.contents = [NSNumber numberWithFloat:0.8];
    node.geometry.firstMaterial.metalness.contents = [UIImage imageNamed:@"floor-metalness.png"];
    node.geometry.firstMaterial.normal.contents = [UIImage imageNamed:@"floor-normal.png"];
    node.geometry.firstMaterial.ambientOcclusion.contents = [UIImage imageNamed:@"floor-ambient-occlusion.png"];
    [self.rootNode addChildNode:node];
    
    path = [[NSBundle mainBundle] pathForResource:@"HappyBuddha-uv" ofType:@"obj"];
    url = [NSURL fileURLWithPath:path];
    asset = [[MDLAsset alloc] initWithURL:url];
    node = [SCNNode nodeWithMDLObject:[asset objectAtIndex:0]];
    node.castsShadow = YES;
    node.position = SCNVector3Make(-0.5, 0, 0);
    node.geometry.firstMaterial.lightingModelName = SCNLightingModelPhysicallyBased;
    node.geometry.firstMaterial.name = @"Cement-PBR";
    node.geometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"cement-diffuse.png"];
    node.geometry.firstMaterial.roughness.contents = [NSNumber numberWithFloat:0.8];
    node.geometry.firstMaterial.metalness.contents = [UIImage imageNamed:@"cement-metalness.png"];
    node.geometry.firstMaterial.normal.contents = [UIImage imageNamed:@"cement-normal.png"];
    node.geometry.firstMaterial.ambientOcclusion.contents = [UIImage imageNamed:@"cement-ambient-occlusion.png"];
    [self.rootNode addChildNode:node];
    
    lightNode.constraints = @[[SCNLookAtConstraint lookAtConstraintWithTarget:node]];
    
    path = [[NSBundle mainBundle] pathForResource:@"Lucy-uv" ofType:@"obj"];
    url = [NSURL fileURLWithPath:path];
    asset = [[MDLAsset alloc] initWithURL:url];
    node = [SCNNode nodeWithMDLObject:[asset objectAtIndex:0]];
    node.castsShadow = YES;
    node.position = SCNVector3Make(2, 0, 2);
    node.scale = SCNVector3Make(0.9, 0.9, 0.9);
    node.geometry.firstMaterial.lightingModelName = SCNLightingModelPhysicallyBased;
    node.geometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"copper-diffuse.png"];
    node.geometry.firstMaterial.roughness.contents = [NSNumber numberWithFloat:0.0];
    node.geometry.firstMaterial.metalness.contents = [UIImage imageNamed:@"copper-metalness.png"];
    node.geometry.firstMaterial.normal.contents = [UIImage imageNamed:@"copper-normal.png"];
    [self.rootNode addChildNode:node];
}

- (void)actionForOnefingerGestureWithLocation:(CGPoint)location andHitResult:(NSArray *)hitResult {
    //[self.cameraNode runAction:[SCNAction moveTo:SCNVector3Make(0, 2, 7) duration:10]];
    [self.cameraNode runAction:[SCNAction rotateByAngle:GLKMathDegreesToRadians(360) aroundAxis:SCNVector3Make(0, 1, 0) duration:30]];
}

@end
