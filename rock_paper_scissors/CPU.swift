//
//  CPU.swift
//  rock_paper_scissors
//
//  Created by Andrew's Laptop on 5/21/19.
//  Copyright © 2019 Andrew's Laptop. All rights reserved.
//

import Foundation

class CPU {
    var CPU_choice = "unset"
    var winner = 0
    var lastLoss = "None"
    
    func compare(playerChoice: String) -> String {
        if(playerChoice == CPU_choice){
            winner = 0
            return "tie"
        }
        else if(playerChoice == "rock" && CPU_choice == "paper"){
            winner = 2
            lastLoss = "None"
            return "player chose rock and cpu chose paper so \ncpu wins"
        }
        else if(playerChoice == "rock" && CPU_choice == "scissors"){
            winner = 1
            lastLoss = "rock"
            return "player chose rock and cpu chose scissors so \nplayer wins"
        }
        else if(playerChoice == "paper" && CPU_choice == "scissors"){
            winner = 2
            lastLoss = "None"
            return "player chose paper and cpu chose scissors so \ncpu wins"
        }
         else if(playerChoice == "paper" && CPU_choice == "rock"){
            winner = 1
            lastLoss = "paper"
            return "player chose paper and cpu chose rock so \nplayer wins"
        }
        else if(playerChoice == "scissors" && CPU_choice == "rock"){
            winner = 2
            lastLoss = "None"
            return "player chose scissors and cpu chose rock so \ncpu wins"
        }
         else if(playerChoice == "scissors" && CPU_choice == "paper"){
            winner = 1
            lastLoss = "scissors"
            return "player chose scissors and cpu chose paper so \nplayer wins"
        }
       else {
            print(CPU_choice)
            print(playerChoice)
            return "error"
        }
    }
    
    func throw_hand() -> Void{
        let num = arc4random_uniform(3)
        if(num==1){
            CPU_choice = "rock"
        }
        else if(num==2){
            CPU_choice = "paper"
        }
        else {
            CPU_choice = "scissors"
        }
    }
    
    func getWinner() -> Int{
        return winner
    }
    
    func getHint() -> String{
        return "defult CPU, completely random"
    }
    
    
}
//biased towards random hand
class CPU_level1 : CPU{
    var mainHand: String
    var secondHand: String
    var thirdHand: String
    override init(){
        let choiceArray = ["rock","paper","scissors"]
        var i = Int(arc4random_uniform(2))
        mainHand = choiceArray[i]
        i = (i+1)%3
        secondHand = choiceArray[i]
        i = (i+1)%3
        thirdHand = choiceArray[i]
    }
    
    override func throw_hand() -> Void {
        let num = arc4random_uniform(30)
        if(num >= 0 && num <= 16){
            CPU_choice = mainHand
        }
        else if(num > 16 && num <= 23){
            CPU_choice = secondHand
        }
        else {
            CPU_choice = thirdHand
        }
    }
    
    override func getHint() -> String{
        return "has bias towards favorite hand"
    }
}

class CPU_level2 : CPU{
    
   
    override func throw_hand() {
        if(lastLoss == "None"){
            super.throw_hand()
        }
        else if(lastLoss == "rock"){
            CPU_choice = "paper"
        }
        else if(lastLoss=="paper"){
            CPU_choice = "scissors"
        }
        else {
            CPU_choice = "rock"
        }
    }
    
    override func getHint() -> String {
        return "attempts to learn from losses"
    }
}







