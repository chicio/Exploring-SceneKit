//
//  DynamicBox.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit

class DynamicBox: Object {
    
    init(material: BlinnPhongMaterial, boxFeatures: BoxFeatures, position: SCNVector3, rotation: SCNVector4) {
        super.init(position: position, rotation: rotation)
        node.geometry = SCNBox(
            width: boxFeatures.width,
            height: boxFeatures.height,
            length: boxFeatures.length,
            chamferRadius: boxFeatures.edgesRadius
        )
        node.geometry?.firstMaterial = material.material
        node.physicsBody = SCNPhysicsBody.dynamic()
    }
}
