//
//  Interest.swift
//  curiousKatie
//
//  Created by Cynthia Nikolai on 10/6/20.
//  Copyright © 2020 Cynthia Nikolai. All rights reserved.
//

import Foundation

struct Interest {
    let title:String
    var additionalInfo:String
    var isCommon:Bool = false
    
    func printInterest() -> Void {
        print("\(title): \(additionalInfo)")
    }
}
