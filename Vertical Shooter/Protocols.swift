//
//  Protocols.swift
//  Vertical Shooter
//
//  Created by Jorge Mendoza on 9/2/15.
//  Copyright © 2015 TheSwift.ninja. All rights reserved.
//

import Foundation

protocol Player {
    
}

protocol GameSceneExtension {
    
    var isGameOver:Bool {get}
    func setGameOver() -> Bool
}