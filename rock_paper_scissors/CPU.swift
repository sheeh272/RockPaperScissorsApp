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
    var lastHandThrown = "None"
    
    func compare(playerChoice: String) -> String {
        if(playerChoice == CPU_choice){
            winner = 0
            return "tie"
        }
        else if(playerChoice == "rock" && CPU_choice == "paper"){
            winner = 2
            lastLoss = "None"
            lastHandThrown = "paper"
            return "player chose rock and cpu chose paper so \ncpu wins"
        }
        else if(playerChoice == "rock" && CPU_choice == "scissors"){
            winner = 1
            lastLoss = "rock"
            lastHandThrown = "scissors"
            return "player chose rock and cpu chose scissors so \nplayer wins"
        }
        else if(playerChoice == "paper" && CPU_choice == "scissors"){
            winner = 2
            lastLoss = "None"
            lastHandThrown = "scissors"
            return "player chose paper and cpu chose scissors so \ncpu wins"
        }
         else if(playerChoice == "paper" && CPU_choice == "rock"){
            winner = 1
            lastLoss = "paper"
            lastHandThrown = "rock"
            return "player chose paper and cpu chose rock so \nplayer wins"
        }
        else if(playerChoice == "scissors" && CPU_choice == "rock"){
            winner = 2
            lastLoss = "None"
            lastHandThrown = "rock"
            return "player chose scissors and cpu chose rock so \ncpu wins"
        }
         else if(playerChoice == "scissors" && CPU_choice == "paper"){
            winner = 1
            lastLoss = "scissors"
            lastHandThrown = "paper"
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
        return "Defult CPU, completely random"
    }
    
    func getCPU_Choice() -> String{
        return CPU_choice
    }
    func setCPU_Choice(newChoice:String) -> Void{
        CPU_choice = newChoice
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
        return "Has bias towards favorite hand"
    }
}
//throws hand that would have won against last loss
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
        return "Attempts to learn from losses"
    }
}
//higher chance of throwing consecutive hands
class CPU_level3 : CPU{
    override func throw_hand() {
        if(lastHandThrown=="None"){
            super.throw_hand()
        }
        else{
            let choiceArray = ["rock","paper","scissors"]
            var i = 0
            while(choiceArray[i] != lastHandThrown){
                i = i+1
            }
            let num = arc4random_uniform(30)
            if(num>0 && num<16){
                CPU_choice = lastHandThrown
            }
            else if(num>=16 && num<23){
                i = (i+1)%3
                CPU_choice = choiceArray[i]
            }
            else {
                i = (i+2)%3
                CPU_choice = choiceArray[i]
            }
        }
    }
    
    override func getHint() -> String {
        return "Influenced by last hand"
    }
}
//lower chance of throwing consecutive hands
class CPU_level4 : CPU{
    override func throw_hand() {
        if(lastHandThrown=="None"){
            super.throw_hand()
        }
       else{
            let choiceArray = ["rock","paper","scissors"]
            var i = 0
            while(choiceArray[i] != lastHandThrown){
                i = i+1
            }
            let num = arc4random_uniform(30)
            if(num>0 && num<6){
                CPU_choice = lastHandThrown
            }
            else if(num>=6 && num<18){
                i = (i+1)%3
                CPU_choice = choiceArray[i]
            }
            else {
                i = (i+2)%3
                CPU_choice = choiceArray[i]
            }
        }
    }
    
    override func getHint() -> String {
        return "Likes to change things up"
    }
}
//combination of previous stratagies.  switches every 10 turns
class CPU_level5 : CPU{
    var count = 0
    var curr_CPU: CPU
    var CPU_Array: [CPU]
    override init() {
        let c1 = CPU_level1()
        let c2 = CPU_level2()
        let c3 = CPU_level3()
        let c4 = CPU_level4()
        CPU_Array = [c1,c2,c3,c4]
        let num = Int(arc4random_uniform(4))
        curr_CPU = CPU_Array[num]
    }
    
    override func throw_hand() {
        if(count%10 == 0){
            let num = Int(arc4random_uniform(4))
            curr_CPU = CPU_Array[num]
            curr_CPU.throw_hand()
            setCPU_Choice(newChoice: curr_CPU.getCPU_Choice())
            count = count + 1
        }
        else {
            curr_CPU.throw_hand()
            setCPU_Choice(newChoice: curr_CPU.getCPU_Choice())
            count = count + 1
        }
    }
    
    override func getHint() -> String {
        return "Combination of several strategies.  Switchs up every 10 turns"
       //return curr_CPU.getHint()
    }
}








