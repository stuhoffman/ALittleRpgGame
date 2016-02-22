//
//  Enemy.swift
//  RpgGame
//
//  Created by Stuart Hoffman on 2/22/16.
//  Copyright © 2016 Stuart Hoffman. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String] {
        return ["Rusty Dagger","Cracked buckler"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
    }
}