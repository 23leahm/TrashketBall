//
//  GameScene.swift
//  Trashket Ball
//
//  Created by Spence on 7/15/19.
//  Copyright © 2019 Hael. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene{
    
    let trashTexture = SKTexture(imageNamed: "soda")
    let trashSprite = SKSpriteNode(imageNamed: "soda")
    
    let bioBin = SKSpriteNode(imageNamed: "brown-bin")
    let glassBin = SKSpriteNode(imageNamed: "glass-bin")
    let metalBin = SKSpriteNode(imageNamed: "metal-bin")
    let paperBin = SKSpriteNode(imageNamed: "paper-bin")
    let plasticBin = SKSpriteNode(imageNamed: "plastic-bin")
    
    
    
    var moveTrash = true
    
    override func didMove(to view: SKView)
    {
        
        setUpTrash()
        setUpBinSprites()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        throwTrash()
    }
    
    func setUpTrash()
    {
        trashSprite.size = CGSize(width: 150, height: 150)
        let trashXPos1 = frame.minX + 50
        let trashXPos2 = frame.maxX - 30
        let trashYPos = frame.minY + 100
        trashSprite.position = CGPoint(x: trashXPos1, y: trashYPos)
        addChild(trashSprite)
        
        let trashMoveRight = SKAction.move(to: CGPoint(x: trashXPos2, y: trashYPos), duration: 2.0)
        let trashMoveLeft = SKAction.move(to: CGPoint(x: trashXPos1, y: trashYPos), duration: 2.0)
        let trashMoveArray = SKAction.sequence([trashMoveRight, trashMoveLeft])
        let trashMovement = SKAction.repeatForever(trashMoveArray)
        trashSprite.run(trashMovement)
    }
    
    func setUpBinSprites()
    {
        let binSprites = [bioBin, glassBin, metalBin, paperBin, plasticBin]
        
        for i in 0..<binSprites.count
        {
            binSprites[i].size = CGSize(width: 200, height: 200)
            let xPos = frame.width/5*CGFloat(i)
            binSprites[i].anchorPoint = CGPoint.zero
            binSprites[i].position = CGPoint(x: xPos - 65, y: frame.maxY - 400)
            binSprites[i].zPosition = 1
            addChild(binSprites[i])
        }
    }
    
    func throwTrash()
    {
        trashSprite.removeAllActions()
        
        let moveUp = SKAction.move(to: CGPoint(x: trashSprite.position.x, y: frame.maxY - 100), duration: 1.0)
        let moveDown = SKAction.move(to: CGPoint(x: trashSprite.position.x, y: frame.maxX - 30), duration: 0.5)
        let throwSequence = SKAction.sequence([moveUp, moveDown])
        trashSprite.run(throwSequence)
        
        let xSize = CGFloat(metalBin.size.width/3)
        
        if(trashSprite.position.x >= metalBin.position.x + xSize && trashSprite.position.x <= metalBin.position.x + 2*xSize)
        {
            print("touched metal bin")
        }
        else if (trashSprite.position.x >= bioBin.position.x + xSize && trashSprite.position.x <= bioBin.position.x + 2*xSize)
        {
            print("touched bio bin")
        }
        else if (trashSprite.position.x >= glassBin.position.x + xSize && trashSprite.position.x <= glassBin.position.x + 2*xSize)
        {
            print("touched glass bin")
        }
        else if (trashSprite.position.x >= paperBin.position.x + xSize && trashSprite.position.x <= paperBin.position.x + 2*xSize)
        {
            print("touched paper bin")
        }
        else if (trashSprite.position.x >= plasticBin.position.x + xSize && trashSprite.position.x <= plasticBin.position.x + 2*xSize)
        {
            print("touched plastic bin")
        }
    }
}
