//
//  ColladaLoader.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 28.08.17.
//

import SceneKit

class ColladaLoader {
    
    static func loadFromSCNAssetsAColladaFileWith(name: String) -> SCNScene {
        let path = "art.scnassets/\(name)"
        let scene = SCNScene(named: path)!
        return scene
    }
}
