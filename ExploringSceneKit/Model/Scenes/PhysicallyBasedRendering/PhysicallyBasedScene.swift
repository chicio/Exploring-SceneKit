//
//  PhysicallyBasedScene.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 25.08.17.
//

import Foundation
import SceneKit
import SceneKit.ModelIO

@objc class PhysicallyBasedScene: SCNScene, Scene {
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
            position: SCNVector3Make(0, 2, 0),
            rotation: SCNVector4Make(1, 0, 0, GLKMathDegreesToRadians(-5)),
            pivot: SCNMatrix4MakeTranslation(0, 0, -8)
        )
        rootNode.addChildNode(camera.node)
    }
    
    //MARK: Light
    
    private func createLight() {
        rootNode.addChildNode(createPhysicallyBasedLight().node)
        createPhysicallyLightingEnviroment()
    }
    
    private func createPhysicallyBasedLight() -> PhysicallyBasedLight {
        let lightFeatures = LightFeatures(
            position: SCNVector3Make(-2, 5, 4),
            orientation: SCNVector3Make(GLKMathDegreesToRadians(-45), GLKMathDegreesToRadians(-25), 0),
            color: UIColor.white
        )
        let physicallyBasedLightFeatures = PhysicallyBasedLightFeatures(lumen: 100, temperature: 4000)
        let physicallyBasedLight = PhysicallyBasedLight(
            lightFeatures: lightFeatures,
            physicallyBasedLightFeatures: physicallyBasedLightFeatures
        )
        return physicallyBasedLight
    }
    
    private func createPhysicallyLightingEnviroment() {
        let enviroment = PhysicallyBasedLightingEnviroment(
            cubeMap: ["rightPBR.png", "leftPBR.png", "upPBR.png", "downPBR.png", "backPBR.png", "frontPBR.png"],
            intensity: 1.0
        )
        enviroment.setLightingEnviromentFor(scene: self)
    }
    
    //MARK: Objects
    
    private func createObjects() {
        addFloor()
        addDragon()
        addBuddha()
        addLucy()
    }
    
    private func addFloor() {
        let floor = PhysicallyBasedObject(
            mesh: MeshLoader.loadMeshWith(name: "Floor", ofType: "obj"),
            material: PhysicallyBasedMaterial(
                diffuse: "floor-diffuse.png",
                roughness: 0.8,
                metalness: "floor-metalness.png",
                normal: "floor-normal.png",
                ambientOcclusion: "floor-ambient-occlusion.png"
            ),
            position: SCNVector3Make(0, 0, 0),
            rotation: SCNVector4Make(0, 0, 0, 0)
        )
        rootNode.addChildNode(floor.node)
    }
    
    private func addDragon() {
        let dragon = PhysicallyBasedObject(
            mesh: MeshLoader.loadMeshWith(name: "Dragon", ofType: "obj"),
            material: PhysicallyBasedMaterial(
                diffuse: "rustediron-diffuse.png",
                roughness: 0.3,
                metalness: "rustediron-metalness.png",
                normal: "rustediron-normal.png"
            ),
            position: SCNVector3Make(-2, 0, 3),
            rotation: SCNVector4Make(0, 1, 0, GLKMathDegreesToRadians(20))
        )
        rootNode.addChildNode(dragon.node)
    }
    
    private func addBuddha() {
        let buddha = PhysicallyBasedObject(
            mesh: MeshLoader.loadMeshWith(name: "HappyBuddha", ofType: "obj"),
            material: PhysicallyBasedMaterial(
                diffuse: "cement-diffuse.png",
                roughness: 0.8,
                metalness: "cement-metalness.png",
                normal: "cement-normal.png",
                ambientOcclusion: "cement-ambient-occlusion.png"
            ),
            position: SCNVector3Make(-0.5, 0, 0),
            rotation: SCNVector4Make(0, 0, 0, 0)
        )
        rootNode.addChildNode(buddha.node)
    }
    
    private func addLucy() {
        let lucy = PhysicallyBasedObject(
            mesh: MeshLoader.loadMeshWith(name: "Lucy", ofType: "obj"),
            material: PhysicallyBasedMaterial(
                diffuse: "copper-diffuse.png",
                roughness: 0.0,
                metalness: "copper-metalness.png",
                normal: "copper-normal.png"
            ),
            position: SCNVector3Make(2, 0, 2),
            rotation: SCNVector4Make(0, 0, 0, 0)
        )
        rootNode.addChildNode(lucy.node)
    }
    
    //MARK: Gestures
    
    func actionForOnefingerGesture(withLocation location: CGPoint, andHitResult hitResult: [Any]!) {
        self.camera.node.runAction(SCNAction.rotate(by: CGFloat(GLKMathDegreesToRadians(360)),
                                                    around: SCNVector3Make(0, 1, 0),
                                                    duration: 30))
    }
}
