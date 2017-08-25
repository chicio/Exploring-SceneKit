//
//  MeshLoader.swift
//  ExploringSceneKit
//
//  Created by Fabrizio Duroni on 26.08.17.
//

import SceneKit.ModelIO

class MeshLoader {
    
    static func loadMeshWith(name: String, ofType type: String) -> MDLObject {
        let path = Bundle.main.path(forResource: name, ofType: type)!
        let asset = MDLAsset(url: URL(fileURLWithPath: path))
        return asset[0]!
    }
}
