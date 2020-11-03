//
//  Interest.swift
//  curiousKatie
//
//  Created by Cynthia Nikolai on 10/6/20.
//  Copyright © 2020 Cynthia Nikolai. All rights reserved.
//

import Foundation

struct Interest: Hashable {
    let title:String
    var additionalInfo:String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    func printInterest() -> Void {
        print("\(title): \(additionalInfo)")
    }
}
