//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by ae on 2/1/20.
//

import UIKit

class ResultsViewController: UIViewController {

    
    var responses: [Answer]!
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true

    }
    
   func calculatePersonalityResult() {
     var frequencyOfAnswers: [AnimalType: Int] = [:]
    let responseTypes = responses.map { $0.type }

    for response in responseTypes {
       let newCount: Int
       if let oldCount = frequencyOfAnswers[response] {
              newCount = oldCount + 1
       } else {
              newCount = 1
       }
       frequencyOfAnswers[response] = newCount
    }
    
    let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1}.first!.key
    resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
    resultDefinitionLabel.text = mostCommonAnswer.definition
}
}
