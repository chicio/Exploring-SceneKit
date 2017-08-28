//
//  Scene.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 28.08.17.
//

import Foundation
import CoreGraphics

@objc protocol Scene {
    @objc func actionForOnefingerGesture(withLocation location: CGPoint, andHitResult hitResult: [Any]!)
    @objc optional func actionForTwofingerGesture()
}
