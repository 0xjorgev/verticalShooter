//
//  GameElementProtocol.swift
//  Vertical Shooter
//
//  Created by Jorge Mendoza on 8/23/15.
//  Copyright © 2015 TheSwift.ninja. All rights reserved.
//

import Foundation
import SpriteKit

//enum NodeSprite:String {
//    
//    case ps = "player"
//    case en = "Enemy-0"
//    case bu = "bullet"
//}

//Sprite node extesion looks like a better option

protocol elemementPhysics {
    
//    var node:SKNode {get set}
    
//    func setPhysics(node:SKSpriteNode)
//    func setNodeSprite(node:SKSpriteNode, sprite:NodeSprite)
//    func setNodePosition(node:SKSpriteNode, position:CGPoint)
//    func setNodeBitMask(node:SKSpriteNode, bitMask:physicCategory)
}

struct GameElement: elemementPhysics {
    
//    func setPhysics(node:SKSpriteNode) {
//        node.physicsBody = SKPhysicsBody(rectangleOfSize: node.size)
//        node.physicsBody!.dynamic = false
//    }
//    
//    func setNodeSprite(node:SKSpriteNode, sprite:NodeSprite) {
//        
//        //?
//        
//    }
//    
//    func setNodePosition(node:SKSpriteNode, position:CGPoint) {
//        node.position = position
//    }
//    
//    func setNodeBitMask(node:SKSpriteNode, bitMask:physicCategory){
//        
//        node.physicsBody!.categoryBitMask = bitMask.rawValue
//    }
}