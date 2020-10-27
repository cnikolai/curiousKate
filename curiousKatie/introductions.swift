//
//  introductions.swift
//  curiousKatie
//
//  Created by Cynthia Nikolai on 10/6/20.
//  Copyright © 2020 Cynthia Nikolai. All rights reserved.
//

import Foundation

class Introductions {
    let people:[Person] = PeopleManager.people
    let interests:[Interest] = InterestManager.interests
    
    func playGame() {
        let peoplePlaying = getPeople()
    
        //MARK: - introduce people
        introducePeople(peoplePlaying)
        
        //MARK: - Generate conversation pairs based on differences in participants’ interests.
        let participantsGroup1 = peoplePlaying
        let participantsGroup2 = peoplePlaying
        var pairings:[[Person]] = []
        for personGroup1index in 0..<participantsGroup1.count {
            for personGroup2index in personGroup1index..<participantsGroup2.count {
                if participantsGroup1[personGroup1index].firstName == participantsGroup2[personGroup2index].firstName {
                    continue
                }
                var tempPairing:[Person] = [participantsGroup1[personGroup1index], participantsGroup2[personGroup2index]]
                for personGroup1Interest in participantsGroup1[personGroup1index].interests {
                    for personGroup2Interest in participantsGroup2[personGroup2index].interests {
                        if personGroup1Interest.title == personGroup2Interest.title {
                            tempPairing = []
                            continue
                        }
                    }
                    
                }
                if tempPairing.count == 2 {
                    pairings.append(tempPairing)
                }
            }
        }
        
        printPairings(pairings)
    }
       
    private func introducePeople(_ peoplePlaying: [Person]) {
        for person in peoplePlaying {
            person.introduceSelf()
        }
    }
    
    private func compareInterests(_ peoplePlaying: [Person]) {
        var pairs: [Person] = []
        for person in peoplePlaying {
            let interests = person.interests.map{ $0 }
            for person2 in peoplePlaying {
                let interests2 = person2.interests.map{ $0 }
                let differences = zip(interests, interests2).map { $0.0.title == $0.1.title }
                if differences.count > 0 {
                    pairs.append(person)
                    pairs.append(person2)
                }
            }
        }
    }
    
    private func printPairings(_ pairings: [[Person]]) {
        print("\n")
        print("******************************")
        print("***        PAIRINGS        ***")
        print("******************************")
        for pair in pairings {
            print("==============================")
            print("\n")
               for person in pair {
                   person.introduceSelf()
               }
               print("\n")
           }
       }
       
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
        return peoplePlaying
    }
}


