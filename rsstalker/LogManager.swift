//
//  LogManager.swift
//  rsstalker
//
//  Created by Jille van der Weerd on 20/02/2019.
//  Copyright © 2019 jillevdweerd. All rights reserved.
//

import Foundation

class LogManager {
    
    static func log(_ message: String) {
        print("[\(LogManager.currentDate())] \(message)")
    }
    
    static func error(_ message: String) {
        fputs("[\(LogManager.currentDate())] \(message)", stderr)
    }
    
    private static func currentDate() -> String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.string(from: now)
    }
    
}
