//
//  ViewController.swift
//  rock_paper_scissors
//
//  Created by Andrew's Laptop on 5/21/19.
//  Copyright © 2019 Andrew's Laptop. All rights reserved.
//

import UIKit

var playerChoice = "unset"
var turn = 0
//var cpu = CPU_level5()

var cpuScore = 0
var playerScore = 0

class ViewController: UIViewController {
     var cpu: CPU = CPU()

    @IBAction func BackButton(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         playerScoreView.text = String(playerScore)
         cpuScoreView.text = String(cpuScore)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateScore(winner: Int) ->Void{
        if(winner == 1){
            playerScore+=1
            playerScoreView.text = String(playerScore)
        }
        else if(winner == 2){
            cpuScore+=1
            cpuScoreView.text = String(cpuScore)
        }
    }

    @IBAction func paper(_ sender: UIButton) {
        if(turn == 0){
            turn = 1;
            playerChoice = "paper"
            cpu.throw_hand()
            text.text = cpu.compare(playerChoice: playerChoice)
            sleep(1)
            updateScore(winner: cpu.getWinner())
            turn = 0;
        }
        else{
            text.text = "waiting for cpu"
        }
    }
 
    @IBAction func Rock(_ sender: UIButton) {
        if(turn == 0){
            turn = 1;
            playerChoice = "rock"
            cpu.throw_hand()
            text.text = cpu.compare(playerChoice: playerChoice)
            sleep(1)
            updateScore(winner: cpu.getWinner())
            turn = 0;
        }
         else{
            text.text = "waiting for cpu"
        }
    
    }
    
    @IBAction func Scissors(_ sender: UIButton) {
        if(turn == 0){
            turn = 1;
            playerChoice = "scissors"
            cpu.throw_hand()
            text.text = cpu.compare(playerChoice: playerChoice)
            sleep(1)
            updateScore(winner: cpu.getWinner())
            turn = 0;
        }
         else{
            text.text = "waiting for cpu"
         }
    }
    
    @IBOutlet weak var text: UITextView!
    
    @IBOutlet weak var cpuScoreView: UITextField!
    
    @IBOutlet weak var playerScoreView: UITextField!
    
    @IBAction func hintButton(_ sender: UIButton) {
        text.text = cpu.getHint()
    }
    
}

