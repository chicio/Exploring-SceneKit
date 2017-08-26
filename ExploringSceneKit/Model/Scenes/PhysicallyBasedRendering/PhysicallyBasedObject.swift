//
//  PhysicallyBasedObject.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit

class PhysicallyBasedObject: Object {
    
    init(mesh: MDLObject, material: PhysicallyBasedMaterial, position: SCNVector3, rotation: SCNVector4) {
        super.init(mesh: mesh, position: position, rotation: rotation)
        node.geometry?.firstMaterial = material.material
    }
}
