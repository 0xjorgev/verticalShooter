//
//  GameSceneExtension.swift
//  Vertical Shooter
//
//  Created by Jorge Mendoza on 8/24/15.
//  Copyright © 2015 TheSwift.ninja. All rights reserved.
//

import Foundation
import SpriteKit

enum physicCategory:UInt32 {
    
    case Player = 1
    case Enemy = 2
    case Bullet = 3
    case Item = 4
}

extension SKScene : SKPhysicsContactDelegate {
    
    public func didBeginContact(contact: SKPhysicsContact) {
       
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        
        if (bodyA.categoryBitMask == physicCategory.Enemy.rawValue && bodyB.categoryBitMask == physicCategory.Bullet.rawValue ) || (bodyB.categoryBitMask == physicCategory.Enemy.rawValue && bodyA.categoryBitMask == physicCategory.Bullet.rawValue ){
            
            if let enemy = bodyA.node as? SKSpriteNode{
                enemy.removeFromParent()
            }
            
            if let bullet = bodyB.node as? SKSpriteNode{
                bullet.removeFromParent()
            }
            
        } else if  (bodyA.categoryBitMask == physicCategory.Enemy.rawValue && bodyB.categoryBitMask == physicCategory.Player.rawValue ) || (bodyB.categoryBitMask == physicCategory.Enemy.rawValue && bodyA.categoryBitMask == physicCategory.Player.rawValue ){
            
            //Time to try the protocol Oriented Stuff --> ??
            print("You're Dead!")
        }
    }
}