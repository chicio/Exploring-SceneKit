//
//  BlinnPhongMaterial.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit

class BlinnPhongMaterial {
    let material: SCNMaterial
    
    init(ambient: Any, diffuse: BlinnPhongDiffuseMaterialComponent, specular: Any) {
        material = SCNMaterial()
        material.lightingModel = .blinn
        material.ambient.contents = ambient
        material.diffuse.contents = diffuse.value
        material.diffuse.wrapS = diffuse.textureWrapMode
        material.diffuse.wrapT = diffuse.textureWrapMode
        material.specular.contents = specular
    }
}
