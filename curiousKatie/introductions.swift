//
//  introductions.swift
//  curiousKatie
//
//  Created by Cynthia Nikolai on 10/6/20.
//  Copyright © 2020 Cynthia Nikolai. All rights reserved.
//

import Foundation

class Introductions {
    //an array to store the people available to the game
    let people:[Person] = PeopleManager.people
    //an array to store the interests available to the game
    let interests:[Interest] = InterestManager.interests
    
    
    public func playGame() {
        //an array to store the people playing the game this time
        var peoplePlaying:[Person] = []
        //Generate a number of participants (2-12 participants).
        let randomNumber = Int(arc4random_uniform(10)+2)
        for i in 0..<randomNumber {
            peoplePlaying.append(people[i])
        }
    
        initializeGame(&peoplePlaying)
    
        introductions(peoplePlaying)
    
        shareInterest(peoplePlaying)
        
        //Generate conversation pairs based on differences in participants’ interests.
        //Iterate through all of the interests of each participant in a random order, logging one unshared interest at a time.
        //an array to store each particpant who still has shared interests.
        let participantsGroup1 = peoplePlaying
        let participantsGroup2 = peoplePlaying
        var pairings:[[Person]] = []
        //for each particpant to each other
        //if there is a shared interest, take that interest out of the pairing
        for personGroup1 in participantsGroup1 {
            for personGroup2 in participantsGroup2 {
                if personGroup1.firstName == personGroup2.firstName {
                    continue
                }
                var tempPairing:[Person] = [personGroup1, personGroup2]
                for personGroup1Interest in personGroup1.interests {
                    for personGroup2Interest in personGroup2.interests {
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
    
    fileprivate func initializeGame(_ peoplePlaying: inout [Person]) {
           //let shuffledInterests = interests.shuffled()
           //Populate the initial data container (participants with their interests).
           //sets 3 interests for each person
           for i in 0...10 {
               //select a random number of interests (up to 10)
               let randomNumber = Int(arc4random_uniform(10))
            for _ in 0..<interests.count {
                   //let randomNumber = Int(arc4random_uniform(UInt32(interests.count)))
                   peoplePlaying[i].interests.append(interests[randomNumber])
               }
           }
       }
       
       fileprivate func introductions(_ peoplePlaying: [Person]) {
           //Log participants’ introductions in the same order that you initially populated your original data container.
           for person in peoplePlaying {
               person.introduceSelf()
           }
       }
    
    fileprivate func shareInterest(_ peoplePlaying: [Person]) {
        //Iterate through all of the interests of each participant in a random order, logging one unshared interest at a time.
        //an array to store each particpant who still has shared interests.
        var participantsLeftToShare = peoplePlaying
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
    
    fileprivate func printPairings(_ pairings: [[Person]]) {
           //print the pairing results
           for pair in pairings {
               for person in pair {
                   print("\(person) ")
               }
               print("\n")
           }
       }
       
    
}


