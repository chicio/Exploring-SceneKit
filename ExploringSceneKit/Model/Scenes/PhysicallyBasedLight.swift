//
//  PhysicallyBasedLight.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 25.08.17.
//

import SceneKit

@objc class PhysicallyBasedLight: SCNNode {
    private let features: PhysicallyBasedLightFeatures
    
    init(features: PhysicallyBasedLightFeatures) {
        self.features = features
        super.init()
        setupLight()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLight() {
        light = SCNLight()
        light?.type = .directional
        light?.castsShadow = true
        light?.orthographicScale = 10
        light?.intensity = features.lumen
        light?.temperature = features.temperature
        position = SCNVector3Make(-2, 5, 4);
        eulerAngles = SCNVector3Make(GLKMathDegreesToRadians(-45), GLKMathDegreesToRadians(-25), 0);
    }
}
