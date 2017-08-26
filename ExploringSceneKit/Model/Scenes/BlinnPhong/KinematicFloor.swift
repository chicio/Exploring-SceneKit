//
//  File.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit

class KinematicFloor: Object {

    init(material: BlinnPhongMaterial, position: SCNVector3, rotation: SCNVector4) {
        super.init(geometry: SCNFloor(), position: position, rotation: rotation)
        node.geometry?.firstMaterial = material.material
        node.physicsBody = SCNPhysicsBody.kinematic()
    }
}
