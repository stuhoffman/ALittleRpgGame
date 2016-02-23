//
//  Player.swift
//  RpgGame
//
//  Created by Stuart Hoffman on 2/22/16.
//  Copyright © 2016 Stuart Hoffman. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name = "Player"
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        get {
            return _inventory
        }
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHp: hp, attackPwr: attackPwr)
        
        _name = name
    }
    
    func addItemToInventory(item: String) {
        _inventory.append(item)
    }
    
}