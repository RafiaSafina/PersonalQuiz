//
//  Question.swift
//  PersonalQuiz
//
//  Created by Рафия Сафина on 10.10.2022.
//

import Foundation
import CoreText

struct Question {
    let title: String
    let responseType: ResponseType
    let answer: [Answer]
    
    static func getQuestion() -> [Question] {
        [
            Question(
                title: "What food do you prefer?",
                responseType: .single,
                answer: [
                    Answer(title: "steak", animal: .dog),
                    Answer(title: "fish", animal: .cat),
                    Answer(title: "carrot", animal: .rabbit),
                    Answer(title: "salad", animal: .turtle)
                ]
            ),
            Question(
                title: "What do you like the most?",
                responseType: .multiple,
                answer: [
                    Answer(title: "swim", animal: .dog),
                    Answer(title: "sleep", animal: .cat),
                    Answer(title: "run", animal: .rabbit),
                    Answer(title: "lay", animal: .turtle)
                ]
            ),
            Question(
                title: "Do you like rude in a car?",
                responseType: .ranged,
                answer: [
                    Answer(title: "very much", animal: .dog),
                    Answer(title: "do like", animal: .cat),
                    Answer(title: "not so much", animal: .rabbit),
                    Answer(title: "don't like", animal: .turtle)
                ]
            )
        ]
    }
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    let title: String
    let animal: Animal
}

enum Animal: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "You are a dog"
        case .cat:
            return "You are a cat"
        case .rabbit:
            return "You are a rabbit"
        case.turtle:
            return "You are a turtle"
        }
    }
}

