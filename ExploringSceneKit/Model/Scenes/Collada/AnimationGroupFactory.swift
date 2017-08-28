//
//  AnimationGroupFactory.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 28.08.17.
//

import SceneKit

class AnimationGroupFactory {
    
    static func makeGroupWith(animations: [CABasicAnimation], time: CFTimeInterval) -> CAAnimationGroup {
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = time
        animationGroup.animations = animations
        animationGroup.isRemovedOnCompletion = false
        return animationGroup
    }
}
