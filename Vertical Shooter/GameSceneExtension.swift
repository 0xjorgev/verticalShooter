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

//    func convertPlayerPoint(player:SKSpriteNode, location:CGPoint) -> CGPoint {
//        
//        return CGPointMake(location.x, player.position.y)
//    }

    
//    -(void)didBeginContact:(SKPhysicsContact *)contact
//    {
//    SKPhysicsBody *firstBody, *secondBody;
//    
//    firstBody = contact.bodyA;
//    secondBody = contact.bodyB;
//    
//    if(firstBody.categoryBitMask == spikeHitCategory || secondBody.categoryBitMask == spikeHitCategory)
//    {
//    
//    NSLog(@"balloon hit the spikes");
//    //setup your methods and other things here
//    
//    }
//    }
    
    public func didBeginContact(contact: SKPhysicsContact) {
       
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        if (bodyA.categoryBitMask == physicCategory.Enemy.rawValue || bodyB.categoryBitMask == physicCategory.Bullet.rawValue ){
            
            if let enemy = bodyA.node as? SKSpriteNode{
                enemy.removeFromParent()
            }
            
            if let bullet = bodyB.node as? SKSpriteNode{
                bullet.removeFromParent()
            }
            
            
//            (bodyA.node as! SKSpriteNode).removeFromParent()
//            (bodyB.node as! SKSpriteNode).removeFromParent()
//            print("Fox 2 ... Hit")
        }
        
    }
    
}