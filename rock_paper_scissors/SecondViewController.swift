//
//  SecondViewController.swift
//  rock_paper_scissors
//
//  Created by Andrew's Laptop on 5/31/19.
//  Copyright © 2019 Andrew's Laptop. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var CPU_Choice :CPU = CPU()
    
    @IBAction func Lvl_1(_ sender: Any) {
    CPU_Choice = CPU_level1()
        performSegue(withIdentifier: "HomeScreenSegue", sender: self)
    }
    
    @IBAction func Lvl_2(_ sender: Any) {
        CPU_Choice = CPU_level2()
        performSegue(withIdentifier: "HomeScreenSegue", sender: self)
    }
    
    @IBAction func Lvl_3(_ sender: Any) {
        CPU_Choice = CPU_level3()
        performSegue(withIdentifier: "HomeScreenSegue", sender: self)
    }
    
    @IBAction func Lvl_4(_ sender: Any) {
        CPU_Choice = CPU_level4()
        performSegue(withIdentifier: "HomeScreenSegue", sender: self)
    }
    
    @IBAction func Lvl_5(_ sender: Any) {
        CPU_Choice = CPU_level5()
        performSegue(withIdentifier: "HomeScreenSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : ViewController = segue.destination as! ViewController
        destVC.cpu = CPU_Choice
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
