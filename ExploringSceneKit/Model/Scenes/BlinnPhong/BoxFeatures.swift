//
//  DynamicBoxFeatures.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import Foundation
import CoreGraphics

class BoxFeatures {
    let width: CGFloat
    let height: CGFloat
    let length: CGFloat
    let edgesRadius: CGFloat
    
    init(width: CGFloat, height: CGFloat, length: CGFloat, edgesRadius: CGFloat) {
        self.width = width
        self.height = height
        self.length = length
        self.edgesRadius = edgesRadius
    }
}
