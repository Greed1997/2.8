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
class TaskViewController: UIViewController {

    @IBOutlet weak var questionProgressLine: UIProgressView!
    @IBOutlet var taskLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var leftAnswerButton: UIButton!
    @IBOutlet weak var rightAnswerButton: UIButton!
    
    var discipline: Discipline!
    var delegateForGreatPerson: GreatPersonDelegate!
    var delegateForTabBar: TaskDisciplineDelegate!
    var leftIsCorrect: Bool = true
    
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
        settingsVC.delegateGreatPerson = delegateForGreatPerson
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
        questionLabel.text? += "\n \n НЕПРАВИЛЬНО! ВЫБЕРИ ДРУГОЙ ОТВЕТ!"
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
        performSegue(withIdentifier: "showResults", sender: nil)
    }
    
}



