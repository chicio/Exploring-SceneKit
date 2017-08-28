//
//  CGFloat+Random.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 28.08.17.
//

import Foundation
import CoreGraphics

extension CGFloat {
    
    static func randomIn(minRange: CGFloat, maxRange: CGFloat) -> CGFloat {
        let random = CGFloat(arc4random_uniform(UInt32(maxRange - minRange + 1))) + minRange
        return random
    }
}
