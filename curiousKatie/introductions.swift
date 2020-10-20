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
    
    //MARK: - Setup initial people and interests
    func playGame() {
        let peoplePlaying = getPeople()
    
        introducePeople(peoplePlaying)
    
        shareInterest(peoplePlaying)
        
        //Generate conversation pairs based on differences in participants’ interests.
        //Iterate through all of the interests of each participant in a random order, logging one unshared interest at a time.
        let participantsGroup1 = peoplePlaying
        let participantsGroup2 = peoplePlaying
        var pairings:[[Person]] = []
        //for each particpant to each other
        //if there is a shared interest, take that interest out of the pairing
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
                //if there is still a pairing (there are no shared interests, then append the pairing to the set of pairings
                if tempPairing.count == 2 {
                    pairings.append(tempPairing)
                }
            }
        }
        
        printPairings(pairings)
    }
       
       private func introducePeople(_ peoplePlaying: [Person]) {
           //Log participants’ introductions in the same order that you initially populated your original data container.
           for person in peoplePlaying {
               person.introduceSelf()
           }
       }
    
        private func shareInterest(_ peoplePlaying: [Person]) {
            //Iterate through all of the interests of each participant in a random order, logging one unshared interest at a time.
            var participantsLeftToShare = peoplePlaying
            var isCommon = false
            //while there are more partipants left to share
            while (participantsLeftToShare.count > 0) {
                //get the current participant
                let currentParticipant = participantsLeftToShare.popLast()
                //while the person has no more unshared interests, share an interest
                for var interest in currentParticipant!.interests {
                    //if the interest has not been shared
                    if !interest.isCommon {
                        //share the interest
                        interest.printInterest()
                        //change the value of the interest to shared
                        interest.isCommon = true
                        //break out of the interest loop
                        break
                    }
                }
            }
        }
    
        private func printPairings(_ pairings: [[Person]]) {
           //print the pairing results
           print("*******************************")
           for pair in pairings {
            print("=============================")
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


