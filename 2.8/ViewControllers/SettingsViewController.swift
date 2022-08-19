//
//  SettingsViewController.swift
//  2.8
//
//  Created by Александр on 19.08.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet var philosophyButton: UIButton!
    @IBOutlet var mathButton: UIButton!
    @IBOutlet var physicButton: UIButton!
    
    var allDisciplines = Discipline.allCases
    var discipline: Discipline!
    var delegate: SettingsDisciplineDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtons(buttons: philosophyButton, mathButton, physicButton)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(discipline.rawValue)
    }
    @IBAction func disciplineButtonPressed(sender: UIButton) {
        delegate.setDiscipline(Discipline(rawValue: sender.titleLabel?.text ?? "Физика") ?? .physic)
    }

}
extension SettingsViewController {
    func setButtons(buttons: UIButton...) {
        for button in buttons {
            button.titleLabel?.text = allDisciplines.removeFirst().rawValue
        }
    }
}
