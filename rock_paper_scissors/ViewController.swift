//
//  ViewController.swift
//  rock_paper_scissors
//
//  Created by Andrew's Laptop on 5/21/19.
//  Copyright © 2019 Andrew's Laptop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     var playerChoice = "unset"
     var turn = 0
     var cpuScore = 0
     var playerScore = 0
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
    
    //sleep is used in functions below in case user decides to spam buttons
    @IBAction func paper(_ sender: UIButton) {
        if(turn == 0){
            turn = 1;
            playerChoice = "paper"
            cpu.throw_hand()
            textView.text = cpu.compare(playerChoice: playerChoice)
            sleep(1)
            updateScore(winner: cpu.getWinner())
            turn = 0;
        }
        else{
            textView.text = "waiting for cpu"
        }
    }
 
    @IBAction func Rock(_ sender: UIButton) {
        if(turn == 0){
            turn = 1;
            playerChoice = "rock"
            cpu.throw_hand()
            textView.text = cpu.compare(playerChoice: playerChoice)
            sleep(1)
            updateScore(winner: cpu.getWinner())
            turn = 0;
        }
         else{
            textView.text = "waiting for cpu"
        }
    }
    
    @IBAction func Scissors(_ sender: UIButton) {
        if(turn == 0){
            turn = 1;
            playerChoice = "scissors"
            cpu.throw_hand()
            textView.text = cpu.compare(playerChoice: playerChoice)
            sleep(1)
            updateScore(winner: cpu.getWinner())
            turn = 0;
        }
         else{
            textView.text = "waiting for cpu"
         }
    }
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var cpuScoreView: UITextField!
    
    @IBOutlet weak var playerScoreView: UITextField!
    
    @IBAction func hintButton(_ sender: UIButton) {
        textView.text = cpu.getHint()
    }
    
}

