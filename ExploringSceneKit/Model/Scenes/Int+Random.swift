//
//  Int+Random.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 28.08.17.
//

import Foundation

extension Int {
    
    static func randomIn(minRange: Int, maxRange: Int) -> Int {
        let random = Int(arc4random_uniform(UInt32(maxRange - minRange + 1))) + minRange
        return random
    }
}
