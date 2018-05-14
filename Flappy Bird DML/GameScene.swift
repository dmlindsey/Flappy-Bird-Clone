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
    
    override func didMove(to view: SKView) {
        
        let birdTextureUp = SKTexture(imageNamed: "flappy1.png")
        let birdTextureDown = SKTexture(imageNamed: "flappy2.png")
        let animation = SKAction.animate(with: [birdTextureUp, birdTextureDown], timePerFrame: 0.1)
        let makeBirdFlap = SKAction.repeatForever(animation)
        
        bird = SKSpriteNode(texture: birdTextureUp)
        bird.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        bird.run(makeBirdFlap)
        
        self.addChild(bird)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
