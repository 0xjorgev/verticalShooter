//
//  GameScene.swift
//  Vertical Shooter
//
//  Created by Jorge Mendoza on 8/23/15.
//  Copyright (c) 2015 TheSwift.ninja. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {

    
    var player:SKSpriteNode! = SKSpriteNode(imageNamed: "player")
    
    override func didMoveToView(view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        /* Setup your scene here */
        
        player.setPhysics().setNodeBitMask(physicCategory.Player).setNodePosition(CGPointMake(self.size.width / 2, self.size.height / 5)).addSpriteNodeToScene(self).setGameElement(.Player).setDynamic(false)
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: Selector("SpawnBullets"), userInfo: nil, repeats: true)
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("SpawnEnemies"), userInfo: nil, repeats: true)
        
//        self.addChild(player)
        
    }
    
    func SpawnBullets(){
        let Bullet = SKSpriteNode(imageNamed: "bullet")

        Bullet.zPosition = -5
        let action = SKAction.moveToY(self.size.height + 30, duration: 0.5)
        Bullet.setPhysics().addSpriteNodeToScene(self).setNodePosition(CGPointMake(player.position.x, player.position.y)).runNodeAction(SKAction.repeatActionForever(action)).setDynamic(true)
        Bullet.setGameElement(.Bullet)
    }
    
    func SpawnEnemies(){
        let Enemy = SKSpriteNode(imageNamed: "Enemy-0")
        Enemy.setPhysics()
        let MinValue = self.size.width / 8
        let MaxValue = self.size.width - 150
        let SpawnPoint = UInt32(MaxValue - MinValue)
        Enemy.position = CGPoint(x: CGFloat(arc4random_uniform(SpawnPoint)), y: self.size.height)
        
        Enemy.setGameElement(.Enemy).setDynamic(true)
        let action = SKAction.moveToY(-70, duration: 3.0)
        Enemy.runAction(SKAction.repeatActionForever(action))
        
        self.addChild(Enemy)
        
    }
    
    //iOS 8 code!
    
//    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
//        
//        for touch: AnyObject in touches {
//            let location = touch.locationInNode(self)
//            player.moveNodeToPositionX(location)
//            
//        }
//    }
//    
//    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
//        for touch: AnyObject in touches {
//            let location = touch.locationInNode(self)
//            player.moveNodeToPositionX(location)
//            
//        }
//    }
    
    
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

    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
