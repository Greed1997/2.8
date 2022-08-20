//
//  TaskViewController.swift
//  2.8
//
//  Created by Александр on 14.08.2022.
//

import UIKit

protocol SettingsDisciplineDelegate {
    func setDiscipline(_ newDiscipline: Discipline)
}
class TaskViewController: UIViewController {

    @IBOutlet var taskLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var leftAnswerButton: UIButton!
    @IBOutlet weak var rightAnswerButton: UIButton!
    
    var discipline: Discipline!
    var delegateForGreatPerson: GreatPersonDelegate!
    var delegateForTabBar: TaskDisciplineDelegate!
    
    private var questions: [Question] {
        Question.getQuestions(discipline)
    }
    private var questionIndex = 0
//    private var currentQuestion: Question {
//        questions[questionIndex]
//    }
    private var leftIsCorrect = Bool.random()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        taskLabel.text = discipline.rawValue
        delegateForGreatPerson.setDiscipline(discipline)
        updateContent()
        
//        print("\(self): \(discipline.rawValue)")
//        print(currentQuestion)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.discipline = discipline
        settingsVC.delegate = self
        settingsVC.delegateGreatPerson = delegateForGreatPerson
    }

    @IBAction func leftButtonPressed() {
        nextQuestion()
    }
    
    
    @IBAction func rightButtonPressed() {
        nextQuestion()
    }
    
}



// MARK: -- Discipline Delegate
extension TaskViewController: SettingsDisciplineDelegate {
    func setDiscipline(_ newDiscipline: Discipline) {
        discipline = newDiscipline
    }
}

// MARK: -- Update view
extension TaskViewController {
    private func updateContent(){
        let currentQuestion = questions[questionIndex]
        print("update")
        questionLabel.text = currentQuestion.title
        print(currentQuestion.answer.correct)
        print(leftIsCorrect)
        if leftIsCorrect {
            leftAnswerButton.setTitle(currentQuestion.answer.correct, for: .normal)
            rightAnswerButton.setTitle(currentQuestion.answer.wrong, for: .normal)
        } else {
            leftAnswerButton.setTitle(currentQuestion.answer.wrong, for: .normal)
            rightAnswerButton.setTitle(currentQuestion.answer.correct, for: .normal)
        }
    }
}

// MARK: -- other private methods
extension TaskViewController {
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateContent()
        } else { performSegue(withIdentifier: "showResults", sender: nil)}
    }
    
}



