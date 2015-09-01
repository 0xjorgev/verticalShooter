//
//  SKSpriteNodeExtension.swift
//  Vertical Shooter
//
//  Created by Jorge Mendoza on 8/23/15.
//  Copyright © 2015 TheSwift.ninja. All rights reserved.
//

import Foundation
import SpriteKit

enum SpriteImage: String {
    case Player = "player"
    case Enemy = "Enemy-0"
    case Bullet = "bullet"
}

enum ElementKind {
    case Player
    case Enemy
    case Bullet
    case Item
}

extension SKSpriteNode {
    // new functionality to add to SomeType goes here
    func setPhysics() -> SKSpriteNode {
        self.physicsBody = SKPhysicsBody(rectangleOfSize: self.size)
        self.physicsBody!.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        return self
    }
    
    func setDynamic(active:Bool) -> SKSpriteNode {
        self.physicsBody!.dynamic = active
        return self
    }
    
    func setNodeImage(image:SpriteImage) -> SKSpriteNode {
        return self
    }
    
    func setNodePosition(position:CGPoint) -> SKSpriteNode {
        self.position = position
        return self
    }
    
    func moveNodeToPositionX(position:CGPoint) {
        let moveAction:SKAction = SKAction.moveTo(position, duration: 0.1)
        moveAction.timingMode = SKActionTimingMode.EaseInEaseOut
        self.runAction(moveAction)
    }
    
    func runNodeAction(action:SKAction) -> SKSpriteNode {
        
        self.runAction(action)
        return self
    }
    
    func setNodeBitMask(bitMask:physicCategory) -> SKSpriteNode {
        
        self.physicsBody!.categoryBitMask = bitMask.rawValue
        return self
    }
    
    func addSpriteNodeToScene(scene:SKScene) -> SKSpriteNode {
        scene.addChild(self)
        return self
    }
    
    func convertPlayerPoint(location:CGPoint) -> CGPoint {
        return CGPointMake(location.x, self.position.y)
    }
    
    func setGameElement(element:ElementKind) -> SKSpriteNode {
        
        self.setCategoryBitMask(element).setCollisionBitMask(element).setContactTestBitMask(element)
        return self
    }
    
    func setCategoryBitMask(element:ElementKind) -> SKSpriteNode {
        
        switch element {
        case .Player:
            self.physicsBody?.categoryBitMask = physicCategory.Player.rawValue
        case .Enemy:
            self.physicsBody?.categoryBitMask = physicCategory.Enemy.rawValue
        case .Bullet:
            self.physicsBody?.categoryBitMask = physicCategory.Bullet.rawValue
        case .Item:
            self.physicsBody?.categoryBitMask = physicCategory.Item.rawValue
        }
        return self
    }
    
    func setCollisionBitMask(element:ElementKind) -> SKSpriteNode {
        
        switch element {
        case .Player:
            self.physicsBody?.collisionBitMask = physicCategory.Item.rawValue
        case .Enemy:
            self.physicsBody?.collisionBitMask = physicCategory.Bullet.rawValue
        case .Bullet:
            self.physicsBody?.collisionBitMask = physicCategory.Enemy.rawValue
        case .Item:
            self.physicsBody?.collisionBitMask = physicCategory.Player.rawValue
        }
        return self
    }
    
    func setContactTestBitMask(element:ElementKind) -> SKSpriteNode {
        
        switch element {
        case .Player:
            self.physicsBody?.contactTestBitMask =  physicCategory.Item.rawValue
        case .Enemy:
            self.physicsBody?.contactTestBitMask = physicCategory.Bullet.rawValue
        case .Bullet:
            self.physicsBody?.contactTestBitMask = physicCategory.Enemy.rawValue
        case .Item:
            self.physicsBody?.contactTestBitMask = physicCategory.Player.rawValue
        }
        return self
    }
}