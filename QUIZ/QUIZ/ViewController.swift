//
//  ViewController.swift
//  QUIZ
//
//  Created by Hieu on 1/29/18.
//  Copyright © 2018 Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLable: UILabel!
    
    
    @IBOutlet weak var answerLable: UILabel!
    
    let questions = [
        "What is 4 + 4 ?",
        "What is the capital of Japan?",
        "What is swift?"
    ]
    
    let answers = [
        "8",
        "Tokio",
        "programing language"
    ]
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        questionLable.text = questions[index]
    }

    @IBAction func showNextQuestion(_ sender: UIButton) {
        index += 1
        if index == questions.count {
            index = 0
        }
        questionLable.text = questions[index]
        answerLable.text = "???"
    }
    
    
    @IBAction func showAnswer(_ sender: UIButton) {
        answerLable.text = answers[index]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

