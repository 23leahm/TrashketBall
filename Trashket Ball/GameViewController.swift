//
//  GameViewController.swift
//  Trashket Ball
//
//  Created by Spence on 7/15/19.
//  Copyright © 2019 Hael. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            
            let scene = GameScene(size: view.bounds.size)
            view.presentScene(scene)
            scene.scaleMode = .aspectFill
            
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            view.showsPhysics = true
        }
    }}
