//
//  DiffuseFloor.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 28.08.17.
//

import SceneKit

class OpaqueFloor: Object {
    
    init(material: BlinnPhongMaterial, position: SCNVector3, rotation: SCNVector4) {
        let floor = SCNFloor()
        floor.reflectivity = 0.0
        super.init(geometry: floor, position: position, rotation: rotation)
        node.geometry?.firstMaterial = material.material
    }
}
