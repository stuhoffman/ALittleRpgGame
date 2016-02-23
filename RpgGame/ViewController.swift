//
//  ViewController.swift
//  RpgGame
//
//  Created by Stuart Hoffman on 2/22/16.
//  Copyright © 2016 Stuart Hoffman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        player = Player(name: "Dirty Dan", hp: 110, attackPwr: 20)
        playerHPLabel.text = "\(player.hp) HP"
        generateRandomEnemy()
        enemyHPLabel.text = "\(enemy.hp) HP"
        enemyHPLabel.hidden = false
    }

    func generateRandomEnemy() {
        let rand = (Int(arc4random_uniform(2)))
            if rand == 0 {
                enemy = Kimara(startingHp: 50, attackPwr: 12)
            } else {
                enemy = DevilWizard(startingHp: 60, attackPwr: 15)
        }
        
        enemyImg.hidden = false
    }

    @IBOutlet var printLabel: UILabel!

    @IBOutlet var attackButton: UIButton!
    @IBOutlet var playerHPLabel: UILabel!
    @IBOutlet var enemyHPLabel: UILabel!

    @IBOutlet var enemyImg: UIImageView!

    @IBOutlet var chestButton: UIButton!
    
    @IBAction func onChestTapped(sender: UIButton) {
        chestButton.hidden = true
        printLabel.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self,selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }
    @IBAction func onAttackTapped(sender: AnyObject) {
        if enemy.attemptAttack(player.attackPwr)
        {
            printLabel.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHPLabel.text = "\(enemy.hp) HP"
        } else {
            printLabel.text = "Attack was unsuccessful"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestButton.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHPLabel.text = ""
            printLabel.text = "Killed \(enemy.type)"
            enemyImg.hidden = true
        }
    }

}

