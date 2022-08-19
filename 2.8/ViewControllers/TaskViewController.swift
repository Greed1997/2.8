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

    var discipline: Discipline!
    var delegateForGreatPerson: GreatPersonDelegate!
    var delegateForTabBar: TaskDisciplineDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskLabel.text = discipline.rawValue
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        delegateForGreatPerson.setDiscipline(discipline)
        delegateForGreatPerson.setDiscipline(discipline)
        print(discipline.rawValue)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.discipline = discipline
        settingsVC.delegate = self
    }
}
extension TaskViewController: SettingsDisciplineDelegate {
    func setDiscipline(_ newDiscipline: Discipline) {
        discipline = newDiscipline
    }
}
