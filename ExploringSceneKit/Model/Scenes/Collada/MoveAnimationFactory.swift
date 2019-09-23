//
//  MoveAnimationFactory.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 28.08.17.
//

import SceneKit

class MoveAnimationFactory {
    
    static func makeMoveTo(position: SCNVector3, time: CFTimeInterval) -> CABasicAnimation {
        let move = CABasicAnimation(keyPath: "position")
        move.duration = time
        move.toValue = position
        move.isRemovedOnCompletion = false
        move.fillMode = CAMediaTimingFillMode.forwards
        return move
    }
}
