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
    
    var scoreLabel: SKLabelNode!
    var gameOver = false
    
    var score = 0
    {
        didSet
        {
            scoreLabel.text = "SCORE: \(score)"
        }
    }
    
    let sodaTexture = SKTexture(imageNamed: "soda")
    let wineBottleTexture = SKTexture(imageNamed: "winebottle")
    let newsTexture = SKTexture(imageNamed: "news")
    let hangerTexture = SKTexture(imageNamed: "hanger")
    let glassJarTexture = SKTexture(imageNamed: "glassJar")
    let boxTexture = SKTexture(imageNamed: "cardboard")
    let waterBottleTexture = SKTexture(imageNamed: "bottle")
    let bananaTexture = SKTexture(imageNamed: "banana")
    let appleCoreTexture = SKTexture(imageNamed: "appleCore")
    let plasticRingsTexture = SKTexture(imageNamed: "6Pack")
    
    let trashSprite = SKSpriteNode(imageNamed: "soda")
    
    let bioBin = SKSpriteNode(imageNamed: "brown-bin")
    let glassBin = SKSpriteNode(imageNamed: "glass-bin")
    let metalBin = SKSpriteNode(imageNamed: "metal-bin")
    let paperBin = SKSpriteNode(imageNamed: "paper-bin")
    let plasticBin = SKSpriteNode(imageNamed: "plastic-bin")
    
    override func didMove(to view: SKView)
    {
        setUpTrash()
        setUpBinSprites()
        createScore()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        throwTrash()
        checkTrash()
    }
    
    func createScore()
    {
        scoreLabel = SKLabelNode(fontNamed: "Optima-ExtraBlack")
        scoreLabel.fontSize = 24
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 60)
        scoreLabel.text = "SCORE: 0"
        scoreLabel.fontColor = UIColor.black
        addChild(scoreLabel)
    }
    
    func incrementScore()
    {
        score+=1
    }
    
    func setUpTrash()
    {
        trashSprite.size = CGSize(width: 150, height: 150)
        let trashXPos1 = frame.minX + 50
        let trashXPos2 = frame.maxX - 30
        let trashYPos = frame.minY + 100
        trashSprite.position = CGPoint(x: trashXPos1, y: trashYPos)
        setRandomTrash()
        addChild(trashSprite)
        
        let trashMoveRight = SKAction.move(to: CGPoint(x: trashXPos2, y: trashYPos), duration: 2.0)
        let trashMoveLeft = SKAction.move(to: CGPoint(x: trashXPos1, y: trashYPos), duration: 2.0)
        let trashMoveArray = SKAction.sequence([trashMoveRight, trashMoveLeft])
        let trashMovement = SKAction.repeatForever(trashMoveArray)
        trashSprite.position = CGPoint(x: trashXPos1, y: trashYPos)
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
        
        let moveUp = SKAction.move(to: CGPoint(x: trashSprite.position.x, y: bioBin.position.y + 100), duration: 1.0)
        //let moveDown = SKAction.move(to: CGPoint(x: trashSprite.position.x, y: frame.maxY - bioBin.size.height - 100), duration: 0.5)
        //let throwSequence = SKAction.sequence([moveUp, moveDown])
        trashSprite.run(moveUp)
        let wait = SKAction.wait(forDuration: 1.0)
    }
    
    func checkTrash()
    {
        let xSize = CGFloat(metalBin.size.width/3)
        
        if(trashSprite.position.x >= metalBin.position.x + xSize && trashSprite.position.x <= metalBin.position.x + 2*xSize)
        {
            print("touched metal bin")
            if(trashSprite.texture == hangerTexture || trashSprite.texture == sodaTexture)
            {
                incrementScore()
                //setRandomTrash()
            }
        }
        else if (trashSprite.position.x >= bioBin.position.x + xSize && trashSprite.position.x <= bioBin.position.x + 2*xSize)
        {
            print("touched bio bin")
            if(trashSprite.texture == appleCoreTexture || trashSprite.texture == bananaTexture)
            {
                incrementScore()
                //setRandomTrash()
            }
        }
        else if (trashSprite.position.x >= glassBin.position.x + xSize && trashSprite.position.x <= glassBin.position.x + 2*xSize)
        {
            print("touched glass bin")
            if(trashSprite.texture == glassJarTexture || trashSprite.texture == wineBottleTexture)
            {
                incrementScore()
                //setRandomTrash()
            }
        }
        else if (trashSprite.position.x >= paperBin.position.x + xSize && trashSprite.position.x <= paperBin.position.x + 2*xSize)
        {
            print("touched paper bin")
            if(trashSprite.texture == boxTexture || trashSprite.texture == newsTexture)
            {
                incrementScore()
                //setRandomTrash()
            }
        }
        else if (trashSprite.position.x >= plasticBin.position.x + xSize && trashSprite.position.x <= plasticBin.position.x + 2*xSize)
        {
            print("touched plastic bin")
            if(trashSprite.texture == waterBottleTexture || trashSprite.texture == plasticRingsTexture)
            {
                incrementScore()
                //setRandomTrash()
            }
        }
    }
    
    func setRandomTrash()
    {
        trashSprite.position = CGPoint(x: frame.maxX/2 + 50, y: frame.minY + 100)
        
        let trashTextures = [sodaTexture, wineBottleTexture, newsTexture, hangerTexture, glassJarTexture, boxTexture, waterBottleTexture, bananaTexture, appleCoreTexture, plasticRingsTexture]
        let trashIndex = Int.random(in: 0..<trashTextures.count)
        trashSprite.texture = trashTextures[trashIndex]
    }
}
