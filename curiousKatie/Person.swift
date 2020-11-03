//
//  Person.swift
//  curiousKatie
//
//  Created by Cynthia Nikolai on 10/6/20.
//  Copyright © 2020 Cynthia Nikolai. All rights reserved.
//

import Foundation
struct Person {
    let firstName:String
    let lastName:String
    var interests: Set<Interest> = []
    let age:Int
    let hometown:String
    
    var fullName: String {
        firstName + " " + lastName
    }
    
    mutating func setInterest(anInterest: Interest) -> Void {
        interests.insert(anInterest)
    }
    
    func printPerson() -> Void {
        print("\(firstName) \(lastName).  I am \(age) years old, and I am from \(hometown).")
        for interest in interests {
            print(" - \(interest)")
        }
    }
    
    func printInterests() -> Void {
        print(fullName)
        for interest in interests {
            print(" - \(interest)")
        }
    }
}
