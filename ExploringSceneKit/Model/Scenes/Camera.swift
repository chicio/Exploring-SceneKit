//
//  Camera.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit

class Camera {
    let node: SCNNode
    
    init(cameraNode: SCNNode) {
        node = cameraNode
        adjustNearAndFarPlaneAutomatically()
    }
    
    init(position: SCNVector3, rotation: SCNVector4, pivot: SCNMatrix4? = nil) {
        node = SCNNode()
        createCameraOnNode()
        adjustNearAndFarPlaneAutomatically()
        set(position: position, rotation: rotation, pivot: pivot)
    }
    
    private func createCameraOnNode() {
        node.camera = SCNCamera()
    }
    
    private func adjustNearAndFarPlaneAutomatically() {
        node.camera?.automaticallyAdjustsZRange = true
    }
    
    private func set(position aPosition: SCNVector3, rotation aRotation: SCNVector4, pivot aPivot: SCNMatrix4?) {
        node.position = aPosition
        node.rotation = aRotation
        node.pivot = aPivot ?? node.pivot
    }
}
