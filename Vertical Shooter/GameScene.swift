//
//  GameScene.swift
//  Vertical Shooter
//
//  Created by Jorge Mendoza on 8/23/15.
//  Copyright (c) 2015 TheSwift.ninja. All rights reserved.
//

import SpriteKit


class GameScene: SKScene, SKPhysicsContactDelegate {

    
    var player:SKSpriteNode! = SKSpriteNode(imageNamed: "player")
    var isGameOver:Bool = false
    
    override func didMoveToView(view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        /* Setup your scene here */
        
        player.setPhysics().setNodeBitMask(physicCategory.Player).setNodePosition(CGPointMake(self.size.width / 2, self.size.height / 5)).addSpriteNodeToScene(self).setGameElement(.Player).setDynamic(false)
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: Selector("SpawnBullets"), userInfo: nil, repeats: true)
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("SpawnEnemies"), userInfo: nil, repeats: true)
        
    }
    
    func SpawnBullets(){
        let Bullet = SKSpriteNode(imageNamed: "bullet")

        Bullet.zPosition = -5
        let action = SKAction.moveToY(self.size.height + 30, duration: 0.5)
        Bullet.setPhysics().addSpriteNodeToScene(self).setNodePosition(CGPointMake(player.position.x, player.position.y)).runNodeAction(SKAction.repeatActionForever(action)).setDynamic(true).setGameElement(.Bullet)
    }
    
    func SpawnEnemies(){
        let Enemy = SKSpriteNode(imageNamed: "Enemy-0")
        Enemy.setPhysics()
        let MinValue = self.size.width / 8
        let MaxValue = self.size.width - 150
        let SpawnPoint = UInt32(MaxValue - MinValue)
        Enemy.position = CGPoint(x: CGFloat(arc4random_uniform(SpawnPoint)), y: self.size.height)
        

        let action = SKAction.moveToY(-70, duration: 3.0)
        Enemy.setGameElement(.Enemy).setDynamic(true).runNodeAction(action).addSpriteNodeToScene(self)
        
    }
    
    //iOS 9 Stuff
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            player.moveNodeToPositionX(player.convertPlayerPoint(location))
            
        }
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            player.moveNodeToPositionX(player.convertPlayerPoint(location))
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        
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
            self.isGameOver = true
        }
    }

    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if self.isGameOver == true {
            self.scene?.view?.paused = true
        }
    }
}
