//
//  Stalker.swift
//  rsstalker
//
//  Created by Jille van der Weerd on 20/02/2019.
//  Copyright © 2019 jillevdweerd. All rights reserved.
//

import Foundation

class Stalker {
    
    static let shared = Stalker()
    
    var runLoop: Timer?
    
    var username = ""
    
    var user = User()
    
    func setup(for username: String, and timeInterval: TimeInterval = 600) {
        self.username = username
        runLoop = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true, block: { (_) in
            self.updateUser()
        })
        runLoop?.fire()
    }
    
    
    func updateUser() {
        LogManager.log("Fetching data...")
        let url = URL(string: "https://secure.runescape.com/m=hiscore/index_lite.ws?player=\(username)")!
        guard let string = try? String(contentsOf: url) else {
            LogManager.error("Could not update data. Is the username correct?\n")
            return
        }
        guard !string.starts(with: "<!DOCTYPE html>") else {
            // This guard block falls through when the user isn't on the hiscores (page will be a 404).
            LogManager.error("That user is not on the hiscores. Quitting application.\n")
            exit(EXIT_FAILURE)
        }
        
        // There's a newline character between every skill, so we're splitting on that.
        var array = string.components(separatedBy: "\n")
        
        // This works because the static 'allSkills' property of User is in the same order as the skills in the response.
        var result = [String: Int]()
        for (index, skill) in User.allSkills.enumerated() {
            var items = array[index].components(separatedBy: ",")
            guard let level = Int(items[1]) else { continue }
            result[skill] = level
        }
        
        if user.skills != result {
            if user.skills.count != 0 {
                // This means we're checking changes
                checkChanges(oldSkills: user.skills, newSkills: result)
            } else {
                // This means we're doing the first check.
                print("Skills for \(username):")
                print("________________________\n")
                checkChanges(oldSkills: user.skills, newSkills: result, firstTime: true)
                print("________________________\n")
            }
        } else {
            LogManager.log("No changes!")
        }
        user.skills = result
    }
    
    // Maps the levels of the oldSkills to the newSkills and logs if anything changed.
    func checkChanges(oldSkills: [String: Int], newSkills: [String: Int], firstTime: Bool = false) {
        for (skill, level) in newSkills {
            if oldSkills[skill] != level {
                LogManager.log("\(skill) is \(firstTime ? "" : "now ")level \(level).".capitalizingFirstLetter())
            }
        }
        print("\n")
    }
    
}
