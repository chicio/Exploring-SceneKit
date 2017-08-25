//
//  PhysicallyBasedObject.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit

class PhysicallyBasedObject {
    let node: SCNNode
    
    init(mesh: MDLObject, material: PhysicallyBasedMaterial, position: SCNVector3, rotation: SCNVector4) {
        node = SCNNode(mdlObject: mesh)
        node.castsShadow = true
        node.position = position
        node.rotation = rotation
        node.geometry?.firstMaterial = material.material
    }
}
