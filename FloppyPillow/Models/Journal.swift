//
//  Journal.swift
//  FloppyPillow
//
//  Created by Michał Karpowicz on 06/12/16.
//  Copyright © 2016 SoftwareHut. All rights reserved.
//

import Foundation

class Journal {
    
    var entries = [JournalEntry]()
    
    var summary: String {
        get {
            guard entries.count > 0 else {
                return "Brak wpisów"
            }
            var retVal = ""
            
            for entry in entries {
                retVal += "\(entry.summary)\n"
            }
            
            return retVal
        }
    }
    
}
