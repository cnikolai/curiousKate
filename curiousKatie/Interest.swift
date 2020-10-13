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
    var isCommon:Bool = false //defaults to false
    
//    public func setShared() -> Void {
//        self.shared = 1
//    }
    
    public func printInterest() -> Void {
        print("Interest \(title): \(additionalInfo)")
    }
}
