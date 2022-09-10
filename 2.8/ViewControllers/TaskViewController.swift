//
//  TaskViewController.swift
//  2.8
//
//  Created by Александр on 14.08.2022.
//  Updated by Olga Yurchuk on 20.08.2022

import UIKit

protocol SettingsDisciplineDelegate {
    func setDiscipline(_ newDiscipline: Discipline)
}
protocol SettingsTypeOfResultDelegate {
    func setTypeOfResult(_ newTypeOfResult: Bool)
}
class TaskViewController: UIViewController {

    @IBOutlet weak var questionProgressLine: UIProgressView!
    @IBOutlet var taskLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var leftAnswerButton: UIButton!
    @IBOutlet var rightAnswerButton: UIButton!
    
    var discipline: Discipline!
    var delegateForGreatPerson: GreatPersonDelegate!
    var delegateForTabBar: TaskDisciplineDelegate!
    var leftIsCorrect: Bool = true
    var typeOfResult: Bool = false
    
    private var questions: [Question] {
        Question.getQuestions(discipline)
    }
    private var questionIndex = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        taskLabel.text = discipline.rawValue
        delegateForGreatPerson.setDiscipline(discipline)
        updateContent()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.discipline = discipline
        settingsVC.delegate = self
        settingsVC.delegateTypeOfResult = self
        settingsVC.delegateGreatPerson = delegateForGreatPerson
        settingsVC.typeOfResult = typeOfResult        
    }

    @IBAction func leftButtonPressed() {
        if leftIsCorrect {
            nextQuestion()
        } else {
            updateWhenWrongAnswer()
        }
        
    }
    
    @IBAction func rightButtonPressed() {
        if !leftIsCorrect {
            nextQuestion()
        } else {
            updateWhenWrongAnswer()
        }
    }
    @IBAction func settingsButtonPressed() {
        allQuestionsAnswered()
    }
}

// MARK: -- Discipline Delegate
extension TaskViewController: SettingsDisciplineDelegate {
    func setDiscipline(_ newDiscipline: Discipline) {
        discipline = newDiscipline
    }
}
// MARK: -- Type of result Delegate
extension TaskViewController: SettingsTypeOfResultDelegate {
    func setTypeOfResult(_ newTypeOfResult: Bool) {
        typeOfResult = newTypeOfResult
    }

}

// MARK: -- Update view
extension TaskViewController {
    private func updateContent(){
        view.backgroundColor = UIColor.white
        let currentQuestion = questions[questionIndex]
        
        // mixing if answers
        leftIsCorrect = Bool.random()
        
        // setting titles of controls
        questionLabel.text = currentQuestion.title
        if leftIsCorrect {
            leftAnswerButton.setTitle(currentQuestion.answer.correct, for: .normal)
            rightAnswerButton.setTitle(currentQuestion.answer.wrong, for: .normal)
        } else {
            leftAnswerButton.setTitle(currentQuestion.answer.wrong, for: .normal)
            rightAnswerButton.setTitle(currentQuestion.answer.correct, for: .normal)
        }
        
        // Setting progress line
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionProgressLine.setProgress(totalProgress, animated: true)
    }
    
    private func updateWhenWrongAnswer(){
        view.backgroundColor = UIColor.systemRed
        questionLabel.text? += "\n \n Ваш ответ неправилен! Подумайте ещё."
    }
}

// MARK: -- other private methods
extension TaskViewController {
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateContent()
            return
        }
        questionIndex = 0
        typeOfResult = true
        performSegue(withIdentifier: "showResults", sender: nil)
    }
    
}

// MARK: -- SettingsBarButton Allert

extension TaskViewController {
        
    func allQuestionsAnswered() {
        if questionIndex == questions.count - 1 {
            return
        } else {
            let alert = UIAlertController(title: "Вы уверены что хотите перейти на экран Settings, не ответив на все вопросы?",
                                          message: nil,
                                          preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Да", style: .default) { _ in
                self.performSegue(withIdentifier: "showResults", sender: nil)
            }
            let noAction = UIAlertAction(title: "Нет", style: .default, handler: nil)
            
            alert.addAction(yesAction)
            alert.addAction(noAction)
            
            present(alert, animated: true)
        }
    }
}
