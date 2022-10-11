//
//  ViewController.swift
//  PersonalQuiz
//
//  Created by Рафия Сафина on 10.10.2022.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var questionTitle: UINavigationItem!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleAnswerButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedSlider: UISlider! {
        didSet {
            let answersCount = Float(currentAnswers.count - 1)
            rangedSlider.maximumValue = answersCount
            rangedSlider.value = answersCount / 2
        }
    }
    @IBOutlet var rangedLabels: [UILabel]!
    
    private let questions = Question.getQuestion()
    private var questionIndex = 0
    private var currentAnswers: [Answer] {
        questions[questionIndex].answer
    }
    private var chosenAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func singleAnswerButtonTapped(_ sender: UIButton) {
        guard let buttonIndex = singleAnswerButtons.firstIndex(of: sender) else {return}
        let currentAnswer = currentAnswers[buttonIndex]
        chosenAnswers.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                chosenAnswers.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let index = lrintf(rangedSlider.value)
        chosenAnswers.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else {return}
        
        resultVC.chosenAnswers = chosenAnswers
    }
}

//MARKS
extension QuestionViewController {
    func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        let currentQuestion = questions[questionIndex]
        questionLabel.text = currentQuestion.title
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        progressView.setProgress(totalProgress, animated: true)
        
        title = "Question №\(questionIndex + 1) out of \(questions.count)"
        
        showCurrentAnswers(for: currentQuestion.responseType)
        
        
    }
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
            
        case .single: showSingleAnswers(with: currentAnswers)
        case .multiple: showMultipleAnswers(with: currentAnswers)
        case .ranged: showRangedAnswers(with: currentAnswers)
        }
    }
    private func showSingleAnswers(with answers: [Answer]) {
        singleStackView.isHidden.toggle()
        for (button, answer) in zip(singleAnswerButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
    
    private func showMultipleAnswers(with answers: [Answer]) {
        multipleStackView.isHidden.toggle()
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    private func showRangedAnswers(with answers: [Answer]) {
        rangedStackView.isHidden.toggle()
        rangedLabels.first?.text = answers.first?.title
        rangedLabels.last?.text = answers.last?.title
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}
