//
//  PhysicallyBasedLight.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 25.08.17.
//

import SceneKit

class PhysicallyBasedLight: Light {
    
    init(lightFeatures: LightFeatures, physicallyBasedLightFeatures: PhysicallyBasedLightFeatures) {
        super.init(lightFeatures: lightFeatures)
        set(physicallyBasedLightFeatures: physicallyBasedLightFeatures)
        activateShadow()
    }
    
    private func set(physicallyBasedLightFeatures: PhysicallyBasedLightFeatures) {
        node.light?.type = .directional
        node.light?.intensity = physicallyBasedLightFeatures.lumen
        node.light?.temperature = physicallyBasedLightFeatures.temperature
    }
    
    private func activateShadow() {
        node.light?.castsShadow = true
        node.light?.orthographicScale = 10        
    }
}
