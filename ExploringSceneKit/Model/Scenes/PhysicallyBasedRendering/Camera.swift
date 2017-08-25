//
//  Camera.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit

class Camera {
    let node: SCNNode
    
    init(position: SCNVector3, rotation: SCNVector4, pivot: SCNMatrix4) {
        node = SCNNode()
        createCameraOnNode()
        set(position: position, rotation: rotation, pivot: pivot)
    }
    
    private func createCameraOnNode() {
        node.camera = SCNCamera()
        node.camera?.automaticallyAdjustsZRange = true
    }
    
    private func set(position aPosition: SCNVector3, rotation aRotation: SCNVector4, pivot aPivot: SCNMatrix4) {
        node.position = aPosition
        node.rotation = aRotation
        node.pivot = aPivot
    }
}
