//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Рафия Сафина on 10.10.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var descriptionResultLabel: UILabel!
    
    var chosenAnswers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateResult()
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
        
}

extension ResultViewController {
    
    private func calculateResult() {
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = chosenAnswers.map { $0.animal }
        
        for animal in animals {
            frequencyOfAnimals[animal, default: 0] += 1
        }
        
        let sortedAnimals = frequencyOfAnimals.sorted {$0.value > $1.value}
        guard let mostFrequencyAnimal = sortedAnimals.first?.key else {return}
        
        upDateUI(with: mostFrequencyAnimal)
        }
    
    
private func upDateUI(with animal: Animal) {
    resultLabel.text = "You are \(animal.rawValue)"
    descriptionResultLabel.text = animal.definition
    }
}
