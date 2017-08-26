//
//  BlinnPhongMaterial.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit

class BlinnPhongMaterial {
    let material: SCNMaterial
    
    init(ambient: Any, diffuse: Any, specular: Any) {
        material = SCNMaterial()
        material.lightingModel = .blinn
        material.ambient.contents = ambient
        material.diffuse.contents = diffuse
        material.specular.contents = specular
    }
}
