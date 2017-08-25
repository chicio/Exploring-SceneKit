//
//  ScenePhysicallyBased.m
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 21.08.17.
//

#import "ExploringSceneKit-Swift.h"
#import "ScenePhysicallyBased_old.h"

@interface ScenePhysicallyBased_old()

@property (nonatomic, strong) SCNNode *cameraNode;

@end

@implementation ScenePhysicallyBased_old

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        [self setupCamera];
        [self setupPhysicallyBasedLight];
        [self setupObjects];
    }
    
    return self;
}

- (void)setupCamera {
    self.cameraNode = [SCNNode node];
    self.cameraNode.camera = [SCNCamera camera];
    self.cameraNode.camera.automaticallyAdjustsZRange = YES;
    self.cameraNode.position = SCNVector3Make(0, 2, 0);
    self.cameraNode.rotation = SCNVector4Make(1, 0, 0, GLKMathDegreesToRadians(-5));
    self.cameraNode.pivot = SCNMatrix4MakeTranslation(0, 0, -8);
    [self.rootNode addChildNode:self.cameraNode];
}

- (void)setupPhysicallyBasedLight {
    
    PhysicallyBasedLightFeatures *features = [[PhysicallyBasedLightFeatures alloc] initWithLumen:100
                                                                                     temperature:4000];
    [self.rootNode addChildNode: [[PhysicallyBasedLight alloc] initWithFeatures:features]];
    [self setupLightingEnviroment];
}

- (void)setupLightingEnviroment {
    PhysicallyBasedLightingEnviroment *enviroment = [[PhysicallyBasedLightingEnviroment alloc]
                                                     initWithCubeMap:@[@"rightPBR.png",
                                                                       @"leftPBR.png",
                                                                       @"upPBR.png",
                                                                       @"downPBR.png",
                                                                       @"backPBR.png",
                                                                       @"frontPBR.png"]
                                                     intensity: 1.0];
    [enviroment setLightingEnviromentForScene:self];
}

- (void)setupObjects {

    
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
