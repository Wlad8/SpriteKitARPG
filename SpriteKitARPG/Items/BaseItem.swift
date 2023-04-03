//
//  BaseItem.swift
//  SpriteKitARPG
//
//  Created by Aleksander Jasinski on 03/04/2023.
//

import GameplayKit
import SpriteKit

class Item: SKSpriteNode {
    
    // Properties of the item
    var itemName: String
    var itemDescription: String
    var itemEffect: Int
    
    init(imageNamed: String, name: String, description: String, effect: Int) {
        self.itemName = name
        self.itemDescription = description
        self.itemEffect = effect
        
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: .clear, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
