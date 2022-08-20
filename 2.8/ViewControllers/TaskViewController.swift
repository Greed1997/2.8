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
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var leftAnswerButton: UIButton!
    @IBOutlet var rightAnswerButton: UIButton!
    
    var discipline: Discipline!
    var delegateForGreatPerson: GreatPersonDelegate!
    var delegateForTabBar: TaskDisciplineDelegate!
    
    private var questions: [Question] {
        Question.getQuestions(discipline)
    }
    var questionIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        taskLabel.text = discipline.rawValue
        delegateForGreatPerson.setDiscipline(discipline)
        delegateForTabBar.setDiscipline(discipline)
        print("\(self): \(discipline.rawValue)")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.discipline = discipline
        settingsVC.delegate = self
        settingsVC.delegateGreatPerson = delegateForGreatPerson
    }
}
extension TaskViewController: SettingsDisciplineDelegate {
    func setDiscipline(_ newDiscipline: Discipline) {
        discipline = newDiscipline
    }
}
extension TaskViewController {
//    private func settingsButtonPressed() {
//
//    }
}
extension TaskViewController {
    private func updateUI() {
        let currentQuestion = questions[questionIndex]
        questionLabel.text = currentQuestion.title
        
    }
    private func nextQuestion() {
        
    }
}
