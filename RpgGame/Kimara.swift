//
//  Kimara.swift
//  RpgGame
//
//  Created by Stuart Hoffman on 2/22/16.
//  Copyright © 2016 Stuart Hoffman. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Gold Dagger", "Gold Spear", "Kimara Venom"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
    }
}