//
//  String+Extension.swift
//  rsstalker
//
//  Created by Jille van der Weerd on 28/02/2019.
//  Copyright © 2019 jillevdweerd. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
