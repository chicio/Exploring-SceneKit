//
//  LightFeatures.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit

class LightFeatures {
    let position: SCNVector3
    let orientation: SCNVector3
    let color: UIColor
    
    init(position: SCNVector3, orientation: SCNVector3, color: UIColor) {
        self.position = position
        self.orientation = orientation
        self.color = color
    }
}
