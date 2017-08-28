//
//  ColladaScene.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 28.08.17.
//

import SceneKit

class ColladaScene: SCNScene, Scene {
    var colladaFileContents: SCNScene!
    var camera: Camera!
    var home: SCNNode!
    var light: SCNNode!
    
    override init() {
        super.init()
        colladaFileContents = ColladaLoader.loadFromSCNAssetsAColladaFileWith(name: "house")
        createCamera()
        createLights()
        createObjects()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Camera
    
    func createCamera() {
        camera = Camera(cameraNode: colladaFileContents.rootNode.childNode(withName: "Camera", recursively: true)!)
        rootNode.addChildNode(camera.node)
    }
    
    //MARK: Light
    
    func createLights() {
        colladaFileContents.rootNode.enumerateChildNodes { node, stop in
            if node.name?.contains("Light") == true {
                rootNode.addChildNode(node)
            }
        }
    }
    
    //MARK: Objects
    
    private func createObjects() {
        addHome()
        addFloor()
        addBackground()
        pointCameraToHome()
    }
    
    private func addHome() {
        home = colladaFileContents.rootNode.childNode(withName: "home", recursively: true)!
        rootNode.addChildNode(colladaFileContents.rootNode.childNode(withName: "home", recursively: true)!)
    }
    
    private func addFloor() {
        rootNode.addChildNode(
            OpaqueFloor(
                material: BlinnPhongMaterial(
                    ambient: 0.0,
                    diffuse: BlinnPhongDiffuseMaterialComponent(
                        value: UIColor(red: 67.0/255.0, green: 100.0/255.0, blue: 31.0/255.0, alpha: 1.0)
                    ),
                    specular: 0.0
                ),
                position: SCNVector3(0.0, 0.0, 0.0),
                rotation: SCNVector4(0.0, 0.0, 0.0, 0.0)
            ).node
        )
    }
    
    private func addBackground() {
        background.contents = ["right.png", "left.png", "up.png", "down.png", "back.png", "front.png"]
    }
    
    private func pointCameraToHome() {
        camera.node.constraints = [SCNLookAtConstraint(target: home)]
    }
    
    //MARK: Gestures
    
    func actionForOnefingerGesture(withLocation location: CGPoint, andHitResult hitResult: [Any]!) {
        let moveInFrontAnimation = MoveAnimationFactory.makeMoveTo(position: SCNVector3(0.0, 0.5, 15.0), time: 5)
        let moveLeftAnimation = MoveAnimationFactory.makeMoveTo(position: SCNVector3(-6.0, 0.5, 15.0), time: 5)
        self.camera.node.addAnimation(
            AnimationGroupFactory.makeGroupWith(animations: [moveInFrontAnimation, moveLeftAnimation], time: 10.0),
            forKey: nil
        )
    }
}
