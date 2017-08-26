//
//  AmbientLight.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit

class AmbientLight: Light {
    
    override init(lightFeatures: LightFeatures) {
        super.init(lightFeatures: lightFeatures)
        node.light?.type = .ambient
    }
}
