//
//  Camera.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit

class Camera {
    let node: SCNNode
    
    init(cameraNode: SCNNode, wantsHDR: Bool = false) {
        node = cameraNode
        setAdvancedFeatures(wantsHDR: wantsHDR)
    }
    
    init(position: SCNVector3, rotation: SCNVector4, wantsHDR: Bool = false, pivot: SCNMatrix4? = nil) {
        node = SCNNode()
        createCameraOnNode()
        setAdvancedFeatures(wantsHDR: wantsHDR)
        set(position: position, rotation: rotation, pivot: pivot)
    }
    
    private func createCameraOnNode() {
        node.camera = SCNCamera()
    }
    
    private func setAdvancedFeatures(wantsHDR: Bool) {
        node.camera?.automaticallyAdjustsZRange = true
        node.camera?.wantsHDR = wantsHDR
    }
    
    private func set(position aPosition: SCNVector3, rotation aRotation: SCNVector4, pivot aPivot: SCNMatrix4?) {
        node.position = aPosition
        node.rotation = aRotation
        node.pivot = aPivot ?? node.pivot
    }
}
