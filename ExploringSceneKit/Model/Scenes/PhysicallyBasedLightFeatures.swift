//
//  PhysicallyBasedLightFeatures.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 25.08.17.
//

import Foundation
import SceneKit

@objc class PhysicallyBasedLightingEnviroment: NSObject {
    let cubeMap: [String]
    let intensity: CGFloat
    
    init(cubeMap: [String], intensity: CGFloat) {
        self.cubeMap = cubeMap
        self.intensity = intensity
    }
    
    func setLightingEnviromentFor(scene: SCNScene) {
        scene.lightingEnvironment.contents = cubeMap
        scene.lightingEnvironment.intensity = intensity
        scene.background.contents = cubeMap
    }
}

@objc class PhysicallyBasedLightFeatures: NSObject {
    let lumen: CGFloat
    let temperature: CGFloat
    
    init(lumen: CGFloat, temperature: CGFloat) {
        self.lumen = lumen
        self.temperature = temperature
    }
}
