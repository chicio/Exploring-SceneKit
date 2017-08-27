//
//  DynamicSphere.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit

class DynamicSphere: Object {
    let sphereGeometry: SCNSphere
    
    init(material: BlinnPhongMaterial, physicsBodyFeature: PhysicsBodyFeatures, radius: CGFloat, position: SCNVector3, rotation: SCNVector4) {
        sphereGeometry = SCNSphere(radius: radius)
        super.init(geometry: sphereGeometry, position: position, rotation: rotation)
        node.geometry?.firstMaterial = material.material
        node.physicsBody = SCNPhysicsBody.dynamic()
        node.physicsBody?.mass = physicsBodyFeature.mass
        node.physicsBody?.rollingFriction = physicsBodyFeature.rollingFriction
    }
}
