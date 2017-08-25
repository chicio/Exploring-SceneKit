//
//  PhysicallyBasedLightFeatures.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 25.08.17.
//

import Foundation
import SceneKit

class PhysicallyBasedLightFeatures {
    let lumen: CGFloat
    let temperature: CGFloat
    
    init(lumen: CGFloat, temperature: CGFloat) {
        self.lumen = lumen
        self.temperature = temperature
    }
}
