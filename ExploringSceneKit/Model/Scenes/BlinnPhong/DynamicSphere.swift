//
//  DynamicSphere.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit

class DynamicSphere: Object {
    
    init(material: BlinnPhongMaterial, physicsBodyFeature: PhysicsBodyFeatures, radius: CGFloat, position: SCNVector3, rotation: SCNVector4) {
        super.init(geometry: SCNSphere(radius: radius), position: position, rotation: rotation)
        node.geometry?.firstMaterial = material.material
        node.physicsBody = SCNPhysicsBody.dynamic()
        node.physicsBody?.mass = physicsBodyFeature.mass
        node.physicsBody?.rollingFriction = physicsBodyFeature.rollingFriction
    }
}
