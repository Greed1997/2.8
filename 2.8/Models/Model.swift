//
//  Question.swift
//  2.8
//
//  Created by Александр on 09.08.2022.
//

enum Discipline: String, CaseIterable {
    case philosophy = "Философия"
    case math = "Математика"
    case physic = "Физика"
}

struct Question {
    let title: String
    let answer: Answer
    
    static func getQuestions(_ discipline: Discipline) -> [Question] {
        switch discipline {
        case .philosophy:
            return QuestionDataManager.shared.philosophyQuestions.shuffled()
        case .math:
            return QuestionDataManager.shared.mathQuestions.shuffled()
        case .physic:
            return QuestionDataManager.shared.physicQuestions.shuffled()
        }
    }
}

struct Answer {
    let correct: String
    let wrong: String
}

struct GreatPerson {
    let name: String
    let image: String
    
    static func getGreatPersons(_ discipline: Discipline) -> [GreatPerson] {
        switch discipline {
        case .philosophy:
            return GreatPersonDataManager.shared.philosophers
        case .math:
            return GreatPersonDataManager.shared.mathematicians
        case .physic:
            return GreatPersonDataManager.shared.physicians
        }
    }
}
