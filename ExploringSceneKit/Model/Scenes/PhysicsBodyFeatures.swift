//
//  PhysicsBodyFeatures.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import Foundation

class PhysicsBodyFeatures {
    let mass: CGFloat
    let rollingFriction: CGFloat
    
    init(mass: CGFloat, rollingFriction: CGFloat) {
        self.mass = mass
        self.rollingFriction = rollingFriction
    }
}
