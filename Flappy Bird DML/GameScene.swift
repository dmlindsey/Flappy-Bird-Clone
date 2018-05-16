//
//  GameScene.swift
//  Flappy Bird DML
//
//  Created by Dean Lindsey on 14/05/2018.
//  Copyright © 2018 Dean Lindsey. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var bird = SKSpriteNode()
    var background = SKSpriteNode()
    let ground = SKNode()
    
    override func didMove(to view: SKView) {
        
        let bgTexture = SKTexture(imageNamed: "bg.png")
        let moveBGAnimate = SKAction.move(by: CGVector(dx: -bgTexture.size().width, dy: 0), duration: 8)
        let shiftBGAnimate = SKAction.move(by: CGVector(dx: bgTexture.size().width, dy: 0), duration: 0)
        let makeBGMove = SKAction.repeatForever(SKAction.sequence([moveBGAnimate, shiftBGAnimate]))
        
        var i: CGFloat = 0
        
        while i < 3 {
            background = SKSpriteNode(texture: bgTexture)
            background.position = CGPoint(x: bgTexture.size().width * i, y: self.frame.midY)
            background.size.height = self.frame.height
            background.run(makeBGMove)
            background.zPosition = -1
            self.addChild(background)
            
            i += 1
            
            
        }
        
        
        let birdTextureDown = SKTexture(imageNamed: "flappy2.png")
        let birdTextureUp = SKTexture(imageNamed: "flappy1.png")
        let animation = SKAction.animate(with: [birdTextureUp, birdTextureDown], timePerFrame: 0.3)
        let makeBirdFlap = SKAction.repeatForever(animation)
        
        bird = SKSpriteNode(texture: birdTextureUp)
        
        bird.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        bird.run(makeBirdFlap)
        self.addChild(bird)
        
        ground.position = CGPoint(x: self.frame.midX, y: -self.frame.height/2)
        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width, height: 1))
        ground.physicsBody?.isDynamic = false
        self.addChild(ground)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let birdTextureUp = SKTexture(imageNamed: "flappy1.png")
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTextureUp.size().height/2)
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        bird.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 80))
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
