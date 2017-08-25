//
//  PhysicallyBasedLight.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 25.08.17.
//

import SceneKit

class PhysicallyBasedLight {
    let node: SCNNode
    private let features: PhysicallyBasedLightFeatures
    
    init(features: PhysicallyBasedLightFeatures) {
        self.node = SCNNode()
        self.features = features
        setupLight()
    }
    
    private func setupLight() {
        node.light = SCNLight()
        node.light?.type = .directional
        node.light?.castsShadow = true
        node.light?.orthographicScale = 10
        node.light?.intensity = features.lumen
        node.light?.temperature = features.temperature
        node.position = SCNVector3Make(-2, 5, 4);
        node.eulerAngles = SCNVector3Make(GLKMathDegreesToRadians(-45), GLKMathDegreesToRadians(-25), 0);
    }
}
