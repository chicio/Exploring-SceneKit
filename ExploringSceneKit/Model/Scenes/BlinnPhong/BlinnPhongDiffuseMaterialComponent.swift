//
//  BlinnPhongDiffuseMaterialComponent.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 27.08.17.
//

import SceneKit

class BlinnPhongDiffuseMaterialComponent {
    let value: Any
    let textureWrapMode: SCNWrapMode
    
    init(value: Any, textureWrapMode: SCNWrapMode = .clamp) {
        self.value = value
        self.textureWrapMode = textureWrapMode
    }
}
