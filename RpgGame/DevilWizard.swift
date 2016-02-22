//
//  DevilWizard.swift
//  RpgGame
//
//  Created by Stuart Hoffman on 2/22/16.
//  Copyright © 2016 Stuart Hoffman. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
    
}