//
//  PhysicallyBasedMaterial.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit

class PhysicallyBasedMaterial {
    let material: SCNMaterial
    
    init(diffuse: Any, roughness: Any, metalness: Any, normal: Any, ambientOcclusion: Any? = nil) {
        material = SCNMaterial()
        material.lightingModel = .physicallyBased
        material.diffuse.contents = diffuse
        material.roughness.contents = roughness
        material.metalness.contents = metalness
        material.normal.contents = normal
        material.ambientOcclusion.contents = ambientOcclusion
    }
}
