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
    var resultsCount: Int = 0
    
    private var questions: [Question] = []
    private var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateForGreatPerson.setDiscipline(discipline)
        questions = Question.getQuestions(discipline)
        taskLabel.text = discipline.rawValue
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateContent()
    }
    


    @IBAction func leftButtonPressed() {
        if leftIsCorrect {
            resultsCount += 1
            nextQuestion()
        } else {
            resultsCount -= 1
            updateWhenWrongAnswer()
            leftAnswerButton.backgroundColor = UIColor.systemRed
            leftAnswerButton.isEnabled.toggle()
        }
    }
    
    @IBAction func rightButtonPressed() {
        if !leftIsCorrect {
            resultsCount += 1
            nextQuestion()
        } else {
            resultsCount -= 1
            updateWhenWrongAnswer()
            rightAnswerButton.backgroundColor = UIColor.systemRed
            rightAnswerButton.isEnabled.toggle()
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
        leftAnswerButton.backgroundColor = UIColor.systemYellow
        rightAnswerButton.backgroundColor = UIColor.systemYellow
        
        leftAnswerButton.isEnabled = true
        rightAnswerButton.isEnabled = true
        
        
        taskLabel.text = discipline.rawValue
        
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
        if !(questionLabel.text?.contains("НЕПРАВИЛЬНО!") ?? false) {
        questionLabel.text? += "\n \n НЕПРАВИЛЬНО! ВЫБЕРИ ДРУГОЙ ОТВЕТ!"
        }
    }
}

// MARK: -- other private methods
extension TaskViewController {
    private func nextQuestion() {
        print(resultsCount)
        questionIndex += 1
        if questionIndex < questions.count {
            updateContent()
            return
        } else {
            questionIndex = 0
        }
        performSegue(withIdentifier: "showResults", sender: nil)
    }
}

// MARK -- Segues
extension TaskViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.discipline = discipline
        settingsVC.delegate = self
        settingsVC.delegateGreatPerson = delegateForGreatPerson
        settingsVC.result = resultsCount
        settingsVC.questionsCount = questions.count
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        questions = Question.getQuestions(discipline)
        questionIndex = 0
        resultsCount = 0
        updateContent()
    }
    
}
