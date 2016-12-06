//
//  JournalEntry.swift
//  FloppyPillow
//
//  Created by Michał Karpowicz on 06/12/16.
//  Copyright © 2016 SoftwareHut. All rights reserved.
//

import Foundation

class JournalEntry {
    let date: Date
    let text: String
    
    var summary: String {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd 'o godzinie' HH:mm:ss"
            return "\(formatter.string(from: date)) - \(text))"
        }
    }
    
    init(entryDate: Date, entryText: String) {
        date = entryDate
        text = entryText
    }
}
