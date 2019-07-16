//
//  GameScene.swift
//  Trashket Ball
//
//  Created by Spence on 7/15/19.
//  Copyright © 2019 Hael. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var trashTexture = SKTexture(imageNamed: "soda")
    let trashSprite = SKSpriteNode(imageNamed: "soda")
    
    var moveTrash = true
    
    override func didMove(to view: SKView)
    {
        setUpSprites()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        throwTrash()
    }
    
    func setUpSprites()
    {
        //TRASH SPRITE-------
        trashSprite.size = CGSize(width: 150, height: 150)
        trashSprite.position = CGPoint(x: frame.minX + 50, y: frame.minY + 50)
        addChild(trashSprite)
        
            let trashMoveRight = SKAction.move(to: CGPoint(x: frame.maxX - 30, y: frame.minY + 50), duration: 2.0)
            let trashMoveLeft = SKAction.move(to: CGPoint(x: frame.minX + 50, y: frame.minY + 50), duration: 2.0)
            let trashMoveArray = SKAction.sequence([trashMoveRight, trashMoveLeft])
            let trashMovement = SKAction.repeatForever(trashMoveArray)
            trashSprite.run(trashMovement)
        
        //BIN SPRITES-------
        let binSprite = SKSpriteNode(imageNamed: "brown-bin")
        binSprite.size = CGSize(width: 200, height: 200)
        binSprite.position = CGPoint(x: frame.width/2, y: frame.maxY - 100 - binSprite.size.height)
        addChild(binSprite)
    }
    
    func throwTrash()
    {
        trashSprite.removeAllActions()
    }
}
