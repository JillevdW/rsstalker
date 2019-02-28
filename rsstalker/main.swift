//
//  main.swift
//  rsstalker
//
//  Created by Jille van der Weerd on 20/02/2019.
//  Copyright © 2019 jillevdweerd. All rights reserved.
//

import Foundation

if CommandLine.argc > 1 {
    // Command was entered.
    let first = CommandLine.arguments[1]
    if first == "--help" {
        print("Usage: ./rsstalker [username] [refreshtime in seconds (optional)]")
    } else {
        let username = CommandLine.arguments[1]
        if CommandLine.argc > 2 {
            if let timeInterval = Double(CommandLine.arguments[2]) {
                print("Setting up stalker for \(username) to update once every \(Int(timeInterval)) seconds.")
                Stalker.shared.setup(for: username, and: timeInterval)
            } else {
                print("Setting up stalker for \(username).")
                Stalker.shared.setup(for: username)
            }
        } else {
            print("Setting up stalker for \(username).")
            Stalker.shared.setup(for: username)
        }
        RunLoop.main.run()
    }
} else {
    print("Please run the '--help' command for information on how to use this tool.")
}
