//
//  BlinnPhongScene.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit

@objc class BlinnPhongScene: SCNScene, Scene {
    private var camera: Camera!
    private var poolSphere: DynamicSphere!
    
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
            position: SCNVector3Make(0, 80.0, 100.0),
            rotation: SCNVector4Make(1.0, 0, 0, -1.0 * Float(CGFloat.pi / 4.0))
        )
        rootNode.addChildNode(camera.node)
    }
    
    //MARK: Light
    
    private func createLight() {
        rootNode.addChildNode(createOmniDirectionalLight().node)
        rootNode.addChildNode(createAmbientLight().node)
    }
    
    private func createOmniDirectionalLight() -> OmniDirectionalLight {
        let lightFeatures = LightFeatures(
            position: SCNVector3Make(0, 50, 10),
            orientation: SCNVector3Make(0, 0, 0),
            color: UIColor.white
        )
        let light = OmniDirectionalLight(lightFeatures: lightFeatures)
        return light
    }
    
    private func createAmbientLight() -> AmbientLight {
        let lightFeatures = LightFeatures(
            position: SCNVector3Make(0, 0, 0),
            orientation: SCNVector3Make(0, 0, 0),
            color: UIColor.darkGray
        )
        let light = AmbientLight(lightFeatures: lightFeatures)
        return light
    }
    
    //MARK: Objects
    
    private func createObjects() {
        addFloor()
        addWhiteMarbleBox()
        addBlueMarbleBox()
        addDarkBlueMarbleBox()
        addPoolSphere()
    }
    
    private func addFloor() {
        let floor = KinematicFloor(
            material: BlinnPhongMaterial(
                ambient: UIColor.lightGray,
                diffuse: BlinnPhongDiffuseMaterialComponent(value: "floor.jpg", textureWrapMode: .repeat),
                specular: 0.0
            ),
            position: SCNVector3Make(0, 0, 0),
            rotation: SCNVector4Make(0, 0, 0, 0)
        )
        rootNode.addChildNode(floor.node)
    }
    
    private func addWhiteMarbleBox() {
        let box = DynamicBox(
            material: BlinnPhongMaterial(
                ambient: UIColor.lightGray,
                diffuse: BlinnPhongDiffuseMaterialComponent(value: "marble1.jpg"),
                specular: 0.3
            ),
            boxFeatures: BoxFeatures(width: 10.0, height: 10.0, length: 10.0, edgesRadius: 0.2),
            position: SCNVector3Make(0, 5, 0),
            rotation: SCNVector4Make(0, 1, 0, 0.5)
        )
        rootNode.addChildNode(box.node)
    }
    
    private func addBlueMarbleBox() {
        let box = DynamicBox(
            material: BlinnPhongMaterial(
                ambient: UIColor.lightGray,
                diffuse: BlinnPhongDiffuseMaterialComponent(value: "marble2.jpg"),
                specular: 0.2
            ),
            boxFeatures: BoxFeatures(width: 10.0, height: 10.0, length: 10.0, edgesRadius: 0.2),
            position: SCNVector3Make(-5, 5, 0),
            rotation: SCNVector4Make(0, 1, 0, 0.5)
        )
        rootNode.addChildNode(box.node)
    }
    
    private func addDarkBlueMarbleBox() {
        let box = DynamicBox(
            material: BlinnPhongMaterial(
                ambient: UIColor.lightGray,
                diffuse: BlinnPhongDiffuseMaterialComponent(value: "marble3.jpg"),
                specular: 0.3
            ),
            boxFeatures: BoxFeatures(width: 10.0, height: 10.0, length: 10.0, edgesRadius: 0.2),
            position: SCNVector3Make(-5, 10, 0),
            rotation: SCNVector4Make(0, 1, 0, 0.5)
        )
        rootNode.addChildNode(box.node)
    }
    
    private func addPoolSphere() {
        self.poolSphere = DynamicSphere(
            material: BlinnPhongMaterial(
                ambient: UIColor.lightGray,
                diffuse: BlinnPhongDiffuseMaterialComponent(value: "pool.jpg"),
                specular: 0.4
            ),
            physicsBodyFeature: PhysicsBodyFeatures(mass: 1.5, rollingFriction: 0.1),
            radius: 10.0,
            position: SCNVector3Make(20, 10, 20),
            rotation: SCNVector4Make(0, 0, 0, 0)
        )
        rootNode.addChildNode(self.poolSphere.node)
    }
    
    func actionForOnefingerGesture(withLocation location: CGPoint, andHitResult hitResult: [Any]!) {
        if isThereAHitIn(hitResult: hitResult) {
            movePoolSphereUsing(hitResult: hitResult)
        }
    }
    
    private func isThereAHitIn(hitResult: [Any]!) -> Bool {
        return hitResult.count > 0
    }
    
    private func movePoolSphereUsing(hitResult: [Any]!) {
        if let firstHit: SCNHitTestResult = hitResult[0] as? SCNHitTestResult {
            let force = SCNVector3Make(
                firstHit.worldCoordinates.x - self.poolSphere.node.position.x,
                0,
                firstHit.worldCoordinates.z - self.poolSphere.node.position.z
            )
            self.poolSphere.node.physicsBody?.applyForce(force, asImpulse: true)
        }
    }
    
    func actionForTwofingerGesture() {
        
    }
}
