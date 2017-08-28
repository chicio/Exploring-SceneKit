//
//  Light.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit

class Light {
    let node: SCNNode
    
    init(lightNode: SCNNode) {
        node = lightNode
    }
    
    init(lightFeatures: LightFeatures) {
        node = SCNNode()
        createLight()
        set(lightFeatures: lightFeatures)
    }
    
    func createLight() {
        node.light = SCNLight()
    }
    
    private func set(lightFeatures: LightFeatures) {
        node.light?.color = lightFeatures.color
        node.position = lightFeatures.position
        node.eulerAngles = lightFeatures.orientation;
    }
}
