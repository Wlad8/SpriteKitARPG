//
//  GameScene.swift
//  SpriteKitARPG
//
//  Created by Aleksander Jasinski on 30/03/2023.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    //Declare the entities and graphs
    var entities = [GKEntity]()
    var graphs = [String: GKGraph]()
    
    // Properties for the score and equipped item
    var scoreLabel: SKLabelNode!
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    var equippedItem: Item?
    
    override func didMove(to view: SKView) {
        
        // Set the background color of the scene
        backgroundColor = .black
        
        // Create the score label
        scoreLabel = SKLabelNode(fontNamed: "Helvetica Neue")
        scoreLabel.fontSize = 36
        scoreLabel.text = "Score: \(score)"
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(scoreLabel)
        
        // Create an item node for testing
        let item = Item(imageNamed: "item.png", name: "Sword", description: "Increases score by 5", effect: 5)
        item.position = CGPoint(x: frame.midX, y: frame.midY - 100)
        addChild(item)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            // Get the location of the touch
            let location = touch.location(in: self)
            
            // Check if the touch is on an item
            if let node = self.nodes(at: location).first as? Item {
                
                // Equip the item and update the score
                equippedItem = node
                score += equippedItem?.itemEffect ?? 0
            } else {
                score += 1
            }
        }
    }
}
