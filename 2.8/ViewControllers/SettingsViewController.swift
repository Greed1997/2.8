//
//  SettingsViewController.swift
//  2.8
//
//  Created by Александр on 19.08.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet var philosophyButton: UIButton!
    @IBOutlet var mathButton: UIButton!
    @IBOutlet var physicButton: UIButton!
    
    var allDisciplines = Discipline.allCases
    var discipline: Discipline!
    var delegate: SettingsDisciplineDelegate!
    var delegateGreatPerson: GreatPersonDelegate!
    var result: Int!
    var questionsCount: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(for: philosophyButton, mathButton, physicButton)
        if result == 0 {
            resultsLabel.text = "Вы пока ни на один вопрос правильно не ответили. Хотите сменить тему?"
        } else {
            resultsLabel.text = "Вы с первого раза ответили на \(String(result)) из \(String(questionsCount)) вопросов. Хотите сменить тему?"
        }
    }
    @IBAction func disciplineButtonPressed(sender: UIButton) {
        delegate.setDiscipline(Discipline(rawValue: sender.currentTitle ?? "Физика") ?? .physic)
        delegateGreatPerson.setDiscipline(Discipline(rawValue: sender.currentTitle ?? "Физика") ?? .physic)
    }

}
extension SettingsViewController {
    func setTitle(for buttons: UIButton...) {
        buttons.forEach{ button in
            switch button {
            case philosophyButton: philosophyButton.setTitle(Discipline.philosophy.rawValue, for: .normal)
            case mathButton: mathButton.setTitle(Discipline.math.rawValue, for: .normal)
            default: physicButton.setTitle(Discipline.physic.rawValue, for: .normal)
            }
        }
    }
}
