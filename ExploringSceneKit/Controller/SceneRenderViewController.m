//
//  GameViewController.m
//  ChicioSceneKit
//
//  Created by Fabrizio Duroni on 19/09/15.
//

#import "Scene.h"
#import "SceneBalls.h"
#import "SceneCollada.h"
#import "SceneRenderViewController.h"

@interface SceneRenderViewController()

@property (strong, nonatomic) IBOutlet SCNView *sceneView;

@end

@implementation SceneRenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:true];
    [self setupGestures];
}

- (void)viewDidAppear:(BOOL)animated {
    [self renderScene];
}

#pragma mark Render

- (void)renderScene {
    self.sceneView.scene = self.scene;
    self.sceneView.showsStatistics = YES;
    self.sceneView.backgroundColor = [UIColor blackColor];
    self.sceneView.delegate = self;
}

#pragma mark Gestures

- (void)setupGestures {
    UITapGestureRecognizer *oneFingerGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(oneFingerGesture:)];
    oneFingerGesture.numberOfTapsRequired = 1;
    oneFingerGesture.numberOfTouchesRequired = 1;
    UITapGestureRecognizer *twoFingerGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(twoFingerGesture:)];
    twoFingerGesture.numberOfTapsRequired = 1;
    twoFingerGesture.numberOfTouchesRequired = 2;
    self.sceneView.gestureRecognizers = @[oneFingerGesture, twoFingerGesture];
}

- (void)oneFingerGesture:(UITapGestureRecognizer *)tapGestureRecognizer {
    CGPoint location = [tapGestureRecognizer locationInView:self.sceneView];
    NSArray *hitResult = [self.sceneView hitTest:location options:nil];
    [self.scene actionForOnefingerGestureWithLocation:location andHitResult:hitResult];
}

- (void)twoFingerGesture:(UITapGestureRecognizer *)tapGestureRecognizer {
    if([self.scene respondsToSelector:@selector(actionForTwofingerGesture)]) {
        [self.scene actionForTwofingerGesture];
    }
}

- (IBAction)close:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}


@end
