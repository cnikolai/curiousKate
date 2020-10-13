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
    var interests:[Interest] = []
    let age:Int
    let hometown:String
    
    public mutating func setInterest(anInterest: Interest) -> Void {
        interests.append(anInterest)
    }
    
    public func printPerson() -> Void {
        print("\(firstName) \(lastName) has interests: \(interests)")
    }
    
    public func introduceSelf() -> Void {
        print("Hi, I'm \(firstName) \(lastName).  I'm \(age) years old, and I'm from \(hometown).")
    }
    
    public func randomInterest(i:Int) -> Interest {
        //let randomNumber = arc4random_uniform(3)
        return interests[i]
    }
}
