//
//  BlinnPhongScene.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit

@objc class BlinnPhongScene: SCNScene, Scene {
    var camera: Camera!

    override init() {
        super.init()
        createCamera()
        createLight()
        createObjects()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Camera
    
    private func createCamera() {
        camera = Camera(
            position: SCNVector3Make(0, 80, 100),
            rotation: SCNVector4Make(1, 0, 0, GLKMathDegreesToRadians(-5))
        )
        rootNode.addChildNode(camera.node)
    }
    
    //MARK: Light
    
    func createLight() {
        
    }
    
    //MARK: Objects
    
    func createObjects() {
        
    }
    
    func actionForOnefingerGesture(withLocation location: CGPoint, andHitResult hitResult: [Any]!) {
    
    }
    
    func actionForTwofingerGesture() {
        
    }
}
