//
//  Question.swift
//  PersonalQuiz
//
//  Created by Рафия Сафина on 10.10.2022.
//

import Foundation

struct Question {
    let title: String
    let responseType: ResponseType
    let answer: [Answer]
}
 
enum ResponseType {
    case single
    case multiple
    case ranged
}
