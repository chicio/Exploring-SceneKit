//
//  Object.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit

class Object {
    let node: SCNNode
    
    init(position: SCNVector3, rotation: SCNVector4) {
        node = SCNNode()
        node.castsShadow = true
        set(position: position, rotation: rotation)
    }
    
    init(geometry: SCNGeometry, position: SCNVector3, rotation: SCNVector4) {
        node = SCNNode(geometry: geometry)
        node.castsShadow = true
        set(position: position, rotation: rotation)
    }
    
    init(mesh: MDLObject, position: SCNVector3, rotation: SCNVector4) {
        node = SCNNode(mdlObject: mesh)
        node.castsShadow = true
        set(position: position, rotation: rotation)
    }
    
    private func set(position: SCNVector3, rotation: SCNVector4) {
        node.position = position
        node.rotation = rotation
    }
}
