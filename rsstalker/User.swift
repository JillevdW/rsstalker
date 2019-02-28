//
//  User.swift
//  rsstalker
//
//  Created by Jille van der Weerd on 20/02/2019.
//  Copyright © 2019 jillevdweerd. All rights reserved.
//

import Foundation

struct User: Codable {
        
    var skills = [String: Int]()
    
    static var allSkills = [
        "total",
        "attack",
        "defence",
        "strength",
        "constitution",
        "ranged",
        "prayer",
        "magic",
        "cooking",
        "woodcutting",
        "fletching",
        "fishing",
        "firemaking",
        "crafting",
        "smithing",
        "mining",
        "herblore",
        "agility",
        "thieving",
        "slayer",
        "farming",
        "runecrafting",
        "hunter",
        "construction",
        "summoning",
        "dungeoneering",
        "divination",
        "invention"
    ]
    
}
