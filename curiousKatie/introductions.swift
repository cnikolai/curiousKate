//
//  introductions.swift
//  curiousKatie
//
//  Created by Cynthia Nikolai on 10/6/20.
//  Copyright © 2020 Cynthia Nikolai. All rights reserved.
//

import Foundation

/// Plays a game where people are paired with each other based on differences in their interests
///
///
class Introductions {
    let people:[Person] = PeopleManager.people
    let interests:[Interest] = InterestManager.interests
    
    /// the main logic of the game
    ///
    ///
    func playGame() {
        let peoplePlaying = getPeople()
        
        introducePeople(peoplePlaying)
        
        compareInterests(peoplePlaying)
    }
   
    /// Introduces the people to each the game
    ///
    /// - Parameters:
    ///     - peoplePlaying: Array of people to playing the game
    ///
    private func introducePeople(_ peoplePlaying: [Person]) {
        for person in peoplePlaying {
            person.printPerson()
        }
    }
    
    /// Prints the pairings of the people in the game
    ///
    /// - Parameters:
    ///     - pairings: Array of people arrays
    ///
    private func printPairings(_ pairings: [[Person]]) {
        print("\n")
        print("===== TOTAL PAIRINGS: \(pairings.count) =====")
        guard pairings.count > 0 else {return}
        for pair in pairings {
            print("=============================")
            print("\n")
            for person in pair {
                person.printInterests()
            }
            print("\n")
        }
    }
    
    /// Creates people and if they have no interests that they share in commen, then creates a pair out of them
    ///
    /// - Parameters:
    ///     - peoplePlaying: Array of people to playing the game
    ///
    private func compareInterests(_ peoplePlaying: [Person]) {
        var pairs: [[Person]] = []
        let firstGroup = peoplePlaying
        let secondGroup = peoplePlaying
        
        for firstIndex in 0..<firstGroup.count {
            for secondIndex in firstIndex..<secondGroup.count {
                let firstPersonName = firstGroup[firstIndex].fullName
                let secondPersonName = secondGroup[secondIndex].fullName
                if firstPersonName == secondPersonName {
                    continue
                }
                var tempPairing: [Person] = [firstGroup[firstIndex],secondGroup[secondIndex]]
                for firstInterest in firstGroup[firstIndex].interests {
                    for secondInterest in secondGroup[secondIndex].interests {
                        if firstInterest == secondInterest {
                            tempPairing = []
                            continue
                        }
                    }
                }
                if tempPairing.count == 2 {
                    pairs.append(tempPairing)
                }
            }
        }
        printPairings(pairs)
    }
    
    /// Creates an array of people to play the game (from 2 to 12 players)
    ///
    /// - Parameters:
    ///     - none
    /// - Returns: Array of people in the game
    private func getPeople() -> [Person] {
        var peoplePlaying: [Person] = []
        let totalPeople = Int.random(in: 2...12)
        
        for peopleIndex in 0..<totalPeople {
            var person = people[peopleIndex]
            let totalInterests = Int.random(in: 1...10)
            var shuffledInterests = interests.shuffled()
            for _ in 0..<totalInterests {
                let interest = shuffledInterests.popLast()!
                person.setInterest(anInterest: interest)
            }
            peoplePlaying.append(person)
        }
        print("==== TOTAL PEOPLE: \(peoplePlaying.count)   =====")
        print("\n")
        
        return peoplePlaying
    }
    
}
